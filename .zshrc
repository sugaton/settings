# -*- Shell-script -*-
# .zshrc

export GREP_COLOR="01;34"
export GREP_OPTIONS="--binary-files=without-match --color=auto"
#export LD_LIBRARY_PATH=$HOME/usr/lib:/share/usr/lib:$HOME/usr-$MACHINE/lib:/share/usr-$MACHINE/lib
     
# options
setopt auto_cd
setopt auto_param_slash
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_remove_slash
setopt extended_glob
setopt function_argzero
setopt ignore_eof
setopt list_types
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home
setopt sun_keyboard_hack
setopt print_eight_bit
setopt complete_in_word
setopt no_nomatch
setopt extended_history
setopt share_history
#setopt noclobber

# aliases
alias ls='ls -G'
alias cp='cp -i'
alias python='/usr/local/Cellar/python/2.7.6_1/bin/python2.7' 
alias mv='mv -i'
alias rm='rm -i'
alias gomi='rm -i *~'
alias scp='scp -p'
alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias endx='killall gnome-session'
alias -g L='| lv'
alias -g H='| head'
alias -g G='| grep'
alias -g GL='| greplv'
alias -g T='| tail'
alias -g W='| wc'
alias sr='screen'
#alias openssl='/home/lr/suga/local/bin/openssl'
# completion
autoload -U compinit
compinit

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# bindkeynn

# greplv
greplv() { grep $1 --color=always | perl -ne "s/\033\[K//; print" | lv -c}

# title
if [ "$TERM" = "screen" ]; then
    TITLE=`hostname | cut -d . -f 1 | sed -e "s/orchid/o/"`
    echo -n "k$TITLE\\"
    preexec () {
	PRE_CMD=`echo $1 | cut -d " " -f 1`
    }
    precmd () {
	if [ "$PRE_CMD" = "ssh" ]; then
	    echo -n "\033k$TITLE\033\\"
	fi
    }
fi
if [ "$TERM" = "xterm" ]; then
    TITLE=`pwd | sed -e "s/\/home\/lr\/sasano/~/"`
    SHOST=`hostname | sed -e "s/\..*//"`
    echo -en "\e]0;$TITLE@$SHOST\a"
    preexec () {
	PRE_CMD=`echo $1 | cut -d " " -f 1`
    }
    precmd () {
	if [ "$PRE_CMD" = "ssh" -o "$PRE_CMD" = "cd" -o "$PRE_CMD" = "gd" -o "$PRE_CMD" = "screen" -o "$PRE_CMD" = "sr" ]; then
	    TITLE=`pwd | sed -e "s/\/home\/lr\/sasano/~/"`
	    echo -en "\e]0;$TITLE@$SHOST\a"
	fi
    }
fi

# change stop key
stty stop "^X" 2> /dev/null

