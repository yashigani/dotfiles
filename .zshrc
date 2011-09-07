bindkey -e

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

alias sgi="sgi64"

# javacのエンコーディング設定をエイリアスに
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

## MacVim-Kaoriya を Terminal から使う
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
# # ruby関連
# export PATH=~/lang/ruby/gems/bin:$PATH
# export RUBYLIB=~/lang/ruby/gems/lib:$RUBYLIB
# export GEM_HOME=~/lang/ruby/gems
# # specコマンドにオプションを足しておく
# alias spec='spec -fs -c'

# calとかで日本語になるのを防ぐ
LC_TIME=C;export LC_TIME
LC_MESSAGES=C;export LC_MESSAGES

# pager を lv に
if type lv > /dev/null 2>&1;then
    export PAGER="lv"
else
    export PAGER="less"
fi
# lv をいいかんじに
if [ "$PAGER" = "lv" ]; then
    export LV="-c -l"
else
    alias lv="$PAGER"
fi

autoload -U compinit
compinit
autoload -U colors
colors
autoload zed

# 補完候補を Emacs のキーバインドで動き回る
zstyle ':completion:*:default' menu select=1

# 補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補一覧をカラー表示する
zstyle ':completion:*' list-colors ''

### History
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
# 同じコマンドは記録しない
setopt hist_ignore_dups
# スペース始まりのコマンドはエスケープ
setopt hist_ignore_space
setopt share_history

export LANG=ja_JP.UTF-8
### プロンプト
unset promptcr
setopt prompt_subst
PROMPT=$'%{$fg[yellow]%}[%~]%{$reset_color%} : %{$fg[green]%}[%T %W]%{$reset_color%}\n> '
#RPROMPT='%{$fg[green]%}Happy hacking!%{$reset_color%}'

# ビープ音をキャンセル
setopt nobeep

# 彩色
#setopt prompt_subst

export CLICOLOR='true'
export LSCOLORS=GxFxCxdxBxegedabagacad
alias ls='ls -G'

# 補完候補を一覧表示
setopt auto_list

# 補完候補一覧でファイルの種別をマーク表示
setopt list_types

# TABで補完候補を切り替える
setopt auto_menu

# 出力時に 8bit を通す
setopt print_eight_bit

# ディレクトリ名だけで cd
setopt auto_cd
# cd と同時に push
setopt auto_pushd

# カッコを自動で補完
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動付加
setopt auto_param_slash

# スペルチェック
setopt correct

# 補完候補を詰めて表示
setopt list_packed

# 補完の表示を水平方向に
setopt list_rows_first

# 拡張ファイルグロブ
setopt extended_glob

# ファイル名の展開で数値順にソート
setopt numeric_glob_sort

# ^S,^Qを無効に
unsetopt flow_control

# ^Dでログアウトしない
setopt ignore_eof
