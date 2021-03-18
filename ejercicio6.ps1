<#6. Escribir un script que reciba varios nombres de archivos de texto como parámetros y
los una en un solo archivo cuyo nombre será la cadena resultado más el nombre del
script y la fecha y hora actual con una precisión de hasta segundos. Todos los
archivos están en la carpeta Documents del perfil de usuario.#>

Clear-Host

[string]$archivos
[datetime] $fecha_hora = Get-Date
[string]$script

if ( $args.Count -gt 0 ) {
    foreach ( $i in $args ){
        $archivos+=$i
    }

    #Tengo que coger solo en nombre eliminando "./" del inicio y ".ps1" del final
    #Con Substring extraigo desde la posición 2 (ya elimino "./") y hasta el tamaño -6 (-6 es la suma de los caracteres ./ y .ps1, así obtengo solo el nombre
    $script=$^.ToString().Substring(2,$^.Length-6)
    
    #Almacenamos el nombre completo en $nombre_fichero
    #Sustituyo los caracteres especiales "/" y ":" que no se permiten para nombres por "_"
    $archivos += $script +$fecha_hora.ToString().Replace(" ","_").Replace("/","_").Replace(":","_")

    #Creamos el fichero en la carpeta Documentos del usuario
    New-Item -Path $home\Documents -Name $archivos -ItemType File -Force
} else {
    Write-Host "Debes introducir algún parámetro."
}