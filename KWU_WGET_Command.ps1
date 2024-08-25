# Download and run KillWindowsUpdates
wget https://raw.githubusercontent.com/WiseGuru/Windows-Lab-VM-Update-Stomp/main/KillWindowsUpdates.ps1 -outfile .\KWU.ps1 ; .\KWU.ps1

# Additional Linux Commands
## Download and run SPICE-Guest tools
wget https://www.spice-space.org/download/windows/spice-guest-tools/spice-guest-tools-latest.exe -outfile .\SPICE-Guest.exe ; .\SPICE-Guest.exe

## Download VirtIO Guest Tools
wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/latest-virtio/virtio-win-guest-tools.exe -outfile .\virtio-win-guest-tools.exe ; .\virtio-win-guest-tools.exe

## Reboot in 30 seconds
shutdown /r /t 30
