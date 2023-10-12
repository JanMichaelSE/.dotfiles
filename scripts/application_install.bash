#!/bin/bash

# Check if WhatsApp is already installed by looking for the desktop entry
if ! grep -q "whatsapp" /usr/share/applications/*; then

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

# Check if Discord is already installed by looking for the desktop entry
if ! grep -q "discord" /usr/share/applications/*; then

    # Define the URL of the DEB package
    URL="https://dl.discordapp.net/apps/linux/0.0.31/discord-0.0.31.deb"

    # Download the DEB package
    wget -O discord.deb "$URL"

    # Install the DEB package
    sudo dpkg -i discord.deb

    # Fix any potential missing dependencies
    sudo apt-get install -f

    # Clean up
    rm discord.deb

else
    echo "Discord is already installed."
fi

# Check if Spotify is already installed by looking for the desktop entry
if ! grep -q "spotify" /usr/share/applications/*; then

    # Import the Spotify repository GPG key
    curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

    # Update the list of available packages
    sudo apt-get update

    # Install Spotify
    sudo apt-get install spotify-client

else
    echo "Spotify is already installed."
fi
