## Disable Windows Updates and services that might restart Windows Update
Stop-Service -Name wuauserv -Force
Set-Service -Name wuauserv -StartupType Disabled
Stop-Service -Name bits -Force
Set-Service -Name bits -StartupType Disabled
Stop-Service -Name UsoSvc -Force
Set-Service -Name UsoSvc -StartupType Disabled

## Create PowerShell Script to Disable Updates Across Reboots
# Stop/Disable WUAU Service
Add-Content -Path C:\KillUpdates.ps1 -Value "Stop-Service -Name wuauserv -Force"
Add-Content -Path C:\KillUpdates.ps1 -Value "Set-Service -Name wuauserv -StartupType Disabled"
# Stop/Disable BITS
Add-Content -Path C:\KillUpdates.ps1 -Value "Stop-Service -Name bits -Force"
Add-Content -Path C:\KillUpdates.ps1 -Value "Set-Service -Name bits -StartupType Disabled"
# Stop/Disable Update Orchestrator Service
Add-Content -Path C:\KillUpdates.ps1 -Value "Stop-Service -Name UsoSvc -Force"
Add-Content -Path C:\KillUpdates.ps1 -Value "Set-Service -Name UsoSvc -StartupType Disabled"

# Set Task Variables
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File C:\KillUpdates.ps1"
$Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Hours 1)
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -DontStopOnIdleEnd -ExecutionTimeLimit (New-TimeSpan -Minutes 15)
$Principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

# Create Task
Register-ScheduledTask -TaskName "KillUpdateServices" -Action $Action -Trigger $Trigger -Settings $Settings -Principal $Principal

## Disable Antimalware Realtime Monitoring (required by the Windows CLI Lab)
# This should generate an error and means realtime monitoring is already disabled.
Set-MpPreference -DisableRealtimeMonitoring $true


## Cleaning up interface
# Kill Explorer
Write-Host "Beginning modifications, killing Explorer"
TASKKILL /IM explorer.exe /F
# Cortana
Write-Host "Disable Cortana"
Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCortanaButton" -Type DWord -Value 0
# News and Interests
Write-Host "Turning off News and Interests..."
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Type DWord -Value 2
# Windows Search
Write-Host "Remove Windows Search bar (Search still possible in Menu)"
Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 3
# Show Full File Extensions
Write-Host "Show full file extensions"
Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 0
# Restart Explorer
Write-Host "Restarting Explorer"
Start-Process explorer.exe

## You're all set
Write-Host "Congratulations! You should be all set with a clean desktop and fine experience for labbing. Hack it!"
