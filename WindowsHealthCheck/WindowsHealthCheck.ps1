#FreeDiskSpace = Win32_logicalDisk Size / FreeSpace * 100 will give a %
#Uptime = Win32_operatingSystem, LocalDateTime - LastBootUpTime will give up time 
#Services

Get-CimInstance -ClassName Win32_LogicalDisk | 

    Where-Object { $_.DriveType -eq 3 } | 
    Select-Object -Property DeviceID, 
        @{Name = 'SizeGB'; Expression = { [math]::Round( $_.Size/ 1GB, 2) }},
        @{Name = 'FreeDiskSpaceGB'; Expression = { [math]::Round($_.FreeSpace / 1GB, 2) }},
	@{Name = '%FreeSpace'; Expression = { '{0}%' -f [math]::Round(($_.FreeSpace/$_.Size)*100,0) }}

Get-CimInstance -ClassName Win32_operatingSystem | 
	Select-Object LastBootUptime
	Select-Object LocalDateTime

	$BootTime = Get-CimInstance -ClassName Win32_operatingSystem | Select-Object LastBootUpTime
	$LocalTime = Get-CimInstance -ClassName Win32_operatingSystem | Select-Object LocalDateTime

	$Runtime = $LocalTime - $BootTime

	$Runtime 
