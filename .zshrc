#############
# Add fetch #
#############
fastfetch
# nitch


################################
# Powerlevel10k instant prompt #
################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#####################
# Special Functions #
#####################
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
    exec tmux new-session -A -s Janis_tmux01
fi



#####################
# Special Functions #
#####################


# Add openAI API key
export OPENAI_API_KEY="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"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugin load-list
plugins=(fzf-tab git archlinux zsh-autosuggestions zsh-syntax-highlighting sudo)

# Disabled plugins (zsh-vi-mode)


####################
# Source oh-my-zsh #
####################
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
# autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


############
# Keychain #
############
eval "$(keychain --eval --quiet --nogui ~/.ssh/id_ed25519)"

###############
# Add Aliases #
###############
alias up="arch-smart-update" # Advanced update script to update all pacman and AUR packages
alias s="yay -Ss" # Alias for searching a package with yay
alias srczsh="source ~/.zshrc"
alias ff="fastfetch"
alias rizz="WallRizz -d ~/Documents/Ricing/Wallpaper/"
alias zj="zellij"
alias t='tmux'
alias record='gpu-screen-recorder-gtk'
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
alias cdbin='cd ~/.local/bin'
# cd into the old directory
alias bd='cd "$OLDPWD"'

# eza (better ls)
alias ls='eza --icons'
alias lsd='eza --icons --group-directories-first' # long listing
alias lt='eza --tree --icons --level=2' # tree view
alias lta='eza --tree --icons' # tree view
alias ll='eza -lah --color-scale=size --color-scale-mode=gradient --icons --group-directories-first' # long listing
alias lf='eza -lah --only-files' # files only
alias ld='eza -lah --only-dirs' # directories only
alias lS='eza -lah --sort=size --color-scale=size --color-scale-mode=gradient --icons --group-directories-first' # sorted by size
alias lg='eza -lah --git --icons' # git-aware listing # git-aware listing

# Alias the lf (list files) TUI file manager to lifi to avoid conflicts with lf alias for eza
alias lifi='\lf'
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


#################
# Source Zoxide #
#################
eval "$(zoxide init --cmd cd zsh)"

###############
# Source Mise #
###############
eval "$(~/.local/bin/mise activate zsh)"

##############
# Source fzf #
##############
source <(fzf --zsh)

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
# Add bat as default preview
# export FZF_DEFAULT_OPTS='--preview "bat --color=always --style=numbers --line-range=:500 {}"'

export FZF_DEFAULT_OPTS='
--height 80%
--layout=reverse
--border
--preview-window=right:60%:wrap
--bind ctrl-/:toggle-preview
--bind ctrl-d:preview-half-page-down
--bind ctrl-u:preview-half-page-up
--preview "
if [ -d {} ]; then
  eza --tree --level=2 --color=always {};
else
  bat --color=always --style=numbers --line-range=:500 {} 2>/dev/null || file {};
fi
"'

export FZF_DEFAULT_OPTS='
--height 80%
--layout=reverse
--border
--preview-window=right:60%:wrap
--bind ctrl-/:toggle-preview
--bind ctrl-d:preview-half-page-down
--bind ctrl-u:preview-half-page-up
--preview "~/.config/fzf/preview.sh {}"
--highlight-line
--color=bg+:#2d3f76
--color=bg:#1e2030
--color=border:#589ed7
--color=fg:#c8d3f5
--color=gutter:#1e2030
--color=header:#ff966c
--color=hl+:#65bcff
--color=hl:#65bcff
--color=info:#545c7e
--color=marker:#ff007c
--color=pointer:#ff007c
--color=prompt:#65bcff
--color=query:#c8d3f5:regular
--color=scrollbar:#589ed7
--color=separator:#ff966c
--color=spinner:#ff007c'


#################
# Powerlevel10k #
#################
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.


####################
### Key bindings ###
####################
bindkey '^y' autosuggest-accept
bindkey '^ ' autosuggest-accept
# Custom Escape keybinding for the zsh-vi-mode plugin
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# Rebind ctrl+l to ctrl+shift+l to keep compatibility with vim-navigator
bindkey '^L' undefined-key
bindkey '^[[1;6L' clear-screen


###########################
# Prompt history settings #
###########################
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


######################
# Completion styling #
######################
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons --color=always $realpath'


##################
# Source Wikiman #
##################
source /usr/share/wikiman/widgets/widget.zsh


##############
# bat config #
##############


############
# the fuck #
############
eval $(thefuck --alias)
eval $(thefuck --alias fk)

#############################
# oh-my-zsh auto-correction #
#############################
# ENABLE_CORRECTION="false"


######################
# yazi shell wrapper #
######################
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
