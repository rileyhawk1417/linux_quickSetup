#!/bin/bash

# This script installs all the necessary 
# tools for a Web Developer and Android Developer
# Not all tools are prepared here 
# So some need to be installed individually


# This function installs VSCode via apt in terminal

function vsCode {
    echo "######Installing VSCODE#####"   

    sudo apt install software-properties-common apt-transport-https wget

    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

    sudo apt install code
}

# This function installs node

function nodeInstall {

    echo "######Installing Node#####"   

    curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs

}

#This function installs postgresql

function postgresql {
    echo "######Installing PostgreSql#####"   

# Create the file repository configuration:
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
sudo apt-get update

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
sudo apt-get -y install postgresql

}

function p10kTheme{

    echo "####Installing P10K, fonts will be installed manually####"

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    # Copy Fonts to library
    cp -r extra/fonts -t ~/Desktop 
    cp -b -f extra/profiles/.bashrc -t ~/
    cp -b -f extra/profiles/.tmux.conf -t ~/
    cp -b -f extra/profiles/.vimrc -t ~/
    cp -b -f extra/profiles/.zshrc -t ~/
    
    echo "####Sourcing Profiles####"

    source ~/.bashrc
    source ~/.vimrc
    source ~/.zshrc
}

function sqlite {

    sudo apt install sqlite3

}

function dataBase {

    postgresql
    sqlite

}

# This is to install the JRE
# The JDK needs to be downloaded seperately
# https://www.openlogic.com/openjdk-downloads

function jre {

    sudo apt install default-jre
    sudo apt install openjdk-11-jre-headless

}

# Install git, wget, curl for easy setup

function uploadTools {
    sudo apt-get install git wget curl
}

# Zsh terminal
function zsh {
    sudo apt update
    sudo apt install zsh
}

function zshConfig {
    sudo chsh -s $(which zsh)
}

function zshSetup {
    zsh
    zshConfig
    p10kTheme
}

#Virtual Machine
function kvmLib {
    sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager
}

function kvmConfig {
    sudo adduser $USER libvirt
    sudo adduser $USER kvm
}

function kvmSetup {
    kvmLib
    kvmConfig
}

# Chrome
function chromeInstall {

    echo "#####Downloading Chrome#####"
    cd ~/Downloads

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        
    echo "#####Installing Chrome#####"   
    sudo dpkg -i google-chrome-stable_current_amd64.deb
}

#FDM
function fdmInstall {
    echo "######Installing FDM#####"   

    cd ~/Downloads

    wget https://deb.fdmpkg.org/freedownloadmanager.deb
    echo "#####Installing FDM#####"   

    sudo dpkg -i freedownloadmanager.deb
}

function generalTools {
    fdmInstall
    chromeInstall
    sudo apt-get install vlc ncdu htop
}

function codingToolsOption {
    vsCode
    nodeInstall
    dataBase
    jre
    zshSetup
    uploadTools
    kvmSetup
}

function codingSuite {
    codingToolsOprtion
    generalTools
}

function generalToolsReadme {
    clear
    
    echo "The following will be installed ⚙️ : "
    echo ""
    echo "Google-Chrome - Web Browser," 
    echo "FDM - Download Manager alternative to IDM,"
    echo "VLC - Powerful Open Source Video Player"
    echo ""
}

function codingToolsReadme {
    clear
    
    echo "The following will be installed ⚙️ : "
    echo ""
    echo "Visual Studio Code - Powerful text editor," 
    echo "Node - Powerful library for JavaScript and other projects,"
    echo "Databases - These include Postgresql and Sqlite3"
    echo "JRE -  This is the Java Runtime Environment"
    echo "ZSH - Powerful terminal emulator with alot of tricks"
    echo "Upload Tools - These include git, wget, curl and other essentials"
    echo "KVM - This is a library for building virtual machines"
    echo ""
}

function codingSuiteReadme {
    clear 

    echo "The following is a summary of what will be installed ⚙️ : "
    echo ""
    echo "Coding Tools - Will install all the necessary tools" 
    echo "needed for Web Development and Android Development"
    echo "General Tools - Will install basic tools for a typical user"
    echo ""
}

function databaseOnlyReadme {
    clear

    echo "Database Tools will only be installed ⚙️ : "
    echo ""
    echo "Postgreql"
    echo "Sqlite3"
    echo ""
}
