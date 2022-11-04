# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it does not exist or it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /usr/local/opt/asdf/asdf.sh

export ASDF_DIR=/usr/local/opt/asdf

export GPG_TTY=$(tty)
PATH=/Users/S3FF/.asdf/shims:$PATH

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit -i
complete -C '/Users/S3FF/.asdf/shims/aws_completer' aws
complete -o nospace -C /Users/S3FF/.asdf/installs/terraform/0.12.24/bin/terraform terraform
fpath=(~/.zsh/completion $fpath)

source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl kubectl

fpath=(~/.zim/modules/ohmyzsh/plugins/wd $fpath)

export ADMIN_LANID=s3ffadmin
export LANID=s3ff
function saml_aws () {
  local old_profile=$AWS_PROFILE
  unset AWS_PROFILE

  if [[ $1 =~ ^psps ]]; then
    local login_lanid=$LANID
  else
    local login_lanid=$ADMIN_LANID
  fi

  echo "Logging in as ${login_lanid}!!!"
  python ~/aws-auth-saml-federation-cli/samlapi.py -u ${login_lanid}
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

alias vi=nvim
alias t=terraform
# export https_proxy=http://webcache.comp.pge.com:8080
# export ALL_PROXY=http://webcache.comp.pge.com:8080
#
source ~/.zsh/git.zsh
export PATH="/usr/local/sbin:$PATH"
export AWS_SDK_LOAD_CONFIG=1
