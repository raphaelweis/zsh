#######################################
# Powerlevel10k instant prompt
#######################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#######################################
# Plugins
#######################################

# directory to store the git repositories
ZSH_PLUGINS_DIR="$ZDOTDIR/plugins"

# starship prompt
eval "$(starship init zsh)"

# zsh syntax highlighting
if [ ! -d $ZSH_PLUGINS_DIR/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS_DIR/zsh-syntax-highlighting
fi
source $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh auto suggestions
if [ ! -d $ZSH_PLUGINS_DIR/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGINS_DIR/zsh-autosuggestions
fi
source $ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh completions
if [ ! -d $ZSH_PLUGINS_DIR/zsh-completions ]; then
  git clone https://github.com/zsh-users/zsh-completions.git $ZSH_PLUGINS_DIR/zsh-completions
fi
fpath=($ZSH_PLUGINS_DIR/zsh-completions/src $fpath)

# zsh history sub string search
if [ ! -d $ZSH_PLUGINS_DIR/zsh-history-substring-search ]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search.git $ZSH_PLUGINS_DIR/zsh-history-substring-search
fi
source $ZSH_PLUGINS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh

#######################################
# General Configuration
#######################################

# Command history config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#
setopt autocd extendedglob # typing a path to a directory will auto cd into it

#
unsetopt beep # disable beep when errors occur

# vi mode
bindkey -v vi
bindkey 'jk' vi-cmd-mode
bindkey "^?" backward-delete-char # to make backspace work

# Keybinds: zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#######################################
# Aliases 
#######################################

alias vim='nvim'
alias bonjour='cowsay bonjour' # absolutely capital
alias bt='bluetuith' # bluetooth tui
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash && zsh'

# git aliases
alias gitc='git checkout'
alias gits='git status'

# use lsd as a replacement for la
alias ls='lsd'
alias la='lsd -la'

# use zoxide as a replacement for cd.
alias cd='z'

# directory up aliases
alias .2='../..'
alias .3='../../..'
alias .4='../../../..'
alias .5='../../../../..'

#######################################
# Environment variables
#######################################

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

export PDFVIEWER="/usr/bin/firefox"
export VIMRC="$XDG_CONFIG_HOME/nvim/init.lua"
export VIMCONFDIR="$XDG_CONFIG_HOME/nvim"
export WALLPAPERS_DIR="$HOME/Pictures/wallpapers"
export SCREENSHOTS_DIR="$HOME/Pictures/screenshots"

#######################################
# Functions
#######################################

### ARCHIVE EXTRACTION
# usage: ex <file>
ex () {
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

######################################
# Old
######################################

# # zsh theme: powerlevel10k
# if [ ! -d $ZSH_PLUGINS_DIR/powerlevel10k ]; then
#   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_PLUGINS_DIR/powerlevel10k
# fi
# source $ZSH_PLUGINS_DIR/powerlevel10k/powerlevel10k.zsh-theme
# source $ZDOTDIR/.p10k.zsh

#######################################
# Else
#######################################

#nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # To work with nvm, see documentation at https://github.com/nvm-sh/nvm

#zoxide
eval "$(zoxide init zsh)"

#fzf
source "$ZDOTDIR/fzf/key-bindings.zsh"
source "$ZDOTDIR/fzf/completion.zsh"

#######################################
# Cursor Blinking
#######################################

echo -en "\e[2 q"
