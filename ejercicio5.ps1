<#5. Escribir un script que recibe como parámetro la extensión de un archivo.
Posteriormente crea un directorio temporal para el usuario que ejecuta el script en el
directorio C:\temp con el mismo nombre del usuario y copia allí todos los archivos
con dicha extensión.#>

Param (
    [string]$extension
)

Clear-Host

$mypath = $MyInvocation.MyCommand.Path
$temporal = "C:\tmp\$env:USERNAME"

if ( $PSBoundParameters.Count -ne 1 ) {
    Write-Error "Error. Número de parámetros incorrecto, debes introducir 1 parámetro"
    Write-Host "Ayuda: $mypath -extension <extension>"
} else {
    if ( ! ( Test-Path -Path $temporal ) ){
        Write-Host "Creando la carpeta $temporal ..."
        New-Item -Path $temporal -ItemType Container
    } else {
        Write-Host "El directorio ya existe."
    }

    $directorio = Read-Host "Escribe la ruta del directorio donde se encuentran los archivos .$extension"

    if ( ! ( Test-Path -Path $directorio ) ){
        Write-Host "El directorio no existe."
    } else {
        $archivos = $(Test-Path -Path $directorio\*.$extension)

        if ( ! ( Test-Path -Path $directorio\*.$extension ) ){
            Write-Host "No existen ficheros .$extension en este directorio."
        } else {
            Write-Host "Copiando ficheros .$extension a $temporal ..."
            Copy-Item -Path $directorio\*.$extension -Destination $temporal -Recurse
            Get-ChildItem -Path $temporal
        }
    }
}