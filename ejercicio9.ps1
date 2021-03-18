<#9. Escribir un script que recibe tres parámetros que son nombres de archivos y
visualizar la suma del espacio que ocupan. Pista: cmdlet Get-ItemProperty.#>

<#Param (
    [string]$archivo1,
    [string]$archivo2,
    [string]$archivo3
)#>

Clear-Host

<#if ($PSBoundParameters.Count -ne 3) {
    Write-Error "Error. Número de parámetros incorrecto, debes introducir 3 parámetros"
    Write-Host "Ayuda: $mypath -archivo1 <archivo1> -archivo2 <archivo2> -archivo3 <archivo3>"
} else {
    $tamano1 = $(Get-ItemProperty -Path $archivo1).Length
    Write-Host "Tamaño del archivo $archivo1 : $tamano1"
}#>

[string]$archivos

if ( $args.Count -eq 3 ) {
    foreach ( $i in $args ){
        $archivos+=$i
        $mostrar = (Get-ChildItem -Path $i | Measure-Object -Sum Length).Sum
        Write-Host "El fichero $i pesa $mostrar Bytes"
    }

        $mostrar = (Get-ChildItem -Path $args | Measure-Object -Sum Length).Sum
        Write-Host "El tamaño total es $mostrar Bytes"

} else {
    Write-Host "Debes introducir 3 parámetros."
}

