# Download and run KillWindowsUpdates
wget https://raw.githubusercontent.com/WiseGuru/Windows-Lab-VM-Update-Stomp/main/KillWindowsUpdates.ps1 -outfile .\KWU.ps1 ; .\KWU.ps1

# Additional Linux Commands
## Download and run SPICE-Guest tools
wget https://www.spice-space.org/download/windows/spice-guest-tools/spice-guest-tools-latest.exe -outfile .\SPICE-Guest.exe ; .\SPICE-Guest.exe

## Download and run VirtIO WinGuest Tools
wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win-guest-tools.exe -outfile .\virtio-win-guest-tools.exe ; read-host "Press enter to begin installing the VirtIO Drivers..." ; .\virtio-win-guest-tools.exe

## Reboot in 30 seconds
read-host "Press enter to restart VM. You can abort the reboot by typing 'shutdown -a' after the reboot has begun." ; shutdown /r /t 30
