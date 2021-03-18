<#10. Escribir un script que reciba un nombre de archivo como parámetro e indicar,
imprimiendo los mensajes que correspondan, si el archivo es legible, modificable y
ejecutable por el usuario. Pista: cmdlet Get-Acl.#>

Param (
    [string]$archivo
)

Clear-Host
$mypath = $MyInvocation.MyCommand.Path

if ($PSBoundParameters.Count -ne 1) {
    Write-Error "Error. Número de parámetros incorrecto, debes introducir 1 parámetro"
    Write-Host "Ayuda: $mypath -archivo <archivo>"
} else {
    if ( ! ( Test-Path -Path $archivo ) ){
        Write-Host "El archivo $archivo no existe."
    } else {
        
        $todo = (Get-Acl -path $archivo).Access.FileSystemRights -contains "FullControl"
        $modificar = (Get-Acl -path $archivo).Access.FileSystemRights -contains "Modify"
        $ejecutar = (Get-Acl -path $archivo).Access.FileSystemRights -contains "ExecuteFile"
        $leer = (Get-Acl -path $archivo).Access.FileSystemRights -contains "Read"

        if ( $todo ) {
            Write-Host "El archivo $archivo tiene todos los permisos."
        }

        if ( $leer ) {
            Write-Host "El archivo $archivo tiene permisos de lectura."
        }

        if ( $ejecutar ) {
            Write-Host "El archivo $archivo tiene permisos de ejecución."
        }

        if ( $modificar ) {
            Write-Host "El archivo $archivo tiene permisos de modificación."
        }
    }
}