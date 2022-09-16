# make nvim config directory if not exists and parents
mkdir -p $HOME/.config/nvim

# create syslinks
# -s = symlink
# -f = overwrite existing symlink
# -v = be noisy
ln -sfv "$(dirname $PWD)/neovim/*" $HOME/.config/nvim/

