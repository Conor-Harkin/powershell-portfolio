#FreeDiskSpace = Win32_logicalDisk Size / FreeSpace * 100 will give a %
#Uptime = Win32_operatingSystem, LocalDateTime - LastBootUpTime will give up time 
#Services

Get-CimInstance -ClassName Win32_LogicalDisk | 

    Where-Object { $_.DriveType -eq 3 } | 
    Select-Object -Property DeviceID, 
        @{Name = 'SizeGB'; Expression = { [math]::Round( $_.Size/ 1GB, 2) }},
        @{Name = 'FreeDiskSpaceGB'; Expression = { [math]::Round($_.FreeSpace / 1GB, 2) }},
	@{Name = '%FreeSpace'; Expression = { '{0}%' -f [math]::Round(($_.FreeSpace/$_.Size)*100,0) }} | Format-Table -AutoSize

$os = Get-CimInstance -ClassName Win32_operatingSystem 

	$BootTime = $os.LastBootUpTime
	$LocalTime = $os.LocalDateTime

	$Runtime = $LocalTime - $BootTime

	$RoundedRunTime = [TimeSpan]::FromSeconds( [math]::Round($Runtime.TotalSeconds,0) )

	
	Write-Host "Uptime: $($RoundedRunTime.ToString('dd\:hh\:mm\:ss'))"
	Write-Host "In the Form DD:MM:HH:SS"

