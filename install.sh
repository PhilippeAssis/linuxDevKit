mkdir .linuxDevKit

if [ -f ~/.bash_aliases ]; then
    echo ". ~/.linuxDevKit/bash_aliases.sh" >> ~/.bash_aliases
else
    touch ~/.bash_aliases
    echo ". ~/.linuxDevKit/bash_aliases.sh" >> ~/.bash_aliases
fi

wget -O ~/.linuxDevKit/bash_aliases.sh http://philippeassis.com/linuxDevKit/bash_aliases.sh
wget -O ~/.linuxDevKit/basic http://philippeassis.com/linuxDevKit/basic.sh 
wget -O ~/.linuxDevKit/gitnpm http://philippeassis.com/linuxDevKit/gitnpm.sh
wget -O ~/.linuxDevKit/mongo http://philippeassis.com/linuxDevKit/mongo.sh

