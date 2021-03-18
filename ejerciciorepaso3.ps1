<#Escribir un script que realiza lo siguiente :
4. Recibe dos parámetros: un directorio y un nombre de usuario Comprobar que se
reciben ambos parámetros, que el primero es un directorio y el segundo un usuario.
Si no fuera así, en ambos casos hay que terminar el script con un mensaje de error.
5. Comprobar si existe la carpeta C:\tmp\usuario, siendo usuario el que se ha
pasado como parámetro. Si no existe, se crea y se anula la salida de error.
Posteriormente hay que comprobar que la creación del directorio ha tenido éxito. Si
no, se acaba el script.
6. Para todos los archivos y/o directorios del directorio (1er parámetro):
a) Si es un directorio y el usuario (2º parámetro) tiene permiso de lectura mostrar el
número de archivos que contiene. El mensaje a visualizar es: El directorio
DIRECTORIO tiene NUMERO archivos.
b) Si es un archivo normal y el usuario (2º parámetro) tiene permiso para modificar el
archivo visualizar el mensaje El archivo NOMBRE puede modificarse por
USUARIO.
c) Si es un archivo normal y el usuario (2º parámetro) tiene permiso para eliminar el
archivo visualizar el mensaje El archivo NOMBRE puede borrarse por USUARIO.
d) Si el usuario (2º parámetro) no tiene ningún permiso sobre el archivo y/o directorio
se tienen que copiar en el directorio C:\tmp\usuario que se ha creado
anteriormente. La copia de cada archivo se realiza redireccionando la salida de
error al fichero errores.txt situado en la misma carpeta del script.
7. Cuando finalice el proceso anterior, hay que comprobar si ha habido errores durante
la copia de los archivos. Comprobar si el fichero errores.txt tiene algún contenido y si
lo tiene mostrarlo por pantalla.
Pista: ¿Cómo saber si un usuario tiene permisos sobre un archivo y/o directorio? El cmdlet
Get-Acl devuelve el descriptor de seguridad de un archivo o directorio el cual incluye
propiedades como:
✔ Access → Las entradas de la ACL (ACEs) del archivo. Es un array con un objeto por
cada permiso concedido sobre el archivo o directorio (propiedad
FileSystemRights) a una entidad de seguridad (usuario o grupo) (propiedad
IdentityReference).
✔ Owner → Propietario del archivo o directorio.
✔ Group → Grupo del archivo o directorio.
Los permisos son algunos de los que aparecen en este enlace.#>

Param (
    [string]$directorio,
    [string]$usuario
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if ($PSBoundParameters.Count -ne 2) {
    Write-Error "Error: Número de parámetros incorrecto."
    Write-Host "Ayuda: $comando -directorio <nombredirectorio> -usuario <nombreusuario>"
    exit 1
} else {
    if ( ! ( Test-Path -Path $directorio ) ){
        Write-Host "El directorio $directorio no existe"
        exit 1
    } else {
        if ( ! ( Get-LocalUser -Name $usuario ) ){
            Write-Host "El usuario $usuario no existe"
            exit 1
        } else {
            if ( ! ( Test-Path -Path C:\tmp\$usuario ) ){
                Write-Host "No existe el directorio, vamos a crearlo..."
                New-Item -Path C:\tmp\$usuario -ItemType Directory -Force 2> $null
                if ($LASTEXITCODE) {
                    Write-Host "El directorio se ha creado correctamente."
                } else {
                    Write-Host "El directorio NO se ha creado."
                    exit 1
                }

                $compro = Get-ChildItem -Path $directorio -Recurse

                Foreach ($i in $compro) {
                    Write-Host "El item $i"
                }

            } else {
                $compro = Get-ChildItem -Path $directorio -Recurse

                $permisos = (Get-Acl $directorio)

                Foreach ($i in $compro) {
                    if (Test-Path $i -PathType Container) {
                        if ($permisos.Access.FileSystemRights -contains "FullControl" -or "Write*" -and $permisos.Access.IdentityReference -eq "$env:COMPUTERNAME\$usuario") {
                            $cuenta = (Get-ChildItem $i -Recurse).Length
                            Write-Host "El directorio $i tiene $cuenta archivos."
                        }
                    }

                    if (Test-Path $i -PathType Leaf) {
                        if ($permisos.Access.FileSystemRights -contains "FullControl" -or "Modify" -and $permisos.Access.IdentityReference -eq "$env:COMPUTERNAME\$usuario") {
                            Write-Host "El archivo $i puede modificarse por el usuario $usuario."
                        }

                        if ($permisos.Access.FileSystemRights -contains "FullControl" -or "Delete" -and $permisos.Access.IdentityReference -eq "$env:COMPUTERNAME\$usuario") {
                            Write-Host "El archivo $i puede borrarse por el usuario $usuario."
                        }
                    }

                    if ($permisos.Access.IdentityReference -ne "$env:COMPUTERNAME\$usuario"){
                        Copy-Item $i -Destination C:\tmp\$usuario 2> errores.txt

                        if ($LASTEXITCODE) {
                            Write-Host "Archivos/directorios copiados correctamente."
                        } else {
                            Get-Content .\errores.txt
                        }
                    }

                }
            }
        }
    }
}