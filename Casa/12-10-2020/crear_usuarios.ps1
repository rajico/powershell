<#
Script: crear_usuarios.ps1
Fecha: 12 de Octubre 2020
Descripción: Mi primer script. Importa el contenido del fichero usuarios.csv y va leyendo cada lí­nea.
Crea un usuario por cada línea, con la contraseña correspondiente, y los añade al grupo "usuarios".
#>

$usuario=Import-Csv -Path \\VBOXSVR\Scripts\Casa\12-10-2020\usuarios.csv
foreach ($i in $usuario) {
	$passwd=ConvertTo-SecureString $i.passwd -AsPlainText -Force
	New-LocalUser $i.usuario -Password $passwd -AccountNeverExpires -PasswordNeverExpires
	Add-LocalGroupMember -Group usuarios -Member $i.usuario
}