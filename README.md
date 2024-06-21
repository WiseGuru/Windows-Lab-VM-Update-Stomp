# Windows Lab VM Update-Stomp
This is an effort to kill Windows Update in a lab environment where updates cause problems with the activities.
As a bonus are various cosmetic changes (hiding the Search bar, disables News and Weather, etc.) that I like having on Windows machines I use.

To run the script, run Powershell as an administrator, and copy/paste the code from [KillWindowsUpdates.ps1](https://github.com/WiseGuru/Windows-Lab-VM-Update-Stomp/blob/main/KillWindowsUpdates.ps1) into the terminal.
This script will:
1. Kill any active update process
2. Disable all update services
3. Create a task that kills processes and disables update services to run at login and then every 15 minutes (you are welcome to adjust this lower, but I didn't find it necessary)
4. Disable Antimalware Realtime Monitoring (which is required by at least one lab)
5. Clean up the interface (disable Cortana, hide News and Interests, hide the Search bar because you can just open the start menu and type to search, and show full file extensions.) and restart Explorer to make the changes take effect.

The script should be thoroughly commented and clearly written, but let me know if I need to clarify something.

After you've run the script, you can run the following command to get the status of the update services that should be stopped.

```Powershell
Get-Service -Name wuauserv,bits,UsoSvc,InstallService
```

For more details and context, please check out the original post on my site: [MaxwellCTI: BHIS SOCC Lab Config](https://maxwellcti.com/bhis-antisyphon-and-webinars/black-hills-soc-core/labs/00-bhis-socc-lab-config/)

# Why?
Windows Updates are incredibly persistent; somehow they're never installed on my users' computers, but they force-run on BHIS's SOC Core Lab VM...

# BHIS Lab
Here are links to the BHIS Lab VM setup and various labs you would use it with:

[John Strand Training Lab – Download Instructions](https://www.antisyphontraining.com/john-strand-training-lab-download-instructions/)

[BHIS IntroLabs - Navigation](https://github.com/strandjs/IntroLabs/blob/master/IntroClassFiles/navigation.md)

