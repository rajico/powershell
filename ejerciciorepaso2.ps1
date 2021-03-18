<#Escribir un script que realiza lo siguiente :#>

<#1. Recibe un parámetro que puede ser uno de los siguientes: Ejecución, Parado.
Comprobar que se recibe el parámetro y que su valor es alguno de los admitidos. Si
no fuera así, hay que terminar el script con un mensaje de error que muestre la
sintaxis del script.#>

<#2. Realizar un listado de los servicios que se encuentran en el estado indicado por el
parámetro pasado. Para cada servicio habrá que hacer lo siguiente:

a) Si está en ejecución y el servicio puede ser pausado y reanudado hay que
mostrar la descripción del servicio.

b) Si está en ejecución y el servicio puede ser parado hay que mostrar los servicios
que dependen de él.

c) Si está parado hay que mostrar el tipo de inicio. En función del tipo de inicio hacer
lo siguiente:

• Si el tipo de inicio es manual hay que arrancar el servicio. Comprobar el
arranque y mostrar un mensaje indicado si ha arrancado o no.

• Si es inicio retrasado mostrar el tipo de servicio.

• Si el servicio está deshabilitado mostrar el mensaje El servicio NOMBRE está
deshabilitado..

#>

<#3. Al final hay que indicar cuantos servicios había en el listado.
Las propiedades y métodos de un objeto de la clase ServiceController ofrecen toda
la información de un servicio. Referencia completa del objeto ServiceController.#>

Param (
    [string]$estado
)

Clear-Host

$comando = $MyInvocation.MyCommand.Path

if (($PSBoundParameters.Count -ne 1) -and ($estado -ne "Ejecucion") -or ($PSBoundParameters.Count -ne 1) -and ($estado -ne "Parado") ) {
    Write-Error "Error: Número de parámetros incorrecto."
    Write-Host "Ayuda: $comando -estado 'Ejecucion' ó 'Parado'."
    exit 1
} else {
    if ( $estado -eq "Ejecucion" ) {
        $servicios=$(Get-Service | Where-Object -FilterScript {$_.CanPauseAndContinue})

        foreach ($i In $servicios) {
            $servicio =  $i.Name
            Get-Service -Name $servicio 
            $ejecuci++
        }
        Write-Host ""
        Write-Host "El numero de procesos que pueden ser pausados y reanudados es: $ejecuci"

        Write-Host ""

        $servicios2=$(Get-Service | Where-Object -FilterScript {$_.CanStop})

        foreach ($a in $servicios2) {
            $servicio2 = $a.Name
            write-host "Del servicio $servicio2 dependen:"
            $depende = $a.DependentServices
            if ($depende -ne $null){
                Write-Host "$depende"
            }
            else {
                Write-Host "Ningun servicio depende de el"
            }
            write-host "----------------------------------------------------"
            $pparados++
        }
            Write-Host ""
            Write-Host "El numero de procesos que pueden ser parados es: $pparados"
        }

    if ( $estado -eq "Parado" ) {
        $servicios3=$(Get-Service | Where-Object -Property Status -eq "stopped")
        $Manual=0
        $retrasado=0
        $deshabilitado=0
        foreach ($archivo In $servicios3) {
            $nombre =  $archivo.Name
            $tipo =  $archivo.StartType
            if ($tipo -eq "Manual"){
                Start-Service $nombre 2>$null
                $estado = $archivo.Status
                if ("estado" -eq "Running"){
                    Write-Host "El servicio $nombre se ha arrancado correctamente"
                }
                else{
                    Write-Host "El servicio $nombre no se ha arrancado correctamente"
                }
                $Manual++           
            }
            elseif ($tipo -eq "AutomaticDelayedStart"){
                Write-Host "El servicio $nombre es del tipo arraque retraso (AutomaticDelayedStart)"
                $retrasado++           
            }
            elseif ($tipo -eq "Disabled"){
                Write-Host "El servio $nombre está deshabilitado"
                $deshabilitado++           
            }
      }
        
    Write-Host "El numero de procesos parados de arranque manual es: $manual"
    Write-Host "El numero de procesos parados de arranque retrasado es: $retrasado"
    Write-Host "El numero de procesos parados deshabilitados es: $deshabilitado"

    }

}