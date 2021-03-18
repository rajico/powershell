<#14. Escribir un guión que mueva todos los programas del directorio actual (archivos
ejecutables) hacia el subdirectorio programas del directorio del perfil de usuario,
muestre los nombres de los que mueve e indique cuántos ha movido o que no ha
movido ninguno. Si el directorio programas no existe, deberá ser creado.#>

Clear-Host

$current = $(pwd)
[int]$contador = 0
$dir = "$HOME\Programas"
$archivos = Get-ChildItem -Path $current\*.exe


if ( ! ( Test-Path -Path $current\*.exe ) ){
    Write-Host "En el directorio actual no se encuentran archivos ejecutables."
} else {
    if ( ! ( Test-Path -Path $dir ) ) {
        Write-Host "No existe el directorio $dir. Vamos a crearlo..."
        New-Item -Path $dir -ItemType Directory -Force
    } else {
        Write-Host "El directorio $dir ya existe."
    }

    Write-Host "Se van a copiar los archivos ejecutables al directorio $dir..."

    foreach ($ejecutables in $archivos) {
        Move-Item -Path $ejecutables -Destination $dir -Force
        $contador++
    }

    Write-Host "Archivos ejecutables movidos: $contador."
    Get-ChildItem -Path $dir

}