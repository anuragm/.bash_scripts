## Homebrew config ##

brew-cask-upgrade() {
    if [ "$1" != '--continue' ]; then
        echo "Removing brew cache"
        rm -rf "$(brew --cache)"
        echo "Running brew update"
        brew update
    fi
    for c in $(brew cask list); do
        echo -e "\n\nInstalled versions of $c: "
        ls /usr/local/Caskroom/$c
        echo "Cask info for $c"
        brew cask info $c
        select ynx in "Yes" "No" "Exit"; do
            case $ynx in
                "Yes")  echo "Uninstalling $c";
                        brew cask uninstall --force "$c";
                        echo "Re-installing $c";
                        brew cask install "$c";
                        break;;
                "No")   echo "Skipping $c";
                        break;;
                "Exit") echo "Exiting brew-cask-upgrade";
                        return;;
            esac
        done
    done
}

#Add brew sbin path
export PATH=$(brew --prefix)/sbin:$PATH

#Making bash autocompletion work.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


# Homebrew settings
export HOMEBREW_NO_ANALYTICS=1 # Don't spy on me!
export HOMEBREW_AUTO_UPDATE_SECS=86400 # Update only once a day

# Additional brew recommendations
export BYOBU_PREFIX=$(brew --prefix)

