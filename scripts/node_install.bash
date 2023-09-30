#!/usr/bin/env bash

echo -e "\n<<< Running $0 >>>\n"

# Node versions are managed with `n`, which is can be installed using
# the following command `curl -L https://bit.ly/n-install | N_PREFIX=$HOME/.n bash -s  -- -yqn`
# See config.fish for N_PREFIX variable and addition to PATH.

if ! command -v "node" &> /dev/null; then
  echo "Installing Node & NPM with n..."
  curl -L https://bit.ly/n-install | N_PREFIX=$HOME/.n bash -s  -- -yqn
else
  echo "node $(node --version) & NPM $(npm --version) already installed."
fi

# This is needed for "n"
export N_PREFIX="$HOME/.n"

# Check if $N_PREFIX/bin is already in the PATH
if [[ ":$PATH:" != *":$N_PREFIX/bin:"* ]]; then
    # If not, add it to the PATH
    export PATH="$N_PREFIX/bin:$PATH"
    
else
    echo "$N_PREFIX/bin is already in the PATH"
fi

# Define a marker for the block of text
marker="# N_PREFIX block"

# Define the lines to be added to .bashrc
lines="
$marker
export N_PREFIX=\"$HOME/.n\"
if [[ \":\$PATH:\" != *\":\$N_PREFIX/bin:\"* ]]; then
    export PATH=\"\$N_PREFIX/bin:\$PATH\"
fi
$marker
"

# Check if the marker is already present in .bashrc, if not, append the lines
if ! grep -q "$marker" ~/.bashrc ; then
    echo "$lines" >> ~/.bashrc
    echo "Lines were added to .bashrc"
else
    echo "Lines are already present in .bashrc"
fi

# Fish shell
fish_marker="# N_PREFIX block"
fish_lines="
$fish_marker
set -gx N_PREFIX \"$HOME/.n\"
if not contains \"$N_PREFIX/bin\" $PATH
    set -gx PATH \"$N_PREFIX/bin\" $PATH
end
$fish_marker
"

if ! grep -q "$fish_marker" ~/.config/fish/config.fish ; then
    echo "$fish_lines" >> ~/.config/fish/config.fish
    echo "Lines were added to Fish config"
else
    echo "Lines are already present in Fish config"
fi

# Function to install a global npm package if it's not already installed
install_global_package() {
  local package_name="$1"
  if ! npm ls -g "$package_name" &> /dev/null; then
    echo "Installing $package_name..."
    npm install --global "$package_name"
  else
    echo "$package_name is already installed."
  fi
}

# Install Global NPM Packages with conditions
install_global_package "npm@latest"
install_global_package "typescript"
install_global_package "trash-cli"
install_global_package "eslint"
install_global_package "tree-sitter-cli"
install_global_package "@johnnymorganz/stylua-bin"

echo "Global NPM Packages Installed:"
npm list --global --depth=0
