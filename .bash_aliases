#!/bin/bash
# allgemein nuetzliche aliase

# listen
alias ls='ls --color=auto --group-directories-first'
alias lla='ls -laF'
alias ll='ls -lF'
alias la='ls -a'
alias l='ls -CF'

# apt
alias search='sudo apt-cache search'
alias aptinstall='sudo apt-get install'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias upall='sudo apt-get update && ( sudo apt-get upgrade && sudo apt-get dist-upgrade )'
alias remove='sudo apt-get remove'
alias autoremove='sudo apt-get autoremove'
alias autoclean='sudo apt-get autoclean'
alias purge='sudo apt-get purge'

# taegliche nutzung
alias ..='cd .. ; ls -l'
alias nano='nano --syntax=auto'


# spezielle aliase für clients oder server
# je nach maschine sollte die jeweilige datei vorhanden sein

# aliase für clients
if [ -f "$HOME/.bash_aliases_clients" ]; then
   . "$HOME/.bash_aliases_clients"
fi

# aliase für server
if [ -f "$HOME/.bash_aliases_server" ]; then
   . "$HOME/.bash_aliases_server"
fi

# funktionen für die bash
if [ -f "$HOME/.bash_func" ]; then
   . "$HOME/.bash_func"
fi

# wenn laptop
if [ -f "$HOME/.bash_aliases_laptop" ]; then
   . "$HOME/.bash_aliases_laptop"
fi

