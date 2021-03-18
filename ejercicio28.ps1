<#28. Escribir un script que recibe dos parámetros: un directorio y una extensión de
archivo. Para todos los archivos del directorio que tienen la extensión copiarlos en la
carpeta C:\Temp\Usuario creada en el ejercicio 26. Si hay error en la copia
redireccionarlo al archivo errores.log. Pista: bucle Foreach y cmdlet Write-
Error.#>

Param (
    [string]$directorio,
    [string]$extension
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if ($PSBoundParameters.Count -ne 2) {
    Write-Error "Error: Número de parámetros incorrecto."
    Write-Host "Ayuda: $comando -directorio <nombredirectorio> -extension <extensionfichero>"
} else {
    $contenido = Get-ChildItem -Path $directorio\*.$extension

    Foreach ($i in $contenido) {
        Copy-Item -Path $contenido -Destination C:\Temp\Rafa -Force 2> C:\Temp\Rafa\errores.log
    }

    Get-ChildItem -Path C:\Temp\Rafa
}