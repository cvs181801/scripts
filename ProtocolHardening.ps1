Import-Module $env:SyncroModule

$SMB1 = (Get-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol").State
if ($SMB1 -eq "Enabled") {
   Write-Host "SMBv1 is enabled, disabling…"
    Disable-WindowsOptionalFeature -Online -FeatureName smb1protocol -NoRestart
   Write-Host "SMBv1 disabled, restarting machine."
    shutdown /r /t 240
}
else { 
    Write-Host "SMBv1 is NOT enabled!"
}