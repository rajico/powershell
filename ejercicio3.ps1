<#3. Escribir un script que recibe como parámetro un nombre de archivo y si no se pasa el
parámetro el archivo se llamará fichero.txt por defecto. El script debe visualizar
el nombre del archivo que se ha pasado como parámetro o el nombre por defecto.#>

Param (
    [string]$nombrearchivo = 'fichero.txt'
)

Clear-Host

Write-Host "El nombre del archivo es $nombrearchivo."