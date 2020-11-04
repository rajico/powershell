<#
Script: uso_variables.ps1
Fecha: 27 Octubre 2020
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
