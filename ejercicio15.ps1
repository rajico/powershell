<#15. Escribir un script que visualice por pantalla cuanto ocupan los archivos con una
determinada extensión que hay en un directorio, ambos pasados como parámetros.
Si no se pasa el directorio como parámetro, entonces será por defecto el directorio
activo. Pista: bucle Foreach, cmdlet Get-ItemProperty y expresiones
aritméticas.#>

Param (
    [string]$extension,
    [string]$directorio = $(pwd)
)

Clear-Host

$mypath = $MyInvocation.MyCommand.Path
$ruta = $(Get-ChildItem -Path $directorio\*.$extension)

if ( ! ( Test-Path -Path $directorio ) ){
    Write-Host "El directorio $directorio no existe."
} else {
    if ( ! ( Test-Path -Path $directorio\*.$extension ) ){
        Write-Host "No hay ficheros con la extensión $extension en el directorio $directorio."
    } else {
        foreach ($i in $ruta) {
            $mostrar = (Get-ChildItem -Path $i | Measure-Object -Sum Length).Sum
            Write-Host "El fichero $i pesa $mostrar Bytes"
        }
     }
}