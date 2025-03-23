#!/bin/bash

# Check if WhatsApp is already installed by looking for the desktop entry
echo -e "\n<<< Checking if whatsapp is installed. >>>\n"
if ! grep -q "whatsapp" /usr/share/applications/*; then
  echo "whatsapp is not installed. Installing..."

  # Define the URL of the DEB package
  URL="https://zerkc.gitlab.io/whatsdesk/whatsdesk_0.3.9_amd64.deb"

  # Download the DEB package
  wget -O whatsapp.deb "$URL"

  # Install the DEB package
  sudo dpkg -i whatsapp.deb

  # Fix any potential missing dependencies
  sudo apt-get install -f

  # Clean up
  rm whatsapp.deb

else
  echo "WhatsApp is already installed."
fi

# Check if Flameshot is already installed by looking for the desktop entry
echo -e "\n<<< Checking if flameshot is installed. >>>\n"
if ! grep -q "flameshot" /usr/share/applications/*; then
  echo "flameshot is not installed. Installing..."

  # Update the list of available packages
  sudo apt-get update -y

  # Install Flameshot
  sudo apt-get install flameshot -y

else
  echo "Flameshot is already installed."
fi

# Check if Notion is already installed by looking for the desktop entry
echo -e "\n<<< Checking if Notion is installed. >>>\n"
if ! grep -q "Notion" /usr/share/applications/*; then
  echo "Notion is not installed. Installing..."

  sudo snap install notion-desktop

  echo "Notion is now installed."
else
  echo "Notion is already installed."
fi

echo -e "\n<<< Checking if Ghostty Terminal is installed. >>>\n"
if ! command -v ghostty &>/dev/null; then
  echo "Ghostty Terminal is not installed. Snap installing now..."

  snap install ghostty --classic

  echo "Ghostty Terminal built and installed successfully!"
else
  echo "Ghostty Terminal is already installed."
fi
