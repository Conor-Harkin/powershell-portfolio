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
$os.Caption
$os.version
$os.LastBootUpTime

$cs = Get-CimInstance -ClassName Win32_ComputerSystem 
$cs.Name 
$cs.Manufacturer
$cs.Model
$csTotalPhysicalMemory

Get-CimInstance -ClassName Win32_LogicalDisk | 

    Where-Object { $_.DriveType -eq 3 } | 

    Select-Object -Property DeviceID, 

        @{Name = 'SizeGB'; Expression = { [math]::Round($_.Size / 1GB, 2) }}, 

         @{Name = 'FreeSpace'; Expression = { [math]::Round($_.FreeSpace / 1GB, 2) }} 


