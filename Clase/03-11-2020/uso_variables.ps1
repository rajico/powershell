<#
Script: uso_variables.ps1
Fecha: 3 Noviembre 2020
Descripción: Aprendiendo variables
#>

# Borramos pantalla
Clear-Host

# Variable de tipo entero
[int] $a = 7
[int] $b = 8
[int] $c = $a + $b
Write-Host "La suma de las 2 variables es: $c"

# Variables de tipo Double
[double] $a = 7.35
[double] $b = 8.98
[int] $c = 6
[double] $d = $a + $b
Write-Host "La suma de las variables $a $b es: $d"
[double] $e = $a + $c
Write-Host "La suma de las variables [double]$a [int]$c : [double] $e"

# Si el tipo de datos es Integer y tiene decimales redondea
[int] $f = $a + $c
Write-Host "La suma de las variables [double]$a [int]$c : [int] $f"

# Variables de tipo String
[string] $mes = "Octubre"
Write-Host "Estamos en el mes de $mes"

# Leyendo un string por teclado
Write-Host "Recogiendo un string por teclado"
[string] $clase = Read-Host "Indica cuál es tu clase favorita"
Write-Host "Tu clase favorita es: $clase"

# Interacción de diferentes tipos de datos
[string] $dia = "20"
[int] $mes = 10

Write-Host -ForegroundColor White -Backgroundcolor Green "Cuando hago operaciones con 2 variables distintas, la operación que realiza es con el tipo de datos de la primera variable"
Write-Host "Ejemplo: Operación sumar [string] + [int]=> " ($dia + $mes)
Write-Host "Ejemplo: Operación sumar [int] + [string]=> " ($mes + $dia)

# Variables tipo DateTime

clear

[datetime] $fecha_hora = "10/27/2020 08:42:30"
[datetime] $fecha = "11/01/2020"

Write-Host "La fecha con hora es $fecha_hora"
Write-Host "La fecha sin hora es $fecha"

$fecha_hora.AddDays(10)

if($fecha_hora -lt $fecha) {
    Write-Host "La fecha más lejana es $fecha"
} else {
    Write-Host "La fecha más lejana es $fecha_hora"
}

clear

[datetime] $fecha_nacimiento = "06/19/1994 00:20:00"

Write-Host "Mi niño nació a las $fecha_nacimiento"
Write-Host "Mi niño nació en el mes de $($fecha_nacimiento.Month)"
Write-Host "Mi niño nació el día $($fecha_nacimiento.Day)"
Write-Host "Mi niño nació el año $($fecha_nacimiento.Year)"
Write-Host "Mi niño nació un $($fecha_nacimiento.DayOfWeek)"
Write-Host "Mi niño nació un $($fecha_nacimiento.DayOfYear)"
Write-Host "10 días después era el: $($fecha_nacimiento.AddDays(10))"

[datetime] $diezDespues = $fecha_nacimiento.AddDays(10)
Write-Host "10 días despues: $diezDespues"

Write-Host $($fecha_nacimiento.ToString())
$fecha_nacimiento.ToString().GetType().Name
[string] $cadena_fecha = $fecha_nacimiento.ToString()

# Boolean
clear
[bool] $hay_datos = $false
Write-Host "El directorio tiene datos? $hay_datos"

<# Creación de cmd-let variable #>
# New Variable con espacios
clear
New-Variable -Name "mi nombre" -Value "Mi nombre y apellido tiene espacios"
Write-Host "El valor de la variable mi nombre es: ${mi nombre}"
Get-Variable

# Limpiar el valor de una variable
Clear
Clear-Variable -Name "mi nombre"
Write-Host "El valor de la variable mi nombre es: ${mi nombre}"

# Modificar el valor de una variable
Clear
Set-Variable -Name "mi nombre" -Value "Rafael Jiménez Cobos"
Get-Variable

# Crear una nueva variable con set si no existe
Clear
Set-Variable -Name numero -Value 11
Write-Host "El valor de la variable numero es: ${numero}"
Get-Variable

# Eliminar variables
Clear
Remove-Variable -Name "mi nombre"
Remove-Variable -Name numero
Get-Variable

# La utilidad New-Variable: Posibilidad de usar opciones
# Variables de solo lectura. No se puede cambiar su valor, salvo con -Force
Clear
New-Variable -Name direccionIp -Option ReadOnly -Value $(Get-NetIPAddress -InterfaceAlias Ethernet -AddressFamily IPv4).IPAddress
Write-Host "Mi dirección IP actual es: ${direccionIP}"
#Get-NetIPAddress -InterfaceAlias Ethernet -AddressFamily IPv4
# Cambio de valor de solo lectura
$direccionIP = "192.168.1.20"
# Cambio de valor de solo lectura usando Set-Variable -Force
Set-Variable -Name "direccionIP" -Value "192.168.1.20" -Force

# Borrar variable de solo lectura
Clear
Remove-Variable -Name direccionIp -Force

# Constantes
New-Variable -Name constante -Value "Esta variable no se puede modificar" -Option Constant
#Al tintentar cambiar genera un error
Set-Variable -Name constante -Value "otro valor distinto" -Force
# Borrar constante
Remove-Variable -Name constante -Force