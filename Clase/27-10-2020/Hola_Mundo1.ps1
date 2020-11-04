<#
Script: Hola_Mundo1.ps1
Fecha: 20 de Octubre 2020
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
Write-Host -ForegroundColor Cyan -BackgroundColor Black "Directorio Actual"
Get-ChildItem

# Obtiene la fecha
Write-Host -ForegroundColor Cyan -BackgroundColor Black "Fecha Actual"
Get-Date

# Salida por consola
Write-Host "Este texto aparece por pantalla"
Write-Output "Segundo texto por pantalla"
Out-Host -InputObject "Tercer texto por pantalla"

# Directorio Activo
Write-Host -ForegroundColor Cyan -BackgroundColor Black "Obteniendo directorio actual"
Get-Location
#Alias
pwd

# Ver las Ips de las tarjetas de red
Write-Host -ForegroundColor Cyan -BackgroundColor Black "Info Ethernet"
Get-NetIPAddress -InterfaceAlias Ethernet

