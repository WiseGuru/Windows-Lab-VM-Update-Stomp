## Work in Progress
# This script does not return your lab VM to a pre-run state.
# I wanted a quick way to delete the task and script while testing.

## Delete the file
Remove-Item -Path C:\KillUpdates.ps1 -Force
## Delete the task
Unregister-ScheduledTask -TaskName "KillUpdateServices" -Confirm:$false
