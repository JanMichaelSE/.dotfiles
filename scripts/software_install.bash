#!/usr/bin/env bash

echo -e "\n<<< Starting $0 >>>\n"

# Check if Rust and Cargo are installed
if ! command -v "cargo" &>/dev/null; then
  echo "Installing Rust and Cargo..."
  sudo apt install rustc cargo -y
fi

# Check if Snap are installed
if ! command -v "snap" &>/dev/null; then
  echo "Installing Snap..."
  sudo apt install snapd -y
fi

# Check if bat is installed
echo -e "\n<<< Checking if bat is installed. >>>\n"
if ! command -v "bat" &>/dev/null; then
  echo "bat is not installed. Installing..."
  wget -O ~/Downloads/bat-musl_0.23.0_amd64.deb https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-musl_0.23.0_amd64.deb
  if [ -e ~/Downloads/bat-musl_0.23.0_amd64.deb ]; then
    sudo dpkg -i ~/Downloads/bat-musl_0.23.0_amd64.deb
    rm ~/Downloads/bat-musl_0.23.0_amd64.deb
  fi
else
  echo "bat is already installed."
fi

#check if pip isnstall
echo -e "\n<<< Checking if pip3 is installed. >>>\n"
if ! command -v "pip3" &>/dev/null; then
  echo "pip3 is not installed. Installing..."
  sudo apt install python3-pip -y
else
  echo "pip3 is already installed."
fi

# Check if exa is already installed
echo -e "\n<<< Checking if exa is installed. >>>\n"
if command -v "exa" &>/dev/null; then
  echo "exa is already installed."
else
  echo "exa is not installed. Attempting to install with apt..."

  # Try to install exa using apt
  if sudo apt install exa -y; then
    echo "exa is installed via apt."
  else
    echo "exa cannot be installed with apt. Proceeding with Cargo installation..."

    # Install exa using Cargo
    echo "Installing exa..."
    cargo install exa

    # Add Cargo bin directory to PATH (if not already added)
    if ! grep -q "$HOME/.cargo/bin" "$HOME/.bashrc"; then
      echo 'export PATH="$HOME/.cargo/bin:$PATH"' >>"$HOME/.bashrc"
      source "$HOME/.bashrc"
    fi
  fi
fi

# Check if tree is installed
echo -e "\n<<< Checking if tree is installed. >>>\n"
if ! command -v "tree" &>/dev/null; then
  echo "tree is not installed. Installing..."
  sudo apt install tree -y
else
  echo "tree is already installed."
fi

# Check if fzf is installed
echo -e "\n<<< Checking if fzf is installed. >>>\n"
if ! command -v "fzf" &>/dev/null; then
  echo "fzf is not installed. Installing..."
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
else
  echo "fzf is already installed."
fi

# Check if lazydocker is installed is installed
echo "\n<<< Checking if lazydocker is installed. >>>\n"
if ! command -v "lazydocker" &>/dev/null && [ ! -f "/usr/local/bin/lazydocker" ]; then
  echo "lazydocker is not installed. Installing..."

  sudo curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

else
  echo "lazydocker is already installed."
fi

# Check if go is installed
echo -e "\n<<< Checking if go is installed. >>>\n"
if ! command -v go &>/dev/null; then
  echo "go is not installed. Installing..."

  go_version="1.21.3" # Update this to the latest version
  download_url="https://golang.org/dl/go${go_version}.linux-amd64.tar.gz"

  # Download and install Go
  wget $download_url -O /tmp/go.tar.gz
  sudo tar -C /usr/local -xzf /tmp/go.tar.gz

else
  echo "go is already installed."
fi

# Check if delve (Go Debug Adapter) is installed
echo -e "\n<<< Checking if delve (Go Debug Adapter) is installed. >>>\n"
if ! command -v "dlv" &>/dev/null; then
  echo "delve (Go Debug Adapter) is not installed. Installing..."
  go install github.com/go-delve/delve/cmd/dlv@latest

else
  echo "delve (Go Debug Adapter) is already installed."
fi

# Check if shellcheck is installed
echo -e "\n<<< Checking if shellcheck is installed. >>>\n"
if ! command -v "shellcheck" &>/dev/null; then
  echo "shellcheck is not installed. Installing..."
  sudo apt install shellcheck -y
else
  echo "shellcheck is already installed."
fi

# Check if htop is installed
echo -e "\n<<< Checking if htop is installed. >>>\n"
if ! command -v "htop" &>/dev/null; then
  echo "htop is not installed. Installing..."
  sudo apt install htop -y
else
  echo "htop is already installed."
fi

echo -e "\n<<< software install finished. >>>\n"
