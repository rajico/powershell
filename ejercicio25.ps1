<#25. Escribir un script que recibe como parámetro un nombre de archivo e indica si el
usuario que ejecuta el script es el propietario, y si no lo es, que muestre el usuario
propietario y su nombre completo. Pista: Pista: Cmdlet Get-Acl.#>

Param (
    [string]$archivo
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if ( $PSBoundParameters.Count -ne 1 ){
    Write-Error "Error: Número de parámetros incorrecto. Debes introducir un solo parámetro."
    Write-Host "Ayuda: $comando -archivo <nombrearchivo>"
} else {
    if ( ! ( Test-Path -Path $archivo ) ){
        Write-Host "El fichero $archivo no existe."
    } else {
        $comprueba = Get-ChildItem $archivo | Get-Acl

        if ( $comprueba.Owner -eq "$env:COMPUTERNAME\$env:USERNAME" ){
            Write-Host "El usuario propietario es $env:USERNAME, que está ejecutando este script"
        } else {
        $aux = $comprueba.Owner
        $propietario = (Get-LocalUser $aux.Split('\')[1]).FullName
        Write-Host "Usuario propietario: $aux, Nombre completo: $propietario"
        }
    }
}

