#!/usr/bin/env bash

echo  -e "\n<<< Running $0 >>>\n"

# Check if zsh is installed
echo -e "\n<<< Checking if zsh is installed >>>\n"
if ! command -v "zsh" &> /dev/null; then
  echo "zsh is not installed. Installing..."
  sudo apt update
  sudo apt install zsh -y
  chsh -s $(which zsh)
else
  echo "zsh is already installed."
fi

echo -e "\n<<< checking if starship is installed >>>\n"
if ! command -v "starship"; then
    echo "Installing starship..."
    curl -sS https://starship.rs/install.sh | sh
else
    echo "starship is already installed."
fi

echo -e "\n<<< checking if zap is installed >>>\n"
if ! command -v "zap" &> /dev/null; then
  echo "Installing zap..."
  zsh -c "$(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1"
  echo "zap installed successfully."
else
  echo "zap is already installed."
fi

echo -e "\n<<< zsh setup finished. >>>\n"

