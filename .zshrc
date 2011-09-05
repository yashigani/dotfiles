bindkey -e

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

alias sgi="sgi64"

# javac$B$N%(%s%3!<%G%#%s%0@_Dj$r%(%$%j%"%9$K(B
alias javac="javac -J-Dfile.encoding=UTF8"

# set terminfo
export TERMINFO=/usr/share/terminfo
# dev tools path
export DEV_TOOLS=/Users/taiki/dev_tools
# for Android SDK
export ANDROID_SDK_HOME=$DEV_TOOLS/android
export PATH=$ANDROID_SDK_HOME/tools:$ANDROID_SDK_HOME/platform-tools:$PATH

# iPhone Simulator Directory
alias simulator='cd ~/Library/Application\ Support/iPhone\ Simulator'

## MacVim-Kaoriya $B$r(B Terminal $B$+$i;H$&(B
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env Lang=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env Lang=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# Load RVM function
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then source $HOME/.rvm/scripts/rvm ; fi
# for ruby
#export PATH=$DEV_TOOLS/refe:$PATH

# for Scala
export SCALA_HOME=$DEV_TOOLS/scala-2.8.0.final
export PATH=$SCALA_HOME/bin:$DEV_TOOLS/sbt:$PATH

# for MacPorts
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export MANPATH=/opt/local/man:$MANPATH
#
# # ruby$B4XO"(B
# export PATH=~/lang/ruby/gems/bin:$PATH
# export RUBYLIB=~/lang/ruby/gems/lib:$RUBYLIB
# export GEM_HOME=~/lang/ruby/gems
# # spec$B%3%^%s%I$K%*%W%7%g%s$rB-$7$F$*$/(B
# alias spec='spec -fs -c'

# cal$B$H$+$GF|K\8l$K$J$k$N$rKI$0(B
LC_TIME=C;export LC_TIME
LC_MESSAGES=C;export LC_MESSAGES

autoload -U compinit
compinit
autoload -U colors
colors
autoload zed

#$BJd408uJd$r(BEmacs$B$N%-!<%P%$%s%I$GF0$-2s$k(B
zstyle ':completion:*:default' menu select=1

#$BJd40$N;~$KBgJ8;z>.J8;z$r6hJL$7$J$$(B
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#$BJd408uJd0lMw$r%+%i!<I=<($9$k(B
zstyle ':completion:*' list-colors ''

### History
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
#$BF1$8%3%^%s%I$O5-O?$7$J$$(B
setopt hist_ignore_dups
setopt share_history

export LANG=ja_JP.UTF-8
### $B%W%m%s%W%H(B
unset promptcr
setopt prompt_subst
PROMPT=$'%{$fg[yellow]%}[%~]%{$reset_color%} : %{$fg[green]%}[%T %W]%{$reset_color%}\n> '
#RPROMPT='%{$fg[green]%}Happy hacking!%{$reset_color%}'

#$B%S!<%W2;$r%-%c%s%;%k(B
setopt nobeep

#$B:L?'(B
#setopt prompt_subst

export CLICOLOR='true'
export LSCOLORS=GxFxCxdxBxegedabagacad
alias ls='ls -G'

#$BJd408uJd$r0lMwI=<((B
setopt auto_list

#$BJd408uJd0lMw$G%U%!%$%k$N<oJL$r%^!<%/I=<((B
setopt list_types

#TAB$B$GJd408uJd$r@Z$jBX$($k(B
setopt auto_menu

#$B=PNO;~$K(B8bit$B$rDL$9(B
setopt print_eight_bit

#$B%G%#%l%/%H%jL>$@$1$G(Bcd
setopt auto_cd
#cd$B$HF1;~$K(Bpush
setopt auto_pushd

#$B%+%C%3$r<+F0$GJd40(B
setopt auto_param_keys

#$B%G%#%l%/%H%jL>$NJd40$GKvHx$N(B / $B$r<+F0IU2C(B
setopt auto_param_slash

#$B%9%Z%k%A%'%C%/(B
setopt correct

#$BJd408uJd$r5M$a$FI=<((B
setopt list_packed

#$BJd40$NI=<($r?eJ?J}8~$K(B
setopt list_rows_first

#$B3HD%%U%!%$%k%0%m%V(B
setopt extended_glob

#$B%U%!%$%kL>$NE83+$G?tCM=g$K%=!<%H(B
setopt numeric_glob_sort

#^S,^Q$B$rL58z$K(B
unsetopt flow_control

#^D$B$G%m%0%"%&%H$7$J$$(B
setopt ignore_eof
