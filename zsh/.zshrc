source ~/.config/zsh/base.zsh
source ~/.config/zsh/plugins.zsh
source ~/.config/zsh/aliases.zsh

eval "$(~/.local/bin/mise activate zsh)"
eval "$(zoxide init zsh)"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/imtiaz/apps/google-cloud-sdk/path.zsh.inc' ]; then . '/home/imtiaz/apps/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/imtiaz/apps/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/imtiaz/apps/google-cloud-sdk/completion.zsh.inc'; fi

# pnpm
export PNPM_HOME="/home/imtiaz/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# starship
eval "$(starship init zsh)"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

# export BROWSER="wslview"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:$HOME/.maestro/bin

# opencode
export PATH=/Users/imtiazmukadam/.opencode/bin:$PATH
