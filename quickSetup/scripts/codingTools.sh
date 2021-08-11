#!/bin/bash

# Not all tools are prepared here 
# So some need to be installed individually
nextLine=\

function codingToolsOption() {
    uploadTools
    vsCode
    nodeInstall
    dataBase
    jre
    zsh
    CopyProfile
    kvmSetup
}

function codingToolsReadme() {
    clear
    
    echo "The following will be installed ⚙️ : "
    echo $nextLine
    echo "Visual Studio Code - Powerful text editor and IDE," 
    echo "Node - Powerful library for JavaScript and other node related projects,"
    echo "Databases - These include Postgresql and Sqlite3"
    echo "JRE -  This is the Java Runtime Environment"
    echo "ZSH - Powerful terminal emulator with alot of tricks"
    echo "Upload & Download Tools - These include git, wget, curl and other essentials"
    echo "KVM - This is a library for building virtual machines"
    echo "Preset profiles that would make setting up the environment easier"
    echo $nextLine
    echo "Install the tools"
    echo "Y/N"
}


function databaseOnlyReadme() {
    clear

    echo "Database Tools will only be installed ⚙️ : "
    echo $nextLine
    echo "Postgresql"
    echo "Sqlite3"
    echo $nextLine
    echo "Install the tools?"
    echo "Y/N"
}

# VSCode

function vsCode() {
    echo "######Installing VSCODE#####"   

    sudo apt-get install software-properties-common apt-transport-https wget

    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

    sudo apt-get install code
}

# Node 14.x

function nodeInstall() {

    echo "######Installing Node#####"   

    curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs

}

#Postgresql

function postgresql() {
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


#SQLite3
function sqlite() {

    sudo apt install sqlite3

}

function dataBase() {

    postgresql
    sqlite

}

# This is to install the JRE
# The JDK needs to be downloaded seperately
# https://www.openlogic.com/openjdk-downloads

#Java Runtime Environment

# function jdk_install(){
#     clear

#     cd ~/Downloads
#     wget https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz

#     tar -xvf openjdk-11+28_linux-x64_bin.tar.gz’

#     cd openjdk-11+28_linux-x64_bin



# }

function jre() {

    echo "Installing JRE Headless"

    sudo apt install default-jre
    sudo apt install openjdk-11-jre-headless

}

# Zsh terminal

function zsh() {
    clear

    echo "Installing ZSH & TMUX"
    sudo apt update
    sudo apt install zsh
    #sudo chsh -s $(which zsh)
    sudo apt-get install tmux
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" 
    #sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    #sudo chsh -s $(which zsh)
}

#Profiles setup

function profileSchema(){

    echo "Copying fonts to Desktop"
    cp -r scripts/extra/fonts -t ~/Desktop 
    echo "Fonts have been copied"
    echo $nextLine
    echo "Copying profiles to home directory"
    cp scripts/extra/profiles/.bashrc -t ~/
    cp scripts/extra/profiles/.tmux.conf -t ~/
    cp scripts/extra/profiles/.vimrc -t ~/
    cp scripts/extra/profiles/.zshrc -t ~/
    echo $nextLine
    echo "#####Profiles copied now sourcing#####" 
    source ~/.bashrc ~/.vimrc ~/.zshrc ~/.tmux.conf ~/.profile
    echo $nextLine
    echo "Profiles all copied and setup"

}

#Copy Preset Profiles and setup environment

function CopyProfile(){
    clear

    echo "Do you want to copy preset profiles?"

    read -r -p "Y/N: " option

    case $option in 
	[Yy]* )
            profileSchema
             ;;
	 [Nn]* )
            echo "Skipping profiles and installing KVM"
            kvmSetup 
         ;;
	 *)
	     echo "Command not recognized"
         exit 1
         ;;
   esac

}

#Install git, wget, curl for easy setup

function uploadTools() {
    sudo apt-get install git wget curl
}

#Virtual Machine
function kvmLib() {
    sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager
}

function kvmConfig() {
    echo "Add KVM to users"

    sudo adduser $USER libvirt
    sudo adduser $USER kvm
}

function kvmSetup() {
    clear

    echo "Install virtual machine libraries"
    kvmLib
    kvmConfig
}
