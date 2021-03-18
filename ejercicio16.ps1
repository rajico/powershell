<#16. Escribir un script que al ejecutarlo devuelva una lista con los tipos de archivo que
tiene un directorio pasado como parámetro. Pista: arrays y bucle Foreach.#>

Param (
[string] $directorio
)

Clear-Host

$extensiones = $(Get-ChildItem -Path $directorio\* -File).Extension

$ext = @( $extensiones )

Write-Host "Estas son las extensiones de los archivos del directorio $directorio :"

Foreach( $entrada in $ext ) {
    Write-Host $entrada.Split(".")[-1]
}
