<#23. Escribir un script que recibe como parámetro un nombre de usuario y muestra cuanto
ocupa su carpeta de perfil. Si no se pasa el parámetro se empleará la carpeta del
perfil del usuario que ejecuta el script. Pista: bucle Foreach.#>

<#Param (
    [string]$usuario = $env:USERNAME
)

Clear-Host

# Alternativa 1: Sacar Length del directorio con Get-ChildItem

$directorio = (Get-ChildItem -Path C:\Users\$usuario | Measure-Object -Property Length -Sum).Sum

Write-Host "El directorio personal del usuario $usuario ocupa $directorio Bytes."

# Alternativa 2: Sacar Length de cada archivo del directorio con Foreach

$dire = (Get-ChildItem -Path C:\Users\$usuario)

Foreach ($i in $dire) {
        $mostrar = (Get-ChildItem -Path C:\Users\$usuario\$i | Measure-Object -Property Length -Sum).Sum
        Write-Host "El fichero $i pesa $mostrar Bytes"
}#>

[string]$usuario = $env:USERNAME

if ( $args.Count -eq 1 ) {
    if(-Not( Test-Path $env:HOMEDRIVE\*\$args )) {
        Write-Host "El usuario $args no tiene carpeta personal"
        exit
    } else {
        Write-Host "Tamaño de la carpeta de perfil de $args : "
        Get-ChildItem $HOME\..\$args | Measure-Object -Property Length -Sum -ErrorAction SilentlyContinue | Select-Object -Property Sum
    }
} else {
    Write-Host "Tamaño de la carpeta de perfil de $usuario :"
    Get-ChildItem $env:USERPROFILE | Measure-Object -Property Length -Sum | Select-Object -Property Sum
}