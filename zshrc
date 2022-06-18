# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/andrii/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(git kubectl common-aliases docker aws vim-interaction)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='nvim'
# fix gpg: signing failed: Inappropriate ioctl for device #2798
# https://github.com/keybase/keybase-issues/issues/2798
export GPG_TTY=$(tty)

# source ~/.bash_aliases
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GOPATH=$HOME/workspace
export PATH=$PATH:$GOPATH/bin:/Users/andrii/.cargo/bin
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias c='cargo'
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
# Aliases
alias vim='nvim'
alias ga='git add '
alias gs='git status '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gl='git pull'
alias gca='git commit -a'
alias gapy='git ls-files . | grep '\.java$' | xargs git add'
alias f='/usr/local/bin/fd'
# Docker
alias datt='docker attach'
alias dcb='docker-compose build'
alias dclogs='docker-compose logs'
alias dcu='docker-compose up'
alias ddiff='docker diff'
alias deb='dexbash'
alias dimg='docker images'
alias dins='docker inspect'
alias dps='docker ps'
alias drm='docker rm'
alias drmi='docker rmi'
alias drun='docker run'
alias dstart='docker start'
alias dstop='docker stop'
alias dsa='docker stop $(docker ps -q)'
alias dcb='docker-compose up --build -d'
# K8S
# Date
export NOW=$(date +"%F")
export NOWT=$(date +"%T")
alias pjson='python -m json.tool'
alias ducks='du -h * | sort -rn | head'
alias vimrc='vim ~/.vimrc'
alias vs='vagrant ssh'
alias vp='vagrant up'
alias notes='cat ~/notes'
alias wttr='curl http://wttr.in/'
alias current_sprint="date +%y%V"
alias today="date +%d-%b-%Y\(%a\)"
alias tx=tmux
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
alias hu='cd /Users/andrii/workspace/src/github.com/astronomer/houston-api'
alias cli='cd /Users/andrii/workspace/src/github.com/astronomer/astro-cli'
alias dotfiles='cd ~/work/dotfiles'
alias gita="python3 -m gita"
# Kubernetes
#alias k="kubectl --kubeconfig=/Users/andrii/.kube/mot_config"
#alias k="kubectl --kubeconfig=/Users/andrii/.kube/mot_config"
function check {
    for i in $(git diff --name-only)
    do
        echo "isort -rc -m 3 $i";isort -rc -m 3 "$i"
        echo "flake8 $i"; flake8 "$i"
    done
}

function to_lower {
	python -c 'import sys;print(sys.stdin.read().replace(",","-").replace(" ", "-").replace("/", "-").replace(":","-").lower())'
}
alias gen_passwd='date +%s | md5 | base64 | head -c 7 ; echo'
alias pwgen='echo $(cat /dev/urandom | base64 | head -c 24)'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

#export GOPATH=$HOME/workspace


#if [ $TERM = 'linux' -a $SHELL == '/bin/bash' ] ; then
#        echo -e '\033[?17;0;64c'
#fi

alias dco="docker-compose"

function dcl() {
    docker-compose stop "$@"
    docker-compose rm -fv "$@"
    docker-compose up --build -d "$@"
}

function dclf() {
    docker-compose stop "$@"
    docker-compose rm -fv "$@"
    docker-compose up --build -d "$@"
    docker-compose logs -f "$@"
}

export CDPATH=.:~:~/workspace/src/github.com:~/workspace/src/bitbucket.org


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv --sort=-committerdate) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!*.pyc" --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*"'

# export PATH="/usr/local/opt/helm@2/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/andrii/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/andrii/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/andrii/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/andrii/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

export PATH="/Users/andrii/workspace/bin:/usr/local/opt/libpq/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andrii/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/andrii/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andrii/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/andrii/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$PATH:/Users/andrii/.nsccli/bin"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH=$PATH:/usr/local/kubebuilder/bin

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PYTHONBREAKPOINT='ipdb.set_trace'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
