<#1. Escribir un script que muestra en pantalla el nombre del usuario que ejecuta el script,
su directorio personal y la fecha del sistema.#>

Clear-Host

Write-Host "Hola $env:USERNAME. Tu directorio personal es $HOME y la fecha del sistema es $(Get-Date)"