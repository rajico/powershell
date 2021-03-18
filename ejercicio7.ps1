<#7. Crear un script que reciba como parámetro el nombre de una carpeta y genere un
archivo empaquetado y comprimido de esa carpeta como copia de seguridad. Pista:
cmdlet Compress-Archive.#>

Param (
    [string]$carpeta
)

Clear-Host

$mypath = $MyInvocation.MyCommand.Path
$diractual = $(pwd)

if ($PSBoundParameters.Count -ne 1) {
    Write-Error "Error. Número de parámetros incorrecto, debes introducir 1 parámetro"
    Write-Host "Ayuda: $mypath -carpeta <carpeta>"
} else {
    if ( ! ( Test-Path -Path $carpeta ) ){
        Write-Host "La carpeta $carpeta no existe."
    } else {
        Compress-Archive -Path $carpeta -DestinationPath $diractual -Force
    }
}