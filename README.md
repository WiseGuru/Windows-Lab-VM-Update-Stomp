# Windows Lab VM Update-Stomp
This is an effort to kill Windows Update in a lab environment where updates cause problems with the activities.
As a bonus are various cosmetic changes (hiding the Search bar, disables News and Weather, etc.) that I like having on Windows machines I use.

After you've run the script, the following line gets the status of the update services that should be stopped.
```Powershell
Get-Service -Name wuauserv,bits,UsoSvc,InstallService
```

### Why?
Windows Updates are incredibly persistent; somehow they're never installed on my users' computers, but they force-run on BHIS's SOC Core Lab VM...

#### BHIS Lab
Here are links to the BHIS Lab VM setup and various labs you would use it with:

[John Strand Training Lab – Download Instructions](https://www.antisyphontraining.com/john-strand-training-lab-download-instructions/)

[BHIS IntroLabs - Navigation](https://github.com/strandjs/IntroLabs/blob/master/IntroClassFiles/navigation.md)

### Details
The script should be thoroughly commented and clearly written, but let me know if I need to clarify something.

For more details and context, please check out the original post on my site: [MaxwellCTI: BHIS SOCC Lab Config](https://maxwellcti.com/bhis-antisyphon-and-webinars/black-hills-soc-core/labs/00-bhis-socc-lab-config/)
