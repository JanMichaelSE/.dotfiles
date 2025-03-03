#!/usr/bin/env bash

echo -e "\n<<< Running $0 >>>\n"

# Check if nvim is installed
echo -e "\n<<< Checking if nvim is installed. >>>\n"
if ! command -v "nvim" &>/dev/null; then
  echo "nvim is not installed. Installing..."
  sudo apt install libfuse2 -y
  wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage
  chmod +x nvim-linux-x86_64.appimage
  sudo mv nvim-linux-x86_64.appimage /usr/bin/nvim
else
  echo "nvim is already installed."
fi

# Check if required dependencies are installed
echo -e "\n<<< Checking if dependencies are installed. >>>\n"
if ! command -v "unzip" ||
  ! command -v "ripgrep" ||
  ! command -v "make" ||
  ! command -v "fdfind" ||
  ! command -v "gcc" &>/dev/null; then
  echo "Installing dependencies..."
  sudo apt install unzip ripgrep make gcc fd-find -y
fi

# Check if font is installed
FONT_NAME="CaskaydiaCove NF"
FONT_ZIP="CascadiaCode.zip"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/$FONT_ZIP"

echo -e "\n<<< Checking if the font required is installed. >>>\n"
if fc-list | grep -i "$FONT_NAME" &>/dev/null; then
  echo "Font $FONT_NAME is already installed."
else
  echo "Font $FONT_NAME is not installed. Downloading and installing..."

  # Create fonts directory if it doesn't exist
  FONT_DIR="/usr/share/fonts/$FONT_NAME"
  sudo mkdir -p "$FONT_DIR"

  # Download and unzip the font
  DOWNLOAD_DIR="$HOME/Downloads"
  sudo mkdir -p "$DOWNLOAD_DIR"
  wget -P "$DOWNLOAD_DIR" "$FONT_URL"
  sudo unzip "$DOWNLOAD_DIR/$FONT_ZIP" -d "$FONT_DIR"

  # Update font permissions
  chmod 755 "${FONT_DIR}/*"

  # Update font cache
  sudo fc-cache -f -v

  echo "Font $FONT_NAME installed successfully."
fi

echo -e "\n<<< nvim setup finished. >>>\n"
