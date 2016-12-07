ask() {
    # http://djm.me/ask
    while true; do

        if [ "${2:-}" = "S" ]; then
            prompt="S/n"
            default=S
        elif [ "${2:-}" = "N" ]; then
            prompt="s/N"
            default=N
        else
            prompt="s/n"
            default=
        fi

        # Ask the question - use /dev/tty in case stdin is redirected from somewhere else
        read -p "$1 [$prompt] " REPLY </dev/tty

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            S*|s*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}

echo ".%%......%%%%%%..%%..%%..%%..%%..%%..%%..%%%%%...%%%%%%..%%..%%..%%..%%..%%%%%%..%%%%%%.
.%%........%%....%%%.%%..%%..%%...%%%%...%%..%%..%%......%%..%%..%%.%%.....%%......%%...
.%%........%%....%%.%%%..%%..%%....%%....%%..%%..%%%%....%%..%%..%%%%......%%......%%...
.%%........%%....%%..%%..%%..%%...%%%%...%%..%%..%%.......%%%%...%%.%%.....%%......%%...
.%%%%%%..%%%%%%..%%..%%...%%%%...%%..%%..%%%%%...%%%%%%....%%....%%..%%..%%%%%%....%%...
........................................................................................"


if ask "Are you sure to install LinuxDevKit?" N; then
    echo 'Installing...'
    
    mkdir ~/.linuxDevKit
    
    if [ -f ~/.bash_aliases ]; then
        echo ". ~/.linuxDevKit/bash_aliases.sh" >> ~/.bash_aliases
    else
        touch ~/.bash_aliases
        echo ". ~/.linuxDevKit/bash_aliases.sh" >> ~/.bash_aliases
    fi
    
    echo "Downloading Files..."
    wget -O ~/.linuxDevKit/bash_aliases.sh http://philippeassis.com/linuxDevKit/bash_aliases.sh
    wget -O ~/.linuxDevKit/basic.sh http://philippeassis.com/linuxDevKit/basic.sh 
    wget -O ~/.linuxDevKit/gitnpm.sh http://philippeassis.com/linuxDevKit/gitnpm.sh
    wget -O ~/.linuxDevKit/mongo.sh http://philippeassis.com/linuxDevKit/mongo.sh
    
    echo "Updating bash..."
    source ~/.bashrc
    
    echo "All ready!"
fi