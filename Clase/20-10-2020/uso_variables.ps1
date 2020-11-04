<#
Script: uso_variables.ps1
Fecha: 20 Octubre 2020
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