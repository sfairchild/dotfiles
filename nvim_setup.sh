
# make nvim config directory if not exists and parents
mkdir -p ~/.config/nvim

# create syslinks
# -s = symlink
# -f = overwrite existing symlink
# -v = be noisy
ln -sfv $PWD/neovim/* ~/.config/nvim/
