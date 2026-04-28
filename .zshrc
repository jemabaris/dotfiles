#############
# Add fetch #
#############
# if [[ $- == *i* && -z $TMUX ]]; then
#   fastfetch
# fi

# nitch


################################
# Powerlevel10k instant prompt #
################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


##################
# Source secrets #
##################
[ -f ~/dotfiles/secrets/.secrets ] && source ~/dotfiles/secrets/.secrets


##############################
# Activate manim virtual env #
##############################
manim-activate() {
  if [ -d ".venv" ]; then
    source .venv/bin/activate
  else 
    echo "No .venv found in the current directory."
  fi
}

###################
# Claude Code env #
###################
export CLAUDE_CODE_USE_OPENAI=1
export OPENAI_BASE_URL=http://localhost:11434/v1
export OPENAI_MODEL=gemma4:31b


#########################
# Environment variables #
#########################
export PATH="$HOME/.config/emacs/bin:$PATH"

##################
# minimax neovim #
##################
alias minimax="NVIM_APPNAME=nvim-minimax nvim"

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

# Only run keychain outside of tmux
# if [ -z "$TMUX" ]; then
#     eval "$(keychain --eval --quiet --nogui ~/.ssh/id_ed25519)"
# else
#     # Inside tmux, just source the existing keychain env
#     [ -f ~/.keychain/"$(hostname)-sh" ] && source ~/.keychain/"$(hostname)-sh"
# fi


###################################
# tmux attach to existing session #
###################################
# if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
#     exec tmux new-session -A -s Janis_tmux01
# fi
#
#if [ -z "$TMUX" ]; then
#  tmux attach-session -t last 2>/dev/null || tmux new-session
#fi
t() {
  tmux attach 2>/dev/null || tmux new-session
}

# Attach to tmux session using sesh and g
t-gum() {
  sesh connect "$(sesh list -i | gum filter --limit 1 --placeholder 'Pick a sesh' --prompt='⚡ ')"
}

# Pick existing tmux session with pizzazz!
t-pick() {
  # Colorful header
  gum style \
    --border double \
    --border-foreground 212 \
    --foreground 212 \
    --padding "0 2" \
    --bold \
    "⚡ TMUX SESSION PICKER"

  # Pick a session
  local session=$(tmux list-sessions -F "#{session_name}  #{session_windows} windows  [#{session_attached} attached]" \
    | gum filter \
        --placeholder "Search sessions..." \
        --prompt "  " \
        --height 10 \
    | awk '{print $1}')

  [[ -z "$session" ]] && return

  # Attach or switch depending on context
  if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$session"
  else
    tmux attach-session -t "$session"
  fi
}


###############
# Add Aliases #
###############
alias up="arch-smart-update" # Advanced update script to update all pacman and AUR packages
alias srczsh="source ~/.zshrc"
alias ff="fastfetch"
alias rizz="WallRizz -d ~/Documents/Ricing/Wallpaper/"
alias zj="zellij"
alias record='gpu-screen-recorder-gtk'
alias s='sesh connect $(sesh list | fzf)'
alias deepseek='ollama run deepseek-r1:32b'
alias claude='openclaude'
alias kitty-float=hyprctl dispatch exec "[workspace special:terminal silent] kitty --title scratchpad"
alias ts='sesh connect $(sesh list | fzf)'
alias dash="gh dash"
alias tidal='lumitide'
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

# openhue aliases
alias lounge-off='openhue set room Lounge --off'
alias produktion='openhue set scene Produktion'
# git aliases
# alias gcam='git commit -am' Already in ohmyzsh git plugin

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
alias lf='eza -lah --icons --only-files' # files only
alias ld='eza -lah --icons --only-dirs' # directories only
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
--preview-window=right:65%:wrap
--preview-label="alt-p: toggle description, alt-j/k: scroll"
--preview-label-pos=bottom
--preview "~/.config/fzf/preview.sh {}"
--bind 'alt-p:toggle-preview'
--bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up'
--bind 'alt-k:preview-up,alt-j:preview-down'
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

###################
# FZF commandlets #
###################
# cd into a sub-directory using fzf
cdf() {
  local dir
  dir=$(find . -type d | fzf --preview 'ls -la {}')
  [ -n "$dir" ] && cd "$dir"
}

# cd into any directory in the home folder using fzf
cdfh() {
  local dir
  dir=$(find ~ -type d 2>/dev/null | fzf --preview 'ls -la {}')
  [ -n "$dir" ] && cd "$dir"
}

# Open a file in nvim using fzf
vif() {
  local file
  file=$(fzf --preview 'bat --color=always --line-range :100 {}')
  [ -n "$file" ] && nvim "$file"
}

