# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# bashrc laden für aliase und co
# if running bash
# : bedeutet nop
profilewirdgeladen=1
if [ "$bashrcwirdgeladen" == "1" ] ; then
	:
else
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
    bashrcwirdgeladen=0
fi
fi
profilewirdgeladen=0

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

Decoration1="\[\e[1;30m\]╔["
RegularUserPart="\[\e[36m\]\u"
RootUserPart="\[\e[31;5m\]\u\[\e[m\]"
Between="\[\e[90m\]@"
HostPart="\[\e[4m\]\[\e[1;32m\]\h\[\e[24m\]:"
PathPart="\[\e[93;1m\]\w"
Decoration2="\[\e[1;30m\]]\n╚>\[\e[m\]"
case `id -u` in
    0) export PS1="$Decoration1$RootUserPart$Between$HostPart$PathPart$Decoration2# ";;
    *) export PS1="$Decoration1$RegularUserPart$Between$HostPart$PathPart$Decoration2$ ";;
esac
