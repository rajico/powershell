<#22. Escribir un script que recibe como parámetros el nombre de un directorio y una
extensión de archivo. Debe listar todos los archivos de esa extensión que haya a
partir del directorio. Pista: cmdlet Get-ChildItem.#>

Param (
    [string]$directorio,
    [string]$extension
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if ( $PSBoundParameters.Count -ne 2 ){
    Write-Error "Error: Número de parámetros incorrecto. Debes introducir dos parámetros."
    Write-Host "Ayuda: $comando -directorio <directorio> -extension <extension>"
} else {
    if ( ! ( Test-Path -Path $directorio ) ) {
        Write-Host "El directorio $directorio no existe."
    } else {
        if ( ! ( Get-ChildItem -Path $directorio\*.$extension -Recurse ) ) {
            Write-Host "No existen ficheros .$extension en el directorio $directorio."
        } else {
            Get-ChildItem -Path $directorio\*.$extension -Recurse
        }
    }
}