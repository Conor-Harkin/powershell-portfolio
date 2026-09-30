# Get-SystemInfo.ps1
# Collect local Windows system information and export a CSV report.
#
# Computer Name
# Manufactorer Get-CimInstance -ClassName Manufactorer
# Make
# Model
# OS
# Last boot time LastBootUpTime
# memory FreePhysicalMemory
# Fixed drive space 
# Free drive space
#


$os = Get-CimInstance -ClassName Win32_OperatingSystem 
$cs = Get-CimInstance -ClassName Win32_ComputerSystem 

$systemReport = [pscustomobject]@{
    ComputerName = $cs.Name
    Manufacturer = $cs.Manufacturer
    Model        = $cs.Model
    RAMGB        = [math]::Round($cs.TotalPhysicalMemory / 1GB, 2)
    OS           = $os.Caption
    OSVersion    = $os.Version
    LastBoot     = $os.LastBootUpTime
}


$systemReport |
 Export-Csv -Path "C:\Users\conor.harkin\Desktop\Powershell\systemReport.csv" -NoTypeInformation