# Kill a process using fzf
fkill() {
  local pid sig
  sig=${1#-}  # strip leading dash if present
  pid=$(ps aux | fzf --header-lines=1 --reverse --height=40% | awk '{print $2}')
  [ -n "$pid" ] && kill -${sig:-9} "$pid" && echo "Killed PID $pid"
}

# Git checkout using fzf
gcof() {
  local branch
  branch=$(git branch --all | fzf | tr -d '[:space:]*')
  [ -n "$branch" ] && git checkout "$branch"
}

# Open files using fzf and xdg-open
fopen() {
  local root="${1:-$PWD}"
  local show_hidden=false

  if [[ "$1" == "-a" ]]; then
    show_hidden=true
    root="${2:-$PWD}"
  fi

  local fzf_input
  if command -v fd &>/dev/null; then
    if $show_hidden; then
      fzf_input="fd --type f --hidden --follow . \"$root\""
    else
      fzf_input="fd --type f --follow . \"$root\""
    fi
  else
    if $show_hidden; then
      fzf_input="find \"$root\" -type f 2>/dev/null"
    else
      fzf_input="find \"$root\" -type f -not -path '*/\.*' 2>/dev/null"
    fi
  fi

  # write preview scripts to temp files so fzf can reliably swap between them
  local preview_default_script
  preview_default_script=$(mktemp /tmp/fopen_preview_XXXXXX.sh)
  cat > "$preview_default_script" << 'EOF'
mime=$(file --mime-type -b "$1")
case "$mime" in
  video/*)
    echo "video: $(basename "$1")"
    echo ""
    ffprobe -v quiet -print_format json -show_format "$1" 2>/dev/null \
      | grep -E '(duration|size|bit_rate)' \
      | sed 's/[",]//g; s/^ *//'
    echo ""
    echo "[ctrl-t: load thumbnail]"
    ;;
  image/*)
    if command -v kitty &>/dev/null; then
      kitty icat --clear --transfer-mode=memory --stdin=no "$1" 2>/dev/null
    elif command -v viu &>/dev/null; then
      viu "$1" 2>/dev/null
    elif command -v chafa &>/dev/null; then
      chafa "$1" 2>/dev/null
    fi
    ;;
  *)
    bat --style=numbers --color=always "$1" 2>/dev/null || cat "$1"
    ;;
esac
EOF
  chmod +x "$preview_default_script"

  local preview_video_script
  preview_video_script=$(mktemp /tmp/fopen_preview_XXXXXX.sh)
  cat > "$preview_video_script" << 'EOF'
mime=$(file --mime-type -b "$1")
case "$mime" in
  video/*)
    tmp=$(mktemp /tmp/fopen_thumb_XXXXXX.jpg)
    ffmpegthumbnailer -i "$1" -o "$tmp" -s 0 -q 5 2>/dev/null
    if command -v kitty &>/dev/null; then
      kitty icat --clear --transfer-mode=memory --stdin=no "$tmp" 2>/dev/null
    elif command -v viu &>/dev/null; then
      viu "$tmp" 2>/dev/null
    elif command -v chafa &>/dev/null; then
      chafa "$tmp" 2>/dev/null
    fi
    rm -f "$tmp"
    echo "[ctrl-g: hide thumbnail]"
    ;;
  image/*)
    if command -v kitty &>/dev/null; then
      kitty icat --clear --transfer-mode=memory --stdin=no "$1" 2>/dev/null
    elif command -v viu &>/dev/null; then
      viu "$1" 2>/dev/null
    elif command -v chafa &>/dev/null; then
      chafa "$1" 2>/dev/null
    fi
    ;;
  *)
    bat --style=numbers --color=always "$1" 2>/dev/null || cat "$1"
    ;;
esac
EOF
  chmod +x "$preview_video_script"

  local label_default=' alt-p: toggle preview  alt-j/k: scroll  ctrl-t: video thumb '
  local label_with_video=' alt-p: toggle preview  alt-j/k: scroll  ctrl-g: hide video thumb '

  local selected
  selected=$(
    FZF_DEFAULT_COMMAND="$fzf_input" \
    fzf --multi \
        --prompt=' open: ' \
        --preview="bash $preview_default_script {}" \
        --preview-window='right:55%:wrap' \
        --preview-label="$label_default" \
        --preview-label-pos=bottom \
        --bind "ctrl-t:change-preview(bash $preview_video_script {})+change-preview-label($label_with_video)" \
        --bind "ctrl-g:change-preview(bash $preview_default_script {})+change-preview-label($label_default)" \
        --bind 'alt-p:toggle-preview' \
        --bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up' \
        --bind 'alt-k:preview-up,alt-j:preview-down'
  )

  # clear any lingering kitty image after fzf exits
  if command -v kitty &>/dev/null; then
    kitty icat --clear 2>/dev/null
  fi

  # clean up temp scripts
  rm -f "$preview_default_script" "$preview_video_script"

  [[ -z "$selected" ]] && return 0

  while IFS= read -r file; do
    xdg-open "$file" &
  done <<< "$selected"
}

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

###########
# Widgets #
###########
# Copy current command to clipboard
# copy-command() {
#   print -rn -- $BUFFER | wl-copy
# }
# zle -N copy-command
# bindkey '^Xc' copy-command


copy-command() {
  print -rn -- $BUFFER | wl-copy
  zle -M "Copied to clipboard"
}
zle -N copy-command
bindkey '^Xc' copy-command


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
export PATH="$HOME/.npm-global/bin:$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
