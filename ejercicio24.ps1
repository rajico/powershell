<#24. Escribir un script que muestra por pantalla el nombre completo de los propietarios de
los archivos de un directorio pasado como parámetro. Pista: Cmdlet Get-Acl y
bucle Foreach.#>

Param (
    [string]$directorio
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if ( $PSBoundParameters.Count -ne 1 ){
    Write-Error "Error: Número de parámetros incorrecto. Debes introducir un solo parámetro."
    Write-Host "Ayuda: $comando -directorio <directorio>"
} else {
    if ( ! ( Test-Path -Path $directorio ) ){
        Write-Host "El directorio $directorio no existe."
    } else {
        $dire = $(Get-ChildItem -Path $directorio)
        $propietario=$(Get-Acl).Owner
        $nombre=$(Get-LocalUser -Name $usuario).FullName
        Foreach ($i in $dire) {
            Write-Host "Item $i. Propietario: $nombre."
        }
    }
}