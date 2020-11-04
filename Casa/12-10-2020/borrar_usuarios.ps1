<#
Script: borrar_usuarios.ps1
Fecha: 12 de Octubre 2020
Descripción: Mi primer script. Importa el contenido del fichero usuarios.csv y va leyendo cada lí­nea.
Borra cada usuario que se encuentre en el fichero usuarios.csv.
#>

$usuario=Import-Csv -Path \\VBOXSVR\Scripts\Casa\12-10-2020\usuarios.csv
foreach ($i in $usuario) {
	Remove-LocalUser $i.usuario
}