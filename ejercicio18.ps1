<#18. Escribir un script que recibe un parámetro que indica que información hay que
visualizar por pantalla. Esta puede ser: Nombre del host (hostname), información de la
BIOS, información del procesador, información del modelo y fabricante del equipo.
Pista: estructura Swicth y cmdlet Get-CimInstance.#>

Param (
    [string]$informacion
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if ( $PSBoundParameters.Count -ne 1 ){
    Write-Error "Error: Número de parámetros incorrecto. Debes introducir un solo parámetro."
    Write-Host "Ayuda: $comando -informacion <infoamostrar>"
} else {
    switch ($informacion) {
        'Host' { Write-Host "El nombre de host es"(Get-CimInstance -ClassName Win32_ComputerSystem).Name }
        'BIOS' { Get-CimInstance -ClassName Win32_bios }
        'Procesador' { Get-CimInstance -ClassName Win32_Processor }
        'Modelo' { (Get-CimInstance -ClassName Win32_ComputerSystem).Model }
        'Fabricante' { (Get-CimInstance -ClassName Win32_ComputerSystem).Manufacturer }
        default { Write-Host "No has introducido un valor válido." }
    }
}