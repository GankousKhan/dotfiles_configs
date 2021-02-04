###############################################################################
# Post install script to setup developer environment
#   Todo: Add in ability to choose what kind of workload by argument.
###############################################################################

# Check if powershell is launched as elevevated
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if(-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Write-Warning "Please run PowerShell as administrator"
        exit
}

###############################################################################
# Installs
###############################################################################
# Choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n=allowGlobalConfirmation

# Developer Tools
winget install Microsoft.VisualStudioCodeInsiders-User-x64
winget install Microsoft.VisualStudio.Community
winget intsall Insomnia.Insomnia
winget install Insomnia.InsomniaDesigner
winget install OpenJS.NodeJS
winget install LINQPad.LINQPad6
winget install Git.Git
winget install GitHub.cli
winget install Telerik.Fiddler
winget install Docker.DockerDesktop
winget install dnGrep.dnGrep
winget install Microsoft.dotnet
winget install JetBrains.Toolbox
choco install ripgrep
choco install ripgrep-all

# Windows
winget install Microsoft.PowerToys
winget install Microsoft.PowerShell-Preview
winget install Microsoft.WindowsTerminalPreview

# Security + Privacy
winget install ProtonTechnologies.ProtonVPN
winget install Bitwarden.Bitwarden
winget install AxCrypt.AxCrypt

# Internet
winget install Mozilla.FirefoxDeveloperEdition
winget install DelugeTeam.Deluge
winget install zerotier.zerotier

# Video + Music
winget install VideoLAN.VLC

# Misc
winget install 7zip.7zip

# Gaming
# winget install Valve.Steam
# winget install EpicGames.EpicGamesLauncher

# Chat
# winget install Discord.Discord
# winget install Signal.Signal
# winget install Microsoft.Teams
# winget install Telegram.TelegramDesktop
# winget install Zoom.Zoom

###############################################################################
# Environment Config
###############################################################################
Set-Location C:\
mkdir GitHub
Set-Location GitHub
gh repo clone GankousKhan/dotfiles_configs

# Check if path already exists and add if not
$oPath = ($env:path).split(";")

$pathsToAdd = @("C:\GitHub\dotfiles_configs\Windows\tools", "C:\GitHub\dotfiles_configs\Windows\scripts")
$paths = ""
for($i = 0; $i -lt $pathsToAdd.length; $i++) {
    $isUnique = 1;
    for($j = 0; $j -lt $oPath.length; $j++) {
        if ($pathsToAdd[$i] -eq $oPath[$j]) {
            $isUnique = 0;
        }
    }

    if ($isUnique -ne 0) {
        $paths = $paths + ";" + $pathsToAdd[$i]
    }
}

$oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$newpath = $oldpath + $paths
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newpath

# ###############################################################################
# # Cleanup
# ###############################################################################
choco feature disable -n=allowGlobalConfirmation