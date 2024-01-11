# Install and import required modules if not already installed
if (-not (Get-Module -Name PowerShellGet -ListAvailable)) {
    Install-Module -Name PowerShellGet -Force -AllowClobber
}

if (-not (Get-Module -Name MicrosoftOnline -ListAvailable)) {
    Install-Module -Name MicrosoftOnline -Force -AllowClobber
}

Import-Module MicrosoftOnline -Force

# Connect to Microsoft 365
Connect-MsolService

# Specify the user's email address
$userEmail = "user@example.com"

# Task 1: Remove or hide user from the global address list (GAL)
Set-MsolUser -UserPrincipalName $userEmail -IsAddressListHidden $true

# Task 2: Remove all licenses for the user
Get-MsolUser -UserPrincipalName $userEmail | ForEach-Object {
    $_ | Set-MsolUserLicense -RemoveLicenses $_.Licenses
}

# Task 3: Change the user's password and display the new password
$newPassword = ConvertTo-SecureString -AsPlainText "YourNewPassword" -Force
Set-MsolUserPassword -UserPrincipalName $userEmail -NewPassword $newPassword -ForceChangePassword $false

Write-Host "User's password changed. New password: YourNewPassword"

# Task 4: Block the user from signing in
Set-MsolUser -UserPrincipalName $userEmail -BlockCredential $true

Write-Host "User blocked from signing in."
##