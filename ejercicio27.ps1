<#27. Escribir un script que recibe dos parámetros: un directorio y una extensión de
archivo. Para todos los archivos del directorio que tienen la extensión visualizar los
que tienen un tamaño igual o superior a 512 bytes. Pista: bucle Foreach y
estructura If.#>

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
        $tamano = ($i).Length

        if ( $tamano -gt '512') {
            Write-Host "Fichero $i ocupa $tamano Bytes."
        }
    }
}