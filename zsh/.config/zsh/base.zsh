stty -ixon

. $HOME/.asdf/asdf.sh

export EDITOR='nvim'
export APPS_HOME=/home/imtiaz/apps
export ANDROID_HOME=/home/imtiaz/Android
export ANDROID_SDK_ROOT=/home/imtiaz/Android
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

export PATH="$PATH:$HOME/bin"

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M MB'$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'
