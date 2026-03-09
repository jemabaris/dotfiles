#################
# Add fastfetch #
#################
fastfetch



################################
# Powerlevel10k instant prompt #
################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


####################
### Key bindings ###
####################


#####################
# Special Functions #
#####################





# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux zsh-autosuggestions zsh-syntax-highlighting sudo)


####################
# Source oh-my-zsh #
####################

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi


# JR set default editor
EDITOR='nvim'

# JR Set fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"




###############
# Add Aliases #
###############
alias up="~/EndeavourOS_Smart_Update_Wrapper" # Advanced update script to update all pacman and AUR packages
alias s="yay -Ss" # Alias for searching a package with yay
alias srczsh="source ~/.zshrc"
alias ff="fastfetch"
alias rizz="WallRizz -d ~/Documents/Ricing/Wallpaper/"
# alias remotty= "kitty -o allow_remote_control=yes"

# Add ChrisTitus Aliases
alias cls='clear'
alias mkdir='mkdir -p'
alias svi='sudo vi'
alias vi='nvim'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias rm='trash -v'
alias cp='cp -i'
alias cpr='cp -r'
alias mv='mv -i'
alias rsync='rsync --progress'

# trash-cli
alias te='trash-empty'
alias tef='trash-empty -f'
alias tl='trash-list'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cdbin='cd /home/jason/.local/bin'
# cd into the old directory
alias bd='cd "$OLDPWD"'

# eza (better ls)
alias ls='eza --icons'
alias lsd='eza --icons --group-directories-first' # long listing
alias lt='eza --tree --icons' # tree view
alias ll='eza -lah --color-scale=size --color-scale-mode=gradient --icons --group-directories-first' # long listing
alias lf='eza -lah --only-files' # files only
alias ld='eza -lah --only-dirs' # directories only
alias lS='eza -lah --sort=size --color-scale=size --color-scale-mode=gradient --icons --group-directories-first' # sorted by size
alias lg='eza -lah --git --icons' # git-aware listing # git-aware listing

# Special ls Aliases
alias ln='eza -lah --sort=modified --reverse --icons' # show newest files first
alias lb='eza -lah --sort=size --icons' # show biggest files
alias lr='eza -lahR --icons' # show everything recursively

# Search command line history
alias h="history 0 | grep "
# Search running processes
alias p="ps aux | grep -i"
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
# Search files in the current folder
alias f="find . | grep "
# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"
# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"


# Alias grep to ripgrep (if available)
if command -v rg >/dev/null 2>&1; then
  alias grep='rg --smart-case'
  alias rg='rg --smart-case --hidden'
  alias rgi='rg -i'
  alias rgf='rg --files'
else
  alias grep='grep --color=auto'
fi



# # Color for manpages in less makes manpages a little easier to read
# export LESS_TERMCAP_mb=$'\E[01;31m'
# export LESS_TERMCAP_md=$'\E[01;31m'
# export LESS_TERMCAP_me=$'\E[0m'
# export LESS_TERMCAP_se=$'\E[0m'
# export LESS_TERMCAP_so=$'\E[01;44;33m'
# export LESS_TERMCAP_ue=$'\E[0m'
# export LESS_TERMCAP_us=$'\E[01;32m'


#################
# Source Zoxide #
#################
eval "$(zoxide init --cmd cd zsh)"

#################
# Powerlevel10k #
#################

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
