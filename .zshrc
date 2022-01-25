autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
PROMPT='%n@%M %~'\$vcs_info_msg_0_' %# '
RPROMPT="%D{%H:%M}"
precmd(){ vcs_info }

# alias
#alias vim='nvim'
alias rm='rm -i'
alias cp='cp -v'
alias arm="exec arch -arch arm64e /bin/zsh --login"
alias x64="exec arch -arch x86_64 /bin/zsh --login"

# option
setopt prompt_subst
setopt no_beep
setopt nolistbeep
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history
setopt correct
setopt print_eight_bit

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit && compinit
  compinit
fi

# Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux
#only linux
setxkbmap -option "ctrl:nocaps"
