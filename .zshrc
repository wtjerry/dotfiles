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
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'



# zplug init & plugins
source ~/.zplug/init.zsh
zplug "geometry-zsh/geometry"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zdharma/zsh-diff-so-fancy"
zplug "agkozak/zsh-z"
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
                    
# Then, source plugins and add commands to $PATH
zplug load --verbose



# BASE16 init 
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"



# virtualenv and virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh



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
export MDV_THEME=528.9419



# sourcing z for jumping around
source ~/coding/git/z/z.sh



# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

