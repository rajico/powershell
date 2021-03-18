<#4. Escribir un script que visualiza por pantalla la fecha actual, y opcionalmente la hora,
en formato: Hoy es dia de mes de año y son las hora horas y minutos minutos.#>

Clear-Host

$respuesta = Read-Host "¿Quieres ver la fecha actual y la hora?"

if ( $respuesta -eq 'si' ) {
    Write-Host "Hoy es $(Get-Date -UFormat "%d") de $(Get-Date -UFormat "%m") de $(Get-Date -UFormat "%Y") y son las $(Get-Date -UFormat "%H") horas y $(Get-Date -UFormat "%M") minutos."
} else {
    Write-Host "Hoy es $(Get-Date -UFormat "%d") de $(Get-Date -UFormat "%m") de $(Get-Date -UFormat "%Y")."
}