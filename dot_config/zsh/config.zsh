setopt autocd
setopt inc_append_history
setopt interactive_comments

# # Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "$ZSH_COMPDUMP"
 _comp_options+=(globdots)		# Include hidden files.

