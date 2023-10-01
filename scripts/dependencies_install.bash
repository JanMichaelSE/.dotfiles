#!/bin/bash

# Check if sudo is installed
echo -e "\n<<< Checking if sudo is installed. >>>\n"
if ! command -v "sudo" &> /dev/null; then
    echo "sudo is not installed. Installing..."
    apt update && apt install -y sudo
else
  echo "sudo is already installed."
fi

sudo apt update

sudo apt install -y git &&
    sudo apt install -y unzip &&
    sudo apt install -y wget &&
    sudo apt install -y curl &&
    sudo apt install -y python3 &&
    sudo apt install -y pip &&
    sudo apt install -y vim &&
    sudo apt install -y fontconfig

sudo apt upgrade -y
