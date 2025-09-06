# ~/.zshrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Autocompletion
autoload -Uz compinit
compinit

# Keybinds
bindkey "^[[1;5C" forward-word   # ctrl + ->
bindkey "^[[1;5D" backward-word  # ctrl + <-
bindkey "^[[3~" delete-char      # del
bindkey "^[[2~" overwrite-mode   # ins
bindkey "^[[H" beginning-of-line # home
bindkey "^[[F" end-of-line       # end
bindkey "^R" history-incremental-search-backward
bindkey "^[[2;5~" copy            # ctrl + insert

export PS1="%{$(tput setaf 39)%}%n%{$(tput setaf 45)%}@%{$(tput setaf 51)%}%m %{$(tput setaf 195)%}%2d~ %{$(tput sgr0)%}$ "

eval "$(oh-my-posh init zsh --config ~/Documents/git/profile/ice.omp.json)"

HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=200000

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.

# kitty ssh fix
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"
