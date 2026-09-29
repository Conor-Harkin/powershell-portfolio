# Get-SystemInfo.ps1
# Collect local Windows system information and export two CSV reports.
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
$operatingReport =$os |
    Select-Object -Property Caption, Version, LastBootUpTime 

$operatingReport |
    Export-Csv -Path "C:\Users\conor.harkin\Desktop\Powershell\operating-report.csv" -NoTypeInformation

$cs = Get-CimInstance -ClassName Win32_ComputerSystem 
$computerReport = $cs |
    Select-Object -Property Name, Manufacturer, Model,
    @{Name = 'RAM'; Expression = { [math]::Round($_.TotalPhysicalMemory / 1GB, 2) }} 

$computerReport |
    Export-Csv -Path "C:\Users\conor.harkin\Desktop\Powershell\computer-report.csv" -NoTypeInformation

$computerReport | Format-List


# Get-CimInstance -ClassName Win32_LogicalDisk | 

 #   Where-Object { $_.DriveType -eq 3 } | 
 #   Select-Object -Property DeviceID, 
  #      @{Name = 'SizeGB'; Expression = { [math]::Round($_.Size / 1GB, 2) }}, 
   #      @{Name = 'FreeGB'; Expression = { [math]::Round($_.FreeSpace / 1GB, 2) }} 
