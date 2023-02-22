# Get-Query
### Модуль использующий query.exe для создания вывода Object PowerShell.
Был вдохнавлен модулем **PSTerminalServices**, который на сегодняшний день устарел и не поддерживается, его вывод бывает неполным, если при обработке в цикле происходит ошибка, модуль завершает работу скрипта даже при использовании Jobs.

### Пример работы:
`Import-Module` **[Get-Query.psm1](https://github.com/Lifailon/Get-Query/releases)** \
`Get-Help Get-Query` \
`Get-Query localhost` по умолчанию \
`Get-Query 192.168.1.1 | ft`

> Не зависит от локализации операционной системы.

![Image alt](https://github.com/Lifailon/Get-Query/blob/rsa/Screen/Get-Query-RU.jpg)

![Image alt](https://github.com/Lifailon/Get-Query/blob/rsa/Screen/Get-Query-EN.jpg)
