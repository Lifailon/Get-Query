function Get-Query ($srv="localhost") {
<#
.SYNOPSIS
Module using query.exe for created object powershell
Does not depend on the localization of the OS
.DESCRIPTION
Example:
Get-Query localhost # default
Get-Query 192.168.1.1
.LINK
https://github.com/Lifailon/Get-Query
https://github.com/Lifailon/Remote-Shadow-Administrator
#>
$Users = New-Object System.Collections.Generic.List[System.Object]
$query = query user /server:$srv
if ($query -ne $null) {
$usr = $query[1..100]
$usr = $usr -replace "^\s"
$usr = $usr -replace "\s{2,100}"," "
$split1 = $usr -split "\n"
foreach ($s in $split1) {
$split2 = $s -split "\s"
if ($split2.Count -eq 6) {
$Users.Add([PSCustomObject]@{
User = $split2[0]
Session = $null
ID = $split2[1]
Status = $split2[2]
IdleTime = $split2[3]
LogonTime = $split2[4]+" "+$split2[5]
})
}
if ($split2.Count -eq 7) {
$Users.Add([PSCustomObject]@{
User = $split2[0]
Session = $split2[1]
ID = $split2[2]
Status = $split2[3]
IdleTime = $split2[4]
LogonTime = $split2[5]+" "+$split2[6]
})
}
}
$Users
}
}