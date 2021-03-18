<#19. Escribir un script que recibe como parámetro un nombre de usuario y visualiza en
pantalla: Nombre completo, identificador de seguridad del usuario y directorio del
perfil de usuario.#>

Param (
    [string]$usuario
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if ( $PSBoundParameters.Count -ne 1 ){
    Write-Error "Error: Número de parámetros incorrecto. Debes introducir un solo parámetro."
    Write-Host "Ayuda: $comando -usuario <nombreusuario>"
} else {
    $comprobacion=$(Get-LocalUser -Name $usuario)
    
    if ( ! ( $comprobacion ) ){
        Write-Host "El usuario $usuario no existe."
    } else {
        Write-Host "Nombre completo del usuario $usuario :" ($comprobacion).FullName
        Write-Host "Identificador del usuario $usuario :" ($comprobacion).SID
        Write-Host "Directorio de perfil del usuario $usuario : C:\Users\$usuario" 
    }
}