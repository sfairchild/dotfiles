#! /bin/zsh

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BACKUP_DIR="$SCRIPT_DIR/backups/$(hostname)/$(date +%s)"
DOTFILES="$SCRIPT_DIR/dotfiles"

COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
    echo -e "\n${COLOR_PURPLE}$1${COLOR_NONE}"
    echo -e "${COLOR_GRAY}==============================${COLOR_NONE}\n"
}

error() {
    echo -e "${COLOR_RED}Error: ${COLOR_NONE}$1"
    exit 1
}

warning() {
    echo -e "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
}

info() {
    echo -e "${COLOR_BLUE}Info: ${COLOR_NONE}$1"
}

success() {
    echo -e "${COLOR_GREEN}$1${COLOR_NONE}"
}

get_linkables() {
    echo ${$(find -H "$DOTFILES" -type f)#$DOTFILES/}
}

link_files() {
  for file in $(get_linkables); do
    backup_file $file
    make_directories ".$file"
    link_file $file
  done
}

make_directories() {
  local file=$1
  if [ "." != "$(dirname $file)" ] && ! [ -d "$HOME/$(dirname $file)" ]; then
    info "Making directory [$HOME/$(dirname $file)]"
    mkdir -p $HOME/$(dirname $file)
  fi
}

link_file() {
  local file="$1"
  local file_path="$SCRIPT_DIR/dotfiles/$file"

  if ! [ -L $HOME/.$file ]; then
    info "Linking file $file..."
    ln -s $file_path $HOME/.$file
  fi
}

backup_file() {
  local file_name="$1"; shift
  local file_home="$HOME/.$file_name"

  if [ -L $file_home ]; then
    if [ $(readlink $file_home) -ef $DOTFILES/$file_name ]; then
      info "Symlink for $file_name already exists..."
    else
      error "$file_home already symlinked to different location \"$(readlink $file_home)\". Move, Remove or Rename existing symlink and try again..."
    fi
  elif [ -f $file_home ]; then
    create_backup_directory
    info "Backing up dotfile file [$HOME/.$file_name] to the backup directory"
    mv $file_home $BACKUP_DIR/$file_name
  else
    info "File $file_name does not exist..."
  fi
}

create_backup_directory() {
  if ! [ -d $BACKUP_DIR ]; then
    info "Creating directory to backup existing configuration files at $BACKUP_DIR"
    mkdir -p $BACKUP_DIR
  fi
}

install_brew() {
  title "Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew update && brew upgrade && brew upgrade --cask
}

brew_bundle() {
  title "Brew Bundle"
  brew bundle --global
}

setup_asdf() {
  # used for elixir install
  KERL_CONFIGURE_OPTIONS="--disable-debug --disable-silent-rules --without-javac --enable-shared-zlib --enable-dynamic-ssl-lib --enable-hipe --enable-sctp --enable-smp-support --enable-threads --enable-kernel-poll --enable-wx --enable-darwin-64bit --with-ssl=$(which openssl)"

  # used for nodeJS install
  # bash -c '$ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
  # export GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"

  # # Imports Node.js release team's OpenPGP keys to the keyring
  # bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
  GNUPGHOME="${ASDF_DIR:-$HOME/.asdf}/keyrings/nodejs" && mkdir -p "$GNUPGHOME" && chmod 0700 "$GNUPGHOME"

  # Imports Node.js release team's OpenPGP keys to the keyring
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

while read -r l; do
  a=(`echo $l`)
  asdf plugin-add $a[1] $a[2]
  asdf install $a[1] latest
done < asdf-plugins
}
# link_file "Brewfile"

# get_linkables

# link_files
# install_brew
# brew_bundle
setup_asdf



