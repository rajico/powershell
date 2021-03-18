<# Ejercicio 3. Realizado por Rafael Jiménez Cobos#>

Param (
    [string]$directorio
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if ($PSBoundParameters.Count -ne 1) {
    Write-Error "Error: Número de parámetros incorrecto."
    Write-Host "Ayuda: $comando -directorio <nombredirectorio>"
    exit 1
} else {
    if ( ! ( Test-Path -Path $directorio -PathType Container ) ){
        Write-Host "El directorio $directorio no existe o no es un directorio."
        exit 1
    } else {
        $contenido = Get-ChildItem -Path $directorio -Recurse

        Foreach ($item in $contenido) {
            if ( (Test-Path $item -PathType Leaf) -and (($item).Length -gt '5120')) {
                $tamano = (Get-ItemProperty $item).Length
                Write-Host "El item $item es un archivo y tiene un tamaño de $tamano Bytes."
            }

            if ( (Test-Path $item -PathType Leaf) -and (($item).LastWriteTime)) {
                $modificacion = (Get-ItemProperty $item).LastWriteTime
                Write-Host "El item $item es un archivo y su última fecha de modificación es $modificacion."
            }

            if (Test-Path $item -PathType Container) {
                $cuenta = (Get-ChildItem $item -Recurse).Length
                Write-Host "Directorio $item tiene $cuenta archivos."
            }
        }

    }
}