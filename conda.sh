## Workaround for Conda messing up with terminal ##

unameOut="$(uname -s)"
case "${unameOut}" in
    Darwin*)
        export TERMINFO=/usr/share/terminfo ;;
    *)
        ;;
esac
