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

# Check if Discord is already installed by looking for the desktop entry
echo -e "\n<<< Checking if discord is installed. >>>\n"
if ! grep -q "discord" /usr/share/applications/*; then
    echo "discord is not installed. Installing..."

    # Define the URL of the DEB package
    URL="https://dl.discordapp.net/apps/linux/0.0.58/discord-0.0.58.deb"

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
echo -e "\n<<< Checking if spotify is installed. >>>\n"
if ! grep -q "spotify" /usr/share/applications/*; then
    echo "spotify is not installed. Installing..."

    # Import the Spotify repository GPG key
    curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

    # Update the list of available packages
    sudo apt-get update -y

    # Install Spotify
    sudo apt-get install spotify-client -y

else
    echo "Spotify is already installed."
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

    # Update the list of available packages
    echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
    sudo apt update -y

    # Install Notion
    sudo apt install notion-app-enhanced -y

else
    echo "Notion is already installed."
fi

# Check if Vivaldi is installed, if not, install it
if ! command -v vivaldi &> /dev/null
then
    echo "Installing Vivaldi..."
    
    # Download Vivaldi's official public PGP key
    wget -qO- https://download.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -
    
    # Add Vivaldi's APT repository
    sudo add-apt-repository 'deb https://downloads.vivaldi.com/stable/deb/ stable main'
    
    # Update the package list
    sudo apt-get update
    
    # Install Vivaldi
    sudo apt-get install -y vivaldi-stable

    echo "Vivaldi installed successfully."
else
    echo "Vivaldi is already installed."
fi

# Check if Slack is already installed
if ! command -v slack &> /dev/null
then
    echo "Slack is not installed. Installing now."

    # Add Slack's official package repository
    wget -O - https://packagecloud.io/slacktechnologies/slack/gpgkey | sudo apt-key add -
    echo "deb https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" | sudo tee -a /etc/apt/sources.list.d/slack.list

    # Update package lists
    sudo apt-get update

    # Install Slack
    sudo apt-get install slack-desktop

    echo "Slack installed successfully."
else
    echo "Slack is already installed."
fi

# Check if IntelliJ IDEA Ultimate is already installed by looking for the desktop entry
echo -e "\n<<< Checking if IntelliJ IDEA Ultimate is installed. >>>\n"
if ! grep -q "IntelliJ IDEA Ultimate" /usr/share/applications/*; then
    echo "IntelliJ IDEA Ultimate is not installed. Installing..."

    # Update package list and install dependencies
    sudo apt update
    sudo apt install -y wget tar

    # Define IntelliJ IDEA version
    INTELLIJ_VERSION="2024.1.4"
    INTELLIJ_TAR="ideaIU-$INTELLIJ_VERSION.tar.gz"
    
    # Download IntelliJ IDEA Ultimate
    wget "https://download.jetbrains.com/idea/$INTELLIJ_TAR"
    
    # Extract the downloaded tar.gz file
    tar -xzf $INTELLIJ_TAR
    
    # Move IntelliJ to /opt directory
    sudo mv idea-IU-* /opt/intellij
    
    # Create a symbolic link to the IntelliJ IDEA executable
    sudo ln -s /opt/intellij/bin/idea.sh /usr/local/bin/idea
    
    # Clean up downloaded file
    rm $INTELLIJ_TAR
    
    # Optional: Create a desktop entry for IntelliJ IDEA
    echo "[Desktop Entry]
    Name=IntelliJ IDEA Ultimate
    Comment=IntelliJ
    Exec=/opt/intellij/bin/idea.sh
    Icon=/opt/intellij/bin/idea.png
    Terminal=false
    Type=Application
    Categories=Development;IDE;" | sudo tee /usr/share/applications/intellij-idea-ultimate.desktop
    
    echo "IntelliJ IDEA Ultimate installation completed successfully!"
else
    echo "IntelliJ IDEA Ultimate is already installed."
fi

