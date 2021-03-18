<#17. Escribir un script que reciba como parámetro el nombre de un archivo y compruebe
si existe en la carpeta personal del usuario o alguna de sus subdirectorios. Visualizar
un mensaje indicando si existe o no. Pista: comando Get-ChildItem.#>

Param (
    [string]$archivo
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if ( $PSBoundParameters.Count -ne 1 ){
    Write-Error "Error: Número de parámetros incorrecto. Debes introducir un solo parámetro."
    Write-Host "Ayuda: $comando -archivo <nombrearchivo>"
} else {
    if ( ! ( Get-ChildItem -Path $HOME\$archivo -Recurse ) ){
        Write-Host "El archivo $archivo no se encuentra."
    } else {
        Write-Host "Se ha encontrado el archivo $archivo."
    }
}