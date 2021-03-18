<#12. Escribir un script que reciba varios nombres de archivo como parámetros, y para
cada uno validar si el archivo existe tiene extensión txt, y si es así mostrarlo en
pantalla paginando.#>

Clear-Host

[string]$archivos

if ( $args.Count -gt 0 ) {
    foreach ( $i in $args ){
        $archivos+=$i

        if ( Test-Path -Path $i ) {
            Write-Host "El archivo $i existe."

            $file = ( Get-ChildItem -Path $i ).Extension

            if ( $file -eq ".txt" ) {
                Get-Item $i | Out-Host -Paging
                #Alternativa
                Write-Host "Su contenido: "
                Get-Content $i | Out-Host -Paging
            } else {
                Write-Host "El fichero $i no es .txt."
            }

        } else {
            Write-Host "El archivo $i no existe."
        }
    }
} else {
    Write-Host "Debes introducir algún parámetro."
}