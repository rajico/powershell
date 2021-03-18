<#11. Escribir un script que reciba como parámetros el nombre de dos archivos y visualice
por pantalla cuál es más moderno.#>

Param (
    [string]$archivo1,
    [string]$archivo2
)

Clear-Host

$mypath = $MyInvocation.MyCommand.Path

if ($PSBoundParameters.Count -ne 2){
    Write-Error "Error. Número de parámetros incorrecto, debes introducir 2 parámetros"
    Write-Host "Ayuda: $mypath -archivo1 <nombrearchivo1> -archivo2 <nombrearchivo2>"
} else {
    if ( ( Test-Path -Path $archivo1 ) -and ( Test-Path -Path $archivo2 ) ) {
        $fechaarchivo1 = (Get-ChildItem -Path $archivo1).CreationTime
        $fechaarchivo2 = (Get-ChildItem -Path $archivo2).CreationTime

        Write-Host "El archivo $archivo1 fue creado en la fecha $fechaarchivo1."
        Write-Host "El archivo $archivo2 fue creado en la fecha $fechaarchivo2."

        if ( $fechaarchivo1 -lt $fechaarchivo2 ) {
            Write-Host "El archivo $archivo2 es más moderno."
        } else {
            Write-Host "El archivo $archivo1 es más moderno."
        }

    } else {
        Write-Hots "Los archivos no existen."
    }
}