# Run as root
sudo -Es

# Install Homebrew
(
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&

    brew install docker &&
    brew install node &&
    brew install mitmproxy &&
    brew install --cask git &&
    brew install --cask visual-studio-code &&
    brew install --cask gh &&
    brew install --cask github &&
    brew install --cask bitwarden &&
    brew install --cask zerotier-one &&
    brew install --cask firefox &&
    brew install --cask google-chrome &&
    brew install --cask protonvpn &&
    brew install --cask insomnia &&
    brew install --cask insomnia-designer &&
    brew install --cask dotnet-sdk &&
    brew install --cask visual-studio &&
    brew install --cask obsidian

    say done
) || say error
    
# Setup MITMProxy
mitmproxy --host
open -g -a Firefox http://mitm.it/
open -g -a Chrome http://mitm.it/
open -g -a Firefox ./docs/mitm-setup.html
open -g -a Chrome ./docs/mitm-setup.html

# Run updates
brew update
brew upgrade
brew upgrade --cask
softwareupdate -i -a