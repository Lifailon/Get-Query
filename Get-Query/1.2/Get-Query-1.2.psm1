function Get-Query {
<#
.SYNOPSIS
Module using query.exe for created object powershell
Does not depend on the localization of the OS
.DESCRIPTION
Example:
Get-Query localhost # default
Get-Query 192.168.1.1
Get-Query 192.168.1.1 -proc # all user process list
Get-Query 192.168.1.1 -proc -user username
.LINK
https://github.com/Lifailon/Get-Query
https://github.com/Lifailon/Remote-Shadow-Administrator
#>
Param (
$srv="localhost",
[switch]$proc,
$user="*"
)
if (!($proc)) {
$Users = New-Object System.Collections.Generic.List[System.Object]
$query = query user /server:$srv
if ($query -ne $null) {
$usr = $query[1..100]
$usr = $usr -replace "(^\s)|(^\>)"
$usr = $usr -replace "\s{2,100}"," "
$split1 = $usr -split "\n"
foreach ($s in $split1) {
$split2 = $s -split "\s"
if ($split2.Count -eq 6) {
if ($split2[2].Length -eq 4) {$status = "Disconnect"
} elseif ($split2[2].Length -eq 6) {$status = "Active"
} elseif ($split2[2].Length -eq 7) {$status = "Active"}
$Users.Add([PSCustomObject]@{
User = $split2[0]
Session = $null
ID = $split2[1]
Status = $status
IdleTime = $split2[3]
LogonTime = $split2[4]+" "+$split2[5]
})
}
if ($split2.Count -eq 7) {
if ($split2[3].Length -eq 4) {$status = "Disconnect"
} elseif ($split2[3].Length -eq 6) {$status = "Active"
} elseif ($split2[3].Length -eq 7) {$status = "Active"}
$Users.Add([PSCustomObject]@{
User = $split2[0]
Session = $split2[1]
ID = $split2[2]
Status = $status
IdleTime = $split2[4]
LogonTime = $split2[5]+" "+$split2[6]
})
}
}
$Users
}
}
if ($proc) {
$Users = New-Object System.Collections.Generic.List[System.Object]
$query = query process $user /server:$srv
if ($query -ne $null) {
$usr = $query[1..1000]
$usr = $usr -replace "(^\s)|(^\>)"
$usr = $usr -replace "\s{2,100}"," "
$split1 = $usr -split "\n"
foreach ($s in $split1) {
$split2 = $s -split "\s"
if ($split2.Count -eq 6) {
$split3 = @($split2[0])
$split3 += $split2[2..5]
$split2 = $split3
}
if ($split2[0] -match "\(") {
$username = "unknown"
} else {
$username = $split2[0]
}
if ($split2.Count -eq 5) {
$Users.Add([PSCustomObject]@{
User = $username
Session = $split2[1]
ID = $split2[2]
PID = $split2[3]
Process = $split2[4]
})
}
if ($split2.Count -eq 4) {
$Users.Add([PSCustomObject]@{
User = $username
Session = $null
ID = $split2[1]
PID = $split2[2]
Process = $split2[3]
})
}
}
$Users
}
}
}