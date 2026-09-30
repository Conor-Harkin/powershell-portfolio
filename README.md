# System Information Report

A PowerShell script that collects local Windows system information and exports a summary to CSV.

## Collected information

- Operating system caption and version
- Last boot time
- Computer name, manufacturer, and model
- Installed RAM in GB
- Fixed drive size and free space in GB

## Skills practised

- `Get-CimInstance`
- Objects and properties
- `Select-Object`
- Calculated properties
- `Where-Object`
- Pipelines
- `[pscustomobject]`
- `Export-Csv`

## Usage

Run from PowerShell:

```powershell
.\SystemInfo.ps1
```

## Notes

The script is designed for local Windows information gathering. It should be adapted and tested before use in a production environment.
