# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100
setopt glob_dots                # include dotfiles in globbing
setopt extendedglob nomatch
# By default, ^S freezes terminal output and ^Q resumes it. Disable that so
# # that those keys can be used for other things.
unsetopt flowcontrol
unsetopt appendhistory autocd beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename $HOME'/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall



# aliases
source $HOME/.aliases
if [ -f "$HOME/.system_specific_aliases" ]; then
  source "$HOME/.system_specific_aliases"
fi



# zplug init & plugins
source ~/.zplug/init.zsh
zplug "geometry-zsh/geometry"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zdharma-continuum/zsh-diff-so-fancy"
zplug "agkozak/zsh-z"
zplug "chriskempson/base16-shell"
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
                    
# Then, source plugins and add commands to $PATH
zplug load



# go paths
export GOROOT=/usr/lib/go-1.8
export PATH=$PATH:$GOROOT/bin

# go scripts to path
export PATH=$PATH:~/go/bin

# java home
JAVA_HOME="/usr/bin/java"

# home bin dir to path
export PATH=$PATH:~/bin

# .local/bin to path (python scripts)
export PATH=$PATH:~/.local/bin



# configure markdownviewer theme
export MDV_THEME=884.0134



# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh



# configure less to handle ASCI ESC characters
export LESS=r$LESS



# haskell
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"



# use gpg key for ssh authentication
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"



DOTNET_CLI_TELEMETRY_OPTOUT=1



dsf() {
  diff -u $1 $2 | diff-so-fancy
}
