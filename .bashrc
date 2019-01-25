# .bashrc

# Source global definitions
if [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}


# export PATH=/mnt/Mirror/src/scripts/bash:/usr/local/data/pbrodnick/doc_svn/bin:$PATH
PS1="\[$(tput bold)\]\[$(tput setaf 3)\]\$(parse_git_branch)\[$(tput setaf 2)\]${debian_chroot:+($debian_chroot)}\u@\[$(tput setaf 6)\]\h\[$(tput setaf 7)\] \w \n \\$ \[$(tput sgr0)\]"

alias ls='ls --color=auto'
alias ll='ls -alh'

alias ff='find . -name'
alias gp='grep -riI'
set -o vi

alias vxw='ssh -X eboley@vxworks1'

export EDITOR=vim
export USERNAME=eboley
export PIP_EXTRA_INDEX_URL="https://pypi.xes-mad.com/simple"

export PATH="$PATH:~/.arc_install/arcanist/bin/"

ptitle() {
    echo -ne "\033]0;$1\007"
}


# change directory to where the real work is done
cd /mnt/ssd/users/eboley

# example of slick find exec usage
#
# find -type f -exec bash -c "file {} | grep 'POSIX shell script, ASCII text executable'" \;
#
# find . -name "*.cdf" -exec grep -H string_to_look_for {} \;

alias sp_start='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play'

alias sp_pause='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause'

alias sp_last='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous'

alias sp_next='dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next'

alias sp_toggle="dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export EB_HOME=/mnt/home/eboley
export EB_WORK=/mnt/pub/users/eboley
