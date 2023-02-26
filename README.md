# Get-Query
### Модуль использующий query.exe для создания вывода Object PowerShell.
На зимену устаревшего модуля **PSTerminalServices**, который более не поддерживается, его вывод может быть неполным, работает медленне, чем query и если при обработке в цикле происходит ошибка (например, RPC недоступен), модуль завершает работу скрипта даже при использовании Jobs. Вывод не зависит от локализации операционной системы.

### Версия 1.1.
* Изменен вывод **Status** без привязки к локализации на **Active** и **Disconnect**
* Добавлен файл *psd1* для разбивки версий

`Get-Help Get-Query` \
`Get-Query localhost` по умолчанию \
`Get-Query 192.168.1.1 | ft`

![Image alt](https://github.com/Lifailon/Get-Query/blob/rsa/Screen/Get-Query-RU.jpg)

![Image alt](https://github.com/Lifailon/Get-Query/blob/rsa/Screen/Get-Query-EN.jpg)
