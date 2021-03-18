<#2. Escribir un script que recibe dos parámetros: el nombre de un archivo y un directorio.
Tiene que comprobar si el archivo existe formado la ruta completa con su nombre y
el directorio. Visualizar posteriormente el resultado de ejecución del comando con
una variable especial.#>

Param (
    [string]$nombrefichero,
    [string]$directorio
)

Clear-Host

$comprobacion=$(Test-Path -Path $directorio\$nombrefichero)
$mypath = $MyInvocation.MyCommand.Path

if ($PSBoundParameters.Count -ne 2){
    Write-Error "Error. Número de parámetros incorrecto, debes introducir 2 parámetros"
    Write-Host "Ayuda: $mypath -nombrefichero <nombrefichero> -directorio <directorio>"
} else {
    if ( $comprobacion ){
        Write-Host "La ruta es correcta. Mostrando $directorio\$nombrefichero ..."
        Get-ChildItem -Path $directorio\$nombrefichero
    } else {
        Write-Error "La ruta es incorrecta."
    }
}