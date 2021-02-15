###############################################################################
# Windows and application updates
#   Todo: When winget allows for updates add.
###############################################################################

# Check if powershell is launched as elevevated
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if(-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
  Write-Warning "Please run PowerShell as administrator"
      exit
}

# Windows Update and Additional Updates
Get-WUInstall -MicrosoftUpdate -AcceptAll

# Chocolatey Update All
choco upgrade all -y