PS1='\033[1;33m$(rvm-prompt s i v g u)\033[0m\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

export GOROOT=/opt/go
export GOPATH=/opt/devbase/gosource
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
export LESS='-RS#3NM~g'
export EDITOR='nano'

alias ll='ls -lh'
alias la='ls -lha'
alias nano='nano -c -w'

echo
echo "RVM is installed and Go environment is as follows:"
env | egrep -i ^GO
echo

cd $HOME
