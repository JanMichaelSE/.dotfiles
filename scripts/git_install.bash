# Check if gh cli is installed is installed
echo "\n<<< Checking if gh cli is installed. >>>\n"
if ! command -v "gh" &> /dev/null && [ ! -f "/usr/bin/gh" ]; then
  echo "gh cli is not installed. Installing..."
  sudo apt install gh -y
else
  echo "gh cli is already installed."
fi

# Check if lazygit is installed is installed
echo "\n<<< Checking if lazygit is installed. >>>\n"
if ! command -v "lazygit" &> /dev/null && [ ! -f "/usr/local/bin/lazygit" ]; then
  echo "lazygit is not installed. Installing..."

  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit /usr/local/bin

  rm lazygit.tar.gz lazygit

else
  echo "lazygit is already installed."
fi

# Check if delta is installed is installed
echo "\n<<< Checking if delta is installed. >>>\n"

# Check if delta is already installed
if ! command -v "delta" &> /dev/null && [ ! -f "/usr/bin/delta" ]; then
    echo "delta not found. Installing..."

    # Fetch the URL of the latest .deb release from GitHub
    DELTA_DEB_URL=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | grep "browser_download_url.*amd64.deb" | head -n 1 | cut -d '"' -f 4)

    # Download the .deb package
    wget "$DELTA_DEB_URL" -O delta.deb

    # Install the downloaded package
    sudo dpkg -i delta.deb

    # Fix any potential missing dependencies
    sudo apt-get update
    sudo apt-get --fix-broken install

    # Clean up
    rm delta.deb

    echo "delta installed successfully."
else
    echo "delta is already installed."
fi
