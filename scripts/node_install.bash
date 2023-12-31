#!/usr/bin/env bash

echo -e "\n<<< Running $0 >>>\n"

# Node versions are managed with `n`, which is can be installed using
# the following command `curl -L https://bit.ly/n-install | N_PREFIX=$HOME/.n bash -s  -- -yqn`
# See config.fish for N_PREFIX variable and addition to PATH.

if ! command -v "node" &> /dev/null; then
  echo "Installing Node & NPM with n..."
  curl -L https://bit.ly/n-install | N_PREFIX=$HOME/.n bash -s  -- -yn
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
install_global_package "bash-language-server"

echo "Global NPM Packages Installed:"
npm list --global --depth=0
