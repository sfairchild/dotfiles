# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

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
plugins=(
  aws
  battery
  brew 
  command-time
  docker
  git
  kubectl
  kubectx
  node
  terraform
  tmuxinator
  vi-mode
  wd
  web-search
  zsh-interactive-cd
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

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

set opt prompt_subst

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}<<<<< $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


alias vi=nvim
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias reload=". ~/.zshrc"

export PGE_LP_NAME="PGE/PGE_S3FF"
export LANID="s3ff"
function saml_aws () {
  # aws sts get-caller-identity

  local old_profile=$AWS_PROFILE
  AWS_PROFILE="default"

  set_proxy
    local login_lanid=$LANID
    local pw=$(lpass show -p $PGE_LP_NAME)
  unset_proxy

  echo "Logging in as ${login_lanid}!!!"
  python ~/aws-auth-saml-federation-cli/samlapi.py -u ${login_lanid} -p ${pw}
  if [ $# -gt 0 ]; then
    export AWS_PROFILE=$1
  elif [ ! -z "${old_profile}" ]; then
    export AWS_PROFILE=${old_profile}
  fi
}

function authgrunt() {
  if [[ -z $AWS_PROFILE ]]; then
    echo "Please set AWS_PROFILE"
    return 1
  fi
  local role_arn=$(aws configure get role_arn)

  export CREDS=$(aws sts assume-role --role-arn ${role_arn} --role-session-name AWSCLI-Session --duration-seconds 3600)
  export AWS_ACCESS_KEY_ID="$(echo $CREDS | jq -r .Credentials.AccessKeyId)"
  export AWS_SECRET_ACCESS_KEY="$(echo $CREDS | jq -r .Credentials.SecretAccessKey)"
  export AWS_SESSION_TOKEN="$(echo $CREDS | jq -r .Credentials.SessionToken)"
  export AWS_CA_BUNDLE=~/.aws/pge-aws-cert-bundle.pem
}

function unset_authgrunt() {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN
  unset AWS_CA_BUNDLE
}

export PATH=$PATH:/Applications/Couchbase\ Server.app/Contents/Resources/couchbase-core/bin
export NODE_EXTRA_CA_CERTS=/Users/S3FF/.aws/pge-aws-cert-bundle.pem
export PAGER=''
export GIT_EDITOR=nvim
export EDITOR=nvim

function set_proxy() {
  export https_proxy=http://webcache.comp.pge.com:8080
  export ALL_PROXY=http://webcache.comp.pge.com:8080
}

function unset_proxy() {
  unset https_proxy
  unset ALL_PROXY
}

# alias t=terraform

# source ~/.zsh/git.zsh
# export PATH="/usr/local/sbin:$PATH"
export AWS_SDK_LOAD_CONFIG=1
export NODE_EXTRA_CA_CERTS=/Users/S3FF/.aws/pge-aws-cert-bundle.pem

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#compdef cdktf
###-begin-cdktf-completions-###
#
# yargs command completion script
#
# Installation: ../../../.asdf/installs/nodejs/15.13.0/.npm/bin/cdktf completion >> ~/.zshrc
#    or ../../../.asdf/installs/nodejs/15.13.0/.npm/bin/cdktf completion >> ~/.zsh_profile on OSX.
#
# _cdktf_yargs_completions()
# {
#   local reply
#   local si=$IFS
#   IFS=$'
# ' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" ../../../.asdf/installs/nodejs/15.13.0/.npm/bin/cdktf --get-yargs-completions "${words[@]}"))
#   IFS=$si
#   _describe 'values' reply
# }
# compdef _cdktf_yargs_completions cdktf
###-end-cdktf-completions-###

# . /usr/local/opt/asdf/libexec/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh
export PATH="/usr/local/sbin:$PATH"

# HISTORY OPTIONS

export HISTFILE=~/.zsh_history
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE

export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

[[ -f $HOME/.aws/functions.sh ]] && source $HOME/.aws/functions.sh
