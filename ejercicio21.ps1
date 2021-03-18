<#21. Escribir un script que elimine un archivo o directorio pasado como parámetro, y le
pregunte si está seguro de llevar a cabo la acción. Pista cmdlet Remove-Item.#>


Param (
    [string]$item
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if ( $PSBoundParameters.Count -ne 1 ){
    Write-Error "Error: Número de parámetros incorrecto. Debes introducir un solo parámetro."
    Write-Host "Ayuda: $comando -item <directorio> ó <fichero>"
} else {
    if ( ! ( Test-Path -Path $item ) ){
        Write-Host "El fichero o directorio $item no existe."
    } else {
        Remove-Item -Path $item -Force -Confirm
    }
}