bindkey -e

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

alias sgi="sgi64"

# javacのエンコーディング設定をエイリアスに
#alias javac="javac -J-Dfile.encoding=UTF8"
# keytoolとかが文字化けするからUTF-8に
export _JAVA_OPTIONS='-Dfile.encoding=UTF-8'

# set terminfo
export TERMINFO=/usr/share/terminfo

# iPhone Simulator Directory
alias simulator='cd ~/Library/Application\ Support/iPhone\ Simulator'

## MacVim-Kaoriya を Terminal から使う
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

# for MacPorts
if [ -f /opt/local/bin/port ]; then
    export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
    export MANPATH=/opt/local/man:$MANPATH
fi
#
# # ruby関連
# # specコマンドにオプションを足しておく
# alias spec='spec -fs -c'

# calとかで日本語になるのを防ぐ
LC_TIME=C;export LC_TIME
LC_MESSAGES=C;export LC_MESSAGES

# grep option
export GREP_OPTIONS="--color=auto"

# use zsh-completions
#fpath=(~/dev_tools/zsh-completions $fpath)

autoload -U compinit
compinit
autoload -U colors
colors
autoload zed

#補完候補をEmacsのキーバインドで動き回る
zstyle ':completion:*:default' menu select=1

#補完の時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#補完候補一覧をカラー表示する
zstyle ':completion:*' list-colors ''

### History
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
#同じコマンドは記録しない
setopt hist_ignore_dups
setopt share_history

export LANG=ja_JP.UTF-8

### プロンプト
#
# Show branch name in Zsh's right prompt
#

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
    local name st color gitdir action
    if [[ "$PWD" =~ '/¥.git(/.*)?$' ]]; then
        return
    fi
    name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
    if [[ -z $name ]]; then
        return
    fi

    gitdir=`git rev-parse --git-dir 2> /dev/null`
    action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        color=%F{green}
    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
        color=%F{yellow}
    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
        color=%B%F{red}
    else
        color=%F{red}
    fi

    echo "$color$name$action%f%b "
}

setopt prompt_subst

unset promptcr
setopt prompt_subst
PROMPT=$'%{$fg[yellow]%}[%~]%{$reset_color%} `rprompt-git-current-branch`: %{$fg[green]%}[%T %W]%{$reset_color%}\n> '

#ビープ音をキャンセル
setopt nobeep

#彩色
#setopt prompt_subst

export CLICOLOR='true'
export LSCOLORS=GxFxCxdxBxegedabagacad
alias ls='ls -G'

#補完候補を一覧表示
setopt auto_list

#補完候補一覧でファイルの種別をマーク表示
setopt list_types

#TABで補完候補を切り替える
setopt auto_menu

#出力時に8bitを通す
setopt print_eight_bit

#ディレクトリ名だけでcd
setopt auto_cd
#cdと同時にpush
setopt auto_pushd

#カッコを自動で補完
setopt auto_param_keys

#ディレクトリ名の補完で末尾の / を自動付加
setopt auto_param_slash

#スペルチェック
setopt correct

#補完候補を詰めて表示
setopt list_packed

#補完の表示を水平方向に
setopt list_rows_first

#拡張ファイルグロブ
setopt extended_glob

#ファイル名の展開で数値順にソート
setopt numeric_glob_sort

#^S,^Qを無効に
unsetopt flow_control

#^Dでログアウトしない
setopt ignore_eof

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -e $HOME/.zshrc_local ]; then
    source $HOME/.zshrc_local
fi
