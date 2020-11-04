<#
Script: Hola_Mundo1.ps1
Fecha: 13 de Octubre 2020
Descripción: Mi primer script. Dice Hola Mundo y Emite por pantalla un listado del directorio
#>

# Borramos la pantalla
Clear-Host
# Escribimos Hola Mundo
Write-Host -ForegroundColor DarkRed -BackgroundColor White "Hola Mundo"
# Pedimos un valor
$edad = Read-Host "Introduce un valor"
# Escribimos el valor de la variable
Write-Host "Mi edad es $edad"
# Listamos el directorio
Get-ChildItem
