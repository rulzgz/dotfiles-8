#
#     ███████╗███████╗██╗  ██╗██████╗  ██████╗
#     ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#       ███╔╝ ███████╗███████║██████╔╝██║
#      ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#  ██╗███████╗███████║██║  ██║██║  ██║╚██████╗
#  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
#  KingKobra87's ZSH config
#  https://www.github.com/kingkobra87/dotfiles
#

########################
###### SELECT GPU ######
########################

# For Intel/AMD hybrid graphics, DRI_PRIME=1 needs to
# prepend any command to run on the dedicated GPU.
select-gpu() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == DRI_PRIME=1\ * ]]; then
        LBUFFER="${LBUFFER#DRI_PRIME=1 }"
    else
        LBUFFER="DRI_PRIME=1 $LBUFFER"
    fi
}
zle -N select-gpu
# Insert DRI_PRIME=1 with Ctrl + G
bindkey "^g" select-gpu

#######################
###### SETTINGS #######
#######################

export TERM="xterm-256color"

# Neovim as the default editor
export VISUAL="nvim"
export EDITOR="nvim"

# History
HISTFILE=~/.zsh-history
HISTSIZE=5000
SAVEHIST=5000

# Options
setopt appendhistory autocd nomatch COMPLETE_ALIASES
unsetopt beep notify

zstyle :compinstall filename '/home/kobra/.zshrc'

autoload -Uz compinit
compinit

# Default browser
if [ -n "$DISPLAY" ]; then
    export BROWSER=firefox
else 
    export BROWSER=links
fi

# ruby path
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Fuzzy search
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--reverse --inline-info"

# ssh
#export SSH_KEY_PATH="~/.ssh/dsa_id"

# Aliases
source ~/.aliases

#########################
###### WINE 32-bit ######
#########################

export WINEPREFIX=$HOME/.wine32/
export WINEARCH=win32

#####################
###### ANTIGEN ######
#####################

# Using `antigen-git` from AUR
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Don't use oh-my-zsh prompts
ZSH_THEME=""

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle adb
antigen bundle sudo
antigen bundle colored-man-pages
antigen bundle command-not-found

# Completions not yet implemented into ZSH stable
antigen bundle zsh-users/zsh-completions

# `zsh pure` prompt. load order matters
antigen bundle mafredri/zsh-async
#antigen bundle sindresorhus/pure ### original version
antigen bundle tkonolige/pure ### nice fork with basic symbols

# Syntax highlighting bundle. Must load last!
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen apply
