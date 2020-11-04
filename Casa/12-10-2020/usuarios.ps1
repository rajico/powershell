<#
Script: usuarios.ps1
Fecha: 12 de Octubre 2020
Descripción: Mi primer script. Nos pide introducir usuario y contraseña hasta dejar el usuario vacío.
Almacena los datos introducidos en el fichero usuarios.csv.
#>

$usuario=Read-Host "Escribe nombre de usuario"

while ($usuario -ne $null) {
	$passwd=Read-Host "Escribe la contraseña"
	"$usuario,$passwd" | Out-File -FilePath \\VBOXSVR\Scripts\Casa\12-10-2020\usuarios.csv -NoClobber -Append
	$usuario=Read-Host "Escribe nombre de usuario"
	if ($usuario -eq "") {
		break
	}
}