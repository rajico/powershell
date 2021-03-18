<# Ejercicio 1. Realizado por Rafael Jiménez Cobos#>

# Pasamos como parámetro un código.

Param (
    [string]$codigo
)

# Limpiamos el prompt.

Clear-Host

# Almaceno en una variable la ruta hacia mi script.

$comando = $MyInvocation.MyCommand.Path

# Control de parámetros. Si no se usa el número de parámetros establecido, termina el script.

if ($PSBoundParameters.Count -ne 1) {
    Write-Error "Error: Número de parámetros incorrecto."
    Write-Host "Ayuda: $comando -codigo <[Ff]echa> <[Rr]ed> <[Dd]irectorio> <[Uu]suario> <[Hh]ostname>"
    exit 1
} else {

    #

    if ( $codigo -like "Fecha" -or $codigo -like "fecha") {
        Get-Date
    }
    if ( $codigo -like "Red" -or $codigo -like "red") {
        Get-NetAdapter
    }
    if ( $codigo -like "Directorio" -or $codigo -like "directorio") {
        pwd
    }
    if ( $codigo -like "Usuario" -or $codigo -like "usuario") {
        $usuario = Read-Host "Introduce el nombre de un usuario"

        if (Get-LocalUser -Name $usuario) {
            $habilitado = (Get-LocalUser -Name $usuario).Enabled
            
            if ( $habilitado ){
                Write-Host "El usuario $usuario está habilitado"
            } else {
                Write-Host "El usuario $usuario no está habilitado"
            }

            $conexion = (Get-LocalUser -Name $usuario).LastLogon

            Write-Host "La última conexión del usuario $usuario fue en $conexion"

        } else {
            Write-Error "El usuario $usuario no existe."
        }

    }
    if ( $codigo -like "Hostname" -or $codigo -like "hostname") {
        Write-Host $env:COMPUTERNAME
    }
}