<#Escribir un script que realiza lo siguiente :#>

<#1. Recibe dos parámetros: un directorio y un patrón de archivo (una cadena de texto sin
caracteres comodines). Comprobar que se reciben ambos parámetros y que el
primero es un directorio. Si no fuera así, en ambos casos hay que terminar el script
con un mensaje de error.#>

<#2. Comprobar si existe la carpeta C:\tmp\usuario, siendo usuario el que ejecuta
el script. Si no existe, se crea y se anula la salida de error. Posteriormente hay que
comprobar que la creación del directorio ha tenido éxito. Si no, se acaba el script.#>


<#3. Para todos los archivos del directorio (1er parámetro) cuyo nombre se ajusta al patrón
(2º parámetro) hacer lo siguiente:
a) Si es un directorio mostrar el número de archivos que contiene. El mensaje a
visualizar es: El directorio DIRECTORIO tiene NUMERO archivos.
b) Si es un archivo normal y su tamaño es mayor o igual a 1 KB visualizar su nombre y
tamaño. El mensaje a visualizar es El archivo NOMBRE tiene un tamaño de
TAMAÑO bytes.
c) Los ficheros que no superan el KB se tienen que copiar en el directorio C:\tmp\
usuario que se ha creado anteriormente. La copia de cada archivo se realiza
redireccionando la salida de error al fichero errores.txt situado en la misma
carpeta del script.#>


<#4. Cuando finalice el proceso anterior, hay que comprobar si ha habido errores durante
la copia de los archivos. Comprobar si el fichero errores.txt tiene algún contenido y si
lo tiene mostrarlo por pantalla.#>

Param (
    [string]$directorio,
    [string]$patron
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if ($PSBoundParameters.Count -ne 2) {
    Write-Error "Error: Número de parámetros incorrecto."
    Write-Host "Ayuda: $comando -directorio <nombredirectorio> -patron <patronfichero>"
    exit 1
} else {
     if ( ! (Test-Path -Path $directorio ) ){
        Write-Error "No se encuentra el directorio"
        Write-Host "El directorio $directorio no existe."
        exit 1
     } else {
        if ( ! ( Test-Path -Path C:\tmp\$env:USERNAME ) ){
            Write-Host "No existe el directorio temporal, vamos a crearlo"
            New-Item -Path C:\tmp\$env:USERNAME -ItemType Directory 2> $null
            if ($LASTEXITCODE) {
                Write-Host "El directorio se ha creado correctamente."
            } else {
                Write-Host "El directorio NO se ha creado."
                exit 1
            }

            $contenido = Get-ChildItem -Path $directorio\*$patron*

            Foreach ($i in $contenido) {
                if ( Test-Path $i -PathType Container) {
                    $cuenta = (Get-ChildItem $i -Recurse).Length
                    Write-Host "Directorio $i tiene $cuenta archivos."
                }

                if ( (Test-Path $i -PathType Leaf) -and (($i).Length) -ge '1024' ) {
                    $tamano = (Get-ItemProperty $i).Length
                    Write-Host "El archivo $i tiene un tamaño de $tamano Bytes."
                }

                if ( (Test-Path $i -PathType Leaf) -and (($i).Length) -lt '1024' ) {
                    Write-Host "Copiando $i a C:\tmp\$env:USERNAME ..."
                    Copy-Item $i -Destination C:\tmp\$env:USERNAME 2> C:\tmp\$env:USERNAME\errores.txt

                    if ($LASTEXITCODE) {
                        Write-Host "Archivo copiado correctamente."
                    } else {
                        Get-Content C:\tmp\$env:USERNAME\errores.txt
                    }

                }

            }

        } else {
            Write-Host "El directorio C:\tmp\$env:USERNAME ya existe."

            $contenido = Get-ChildItem -Path $directorio\*$patron*

            Foreach ($i in $contenido) {
                if ( Test-Path $i -PathType Container) {
                    $cuenta = (Get-ChildItem $i -Recurse).Length
                    Write-Host "Directorio $i tiene $cuenta archivos."
                }

                if ( (Test-Path $i -PathType Leaf) -and (($i).Length) -ge '1024' ) {
                    $tamano = (Get-ItemProperty $i).Length
                    Write-Host "El archivo $i tiene un tamaño de $tamano Bytes."
                }

                if ( (Test-Path $i -PathType Leaf) -and (($i).Length) -lt '1024' ) {
                    Write-Host "Copiando $i a C:\tmp\$env:USERNAME ..."
                    Copy-Item $i -Destination C:\tmp\$env:USERNAME 2> C:\tmp\$env:USERNAME\errores.txt

                    if ($LASTEXITCODE) {
                        Write-Host "Archivo copiado correctamente."
                    } else {
                        Get-Content C:\tmp\$env:USERNAME\errores.txt
                    }

                }

            }


        }
     }
}