<#20. Escribir un script que comprueba si el usuario que lo ejecuta es administrador y
visualice un mensaje indicándolo.
#>

$usuario = $env:USERNAME

if ( Get-LocalGroupMember -Group Administradores -Member $usuario ) {
    Write-Host "$usuario sí es administrador."
} else {
    Write-Host "$usuario no es administrador."
}