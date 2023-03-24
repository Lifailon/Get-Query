# Get-Query
### Модуль использующий query.exe для создания вывода Object PowerShell.
На замену устаревшего модуля **PSTerminalServices**, который более не поддерживается, его вывод мог быть неполным, работает медленне, чем query и если при обработке в цикле происходит ошибка (например, RPC недоступен), модуль завершает работу скрипта даже при использовании Jobs.

> Вывод не зависит от локализации операционной системы.

`Get-Help Get-Query` \
`Get-Query localhost` по умолчанию \
`Get-Query 192.168.1.1 | ft` \
`Get-Query 192.168.1.1 -proc` список всех пользовательских процессов (по умолчанию -user *) \
`Get-Query 192.168.1.1 -proc -user username`

Для теневого подключения к выбранному сеансу воспользуйтесь данной конструкцией:
```PowerShell
$srv = "localhost"
$id = Get-Query $srv | ogv -PassThru | select -ExpandProperty id
mstsc /v:$srv /shadow:$id /control /noconsentprompt
```

![Image alt](https://github.com/Lifailon/Get-Query/blob/rsa/Screen/Get-Query-RU.jpg)

![Image alt](https://github.com/Lifailon/Get-Query/blob/rsa/Screen/Get-Query-EN.jpg)
