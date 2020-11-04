<#
Script: crear_usuarios.ps1
Fecha: 12 de Octubre 2020
Descripci�n: Mi primer script. Importa el contenido del fichero usuarios.csv y va leyendo cada l�nea.
Crea un usuario por cada l�nea, con la contrase�a correspondiente, y los a�ade al grupo "usuarios".
#>

$usuario=Import-Csv -Path \\VBOXSVR\Scripts\Casa\12-10-2020\usuarios.csv
foreach ($i in $usuario) {
	$passwd=ConvertTo-SecureString $i.passwd -AsPlainText -Force
	New-LocalUser $i.usuario -Password $passwd -AccountNeverExpires -PasswordNeverExpires
	Add-LocalGroupMember -Group usuarios -Member $i.usuario
}