#!/bin/bash

source "scripts/misc.sh"


# Not all tools are prepared here 
# So some need to be installed individually


function codingToolsOption() {
    uploadTools
    vsCode
    nodeInstall
    dataBase
    jdk
    zsh
    CopyProfile
    kvmSetup
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

    sudo apt-get install software-properties-common apt-transport-https wget -y

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

#JDK which includes JRE

# TODO: # Add user option if they want JDK 11 or 16
#  TODO: # Refactor and optimize code
# In order to get sub dir of current dir.
# Assign to variable then use that variable when copying 
#subDir="$(ls -d */)"
#

function jdk() {
# TODO: Configure a way to get the latest version instead of one version
# TODO: Get dir name from downloads after extracting
    echo "Installing OpenJDK"

    cd ~/Downloads

    wget https://github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.12%2B7/OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz

    tar -xvf OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
    

    mv -r /usr/local/share

    echo export PATH=$PATH:/usr/local/share/jdk-11.0.12+7/bin
    echo export JAVA_HOME=$JAVA_HOME:/usr/local/share/jdk-11.0.12+7/bin

    rm -f OpenJDK11U-jdk_x64_linux_hotspot_11.0.12_7.tar.gz
}

# Zsh terminal

function zsh() {
    clear

    echo "Installing ZSH & TMUX"
    sudo apt update
    sudo apt-get install zsh tmux -y
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" 
    git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    #This is to avoid the installation being stuck on ZSH after changing default shell
    exit 1   
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
    sudo apt-get install git wget curl -y
}

#Virtual Machine
function kvmLib() {
    sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virt-manager -y
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

function oracle_Box(){
    sudo apt-get install virtualbox -y;
}