stty -ixon

export EDITOR='nvim'
export APPS_HOME=/home/imtiaz/apps
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

export FLYCTL_INSTALL="/home/imtiaz/.fly"

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

export PATH="$PATH:$HOME/bin:$FLYCTL_INSTALL/bin:$APPS_HOME/platform-tools:$APPS_HOME/cmdline-tools/bin"

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M MB'$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'
