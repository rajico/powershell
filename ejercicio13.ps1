<#13. Escribir un script que reciba un nombre de directorio, validar existencia y condición
de directorio y mostrar nombres de todos los directorios y subdirectorios que
contiene. Pista argumento -Attributes del cmdlet Get-ChildItem.#>

Param (
    [string]$directorio
)

Clear-Host

$mypath = $MyInvocation.MyCommand.Path

if ( $PSBoundParameters.Count -ne 1 ) {
    Write-Error "Error. Número de parámetros incorrecto, debes introducir 1 parámetro"
    Write-Host "Ayuda: $mypath -directorio <directorio>"
} else {
    if ( ! ( Test-Path -Path $directorio ) ){
        Write-Host "El directorio $directorio no existe."
    } else {
        if ( Get-ChildItem -Path $directorio -Attributes Directory ){
            Write-Host "El directorio $directorio existe y es un directorio. Mostrando contenido ..."

            Get-ChildItem -Path $directorio -Recurse

        } 
    }
}