<#8. Escribir un script que reciba como parámetro un número de MB y visualiza cuantos
bytes son.#>

Param (
    [int]$mb
)

Clear-Host

if ($PSBoundParameters.Count -ne 1) {
    Write-Error "Error. Número de parámetros incorrecto, debes introducir 1 parámetro"
    Write-Host "Ayuda: $mypath -mb <nummb>"
} else {
    $total = $mb*1024*1024
    Write-Host "$mb MegaBytes son $total Bytes."
}