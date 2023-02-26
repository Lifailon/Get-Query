# Get-Query
### Модуль использующий query.exe для создания вывода Object PowerShell.
Взамен устаревшему модулю **PSTerminalServices**, который более не поддерживается, его вывод может быть неполным, работает медленне, чем query и если при обработке в цикле происходит ошибка (например, RPC недоступен), модуль завершает работу скрипта даже при использовании Jobs.

### Пример работы:
`Import-Module .\Get-Query.psm1` (**[скачать](https://github.com/Lifailon/Get-Query/releases)**) \
`Get-Help Get-Query` \
`Get-Query localhost` по умолчанию \
`Get-Query 192.168.1.1 | ft`

### Версия 1.1.
* Изменен вывод статуса без привязки к локализации на Active и Disconnect
* Добавлен файл psd1 для разбивки версий

> Не зависит от локализации операционной системы.

![Image alt](https://github.com/Lifailon/Get-Query/blob/rsa/Screen/Get-Query-RU.jpg)

![Image alt](https://github.com/Lifailon/Get-Query/blob/rsa/Screen/Get-Query-EN.jpg)
