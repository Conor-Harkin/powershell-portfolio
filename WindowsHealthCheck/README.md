# Windows Health Check

A PowerShell script that displays basic health information for a local Windows computer.

## Checks

### Fixed-disk space

Lists each fixed disk with:

- Drive letter
- Total size in GB
- Free space in GB
- Percentage of free space
- Status based on free space:
  - `Critical`: less than 10% free
  - `Warning`: 10% to less than 20% free
  - `OK`: 20% or more free

### Uptime

Calculates the time since the computer last booted and displays it in
`DD:HH:MM:SS` format (days, hours, minutes, seconds).

## Skills practised

- `Get-CimInstance`
- `Where-Object` and `Select-Object`
- Calculated properties
- Disk-space calculations
- `if` / `elseif` / `else` conditions
- Working with `TimeSpan`
- `Format-Table` and `Write-Host`

## Usage

Run the script in PowerShell on a Windows computer:

```powershell
.\WindowsHealthCheck.ps1
```

The results are displayed in the console.

## Notes

- The disk check includes fixed disks (`DriveType = 3`).
- The script checks the local computer only.
- Service checks are planned but are not implemented yet.
- Review and test the script before using it in a production environment.
