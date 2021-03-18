<#26. Escribir un script que comprueba si existe la carpeta C:\Temp\Usuario, siendo
usuario el nombre del usuario que ejecuta el script. Si no existe, se crea y se
anula la salida de error. Posteriormente hay que comprobar que la creación del
directorio ha tenido éxito. Pista: Cmdlet Test-Path.#>

Clear-Host

$usuario = $env:USERNAME
$directorio = "C:\Temp\$usuario"

if ( ! ( Test-Path -Path $directorio ) ){
    Write-Host "El directorio no existe. Vamos a crearlo ..."
    New-Item -Path $directorio -ItemType Directory -Force 2> $null
} else {
    Write-Host "El directorio existe. Mostrando el directorio ..."
    Get-Item -Path $directorio
}