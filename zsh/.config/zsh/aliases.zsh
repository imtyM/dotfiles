alias cl='clear'
alias q='exit'
alias r='ranger'
alias mux='tmuxinator'
alias v='NVIM_APPNAME=lazy nvim'
alias asp='$HOME/pixel_art/aseprite/build/bin/aseprite'

alias sz='source ~/.zshrc'

alias gdpl='git pull && git pull origin develop'

#wealthbit aliases
alias ws='bin/webpack-dev-server'
alias be='bundle exec'
alias rs='bundle exec rails s'
alias rt='bundle exec rails t'
alias rc='bundle exec rails c'

# useful commands
alias check_space='sudo ncdu -x / --exclude /System/Volumes/Data --exclude /Volumes'

#cd aliases
alias cdus='cd ~/Library/Application\ Support/Übersicht/widgets/'

alias ghs='# Github CLI temporary workaround
# https://github.com/cli/cli/issues/6096
if [[ $(command -v gh) ]]; then
    gh auth refresh -h github.com -s user

    user=$(gh api -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" /user | jq -r .login)
    email=$(gh api -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" /user/emails | jq -r ".[0].email")
    echo "Setting $user <$email> as the default Git user..."
    git config --global user.name "$user"
    git config --global user.email "$email"
fi'
