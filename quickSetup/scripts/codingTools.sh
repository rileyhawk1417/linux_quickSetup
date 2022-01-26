#!/bin/bash

source "scripts/misc.sh"

# Not all tools are prepared here 
# So some need to be installed individually

function codingToolsOption() {
    uploadTools
    vsCode
    nodeInstall
    dataBase
    sdkMan
    jdk
    zsh
    CopyProfile
    kvmSetup
}


function databaseOnlyReadme() {
    clear

    echo "
            Database Tools will only be installed ⚙️ : 
            $nextLine
            Postgresql
            Sqlite3
            $nextLine
            Install the tools?
            Y/N
            "
}

# VSCode

function vsCode() {
    echo "
            $pound $pound 
            $nextLine
            Installing and setting up Visual Studio Code
            $nextLine
            $pound $pound
             "
     
    sudo apt-get install software-properties-common apt-transport-https wget -y

    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

    sudo apt-get install code -y
}

# Node 14.x

function nodeInstall() {
 
    echo "
            $pound $pound 
            $nextLine
            Installing and setting up Postgresql
            $nextLine
            $pound $pound
             "

    curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs

}

#Postgresql

function postgresql() { 
    echo "
            $pound $pound 
            $nextLine
            Installing and setting up Postgresql
            $nextLine
            $pound $pound
             "

# Create the file repository configuration:
    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the postgresql repository signing key:
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

    sudo apt-get update
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
    sudo apt-get -y install postgresql
}


#SQLite3
function sqlite() {
    sudo apt-get install sqlite3 -y
}

function dataBase() {
    postgresql
    sqlite
}

function sdkMan(){
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
}

#  TODO: # Refactor and optimize code
# In order to get sub dir of current dir.
# Assign to variable then use that variable when copying 
#subDir="$(ls -d */)"
#

function jdk() {
    echo "
            $pound $pound 
            $nextLine
            Installing and setting up JDK
            $nextLine
            $pound $pound
             "

    sdk install java

    clear

    echo "For more instructions use sdk --help"

}

function code_Tools(){
    read -r -p option

    case $option in 
	[Yy]* )
            sdkMan
            jdk    
            echo "Installing the SDK's"
        else 
            Fail_Install
        fi
        ;;
	 [Nn]* )
            echo "Skipping SDK's"
            CopyProfile
         ;;
	 *)
	     echo "Command not recognized"
         exit 1
         ;;
   esac


}

function zsh() {
    clear
 
    echo "
            $pound $pound 
            $nextLine
            Installing and setting up ZSH & TMUX
            $nextLine
            $pound $pound
             "
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
    fc-cache 
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

#Copy Preset Profiles and shell environment

function CopyProfile(){
    clear

    echo "Do you want to copy preset profiles?"

    read -r -p "Y/N: " option

    case $option in 
	[Yy]* )
            profileSchema
            kvmSetup
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

    
    echo "
            $pound $pound 
            $nextLine
            Installing and setting up KVM
            $nextLine
            $pound $pound
             "
             
    kvmLib
    kvmConfig
}

function oracle_Box(){
    echo "
            $pound $pound 
            $nextLine
            Installing and setting up VirtualBox
            $nextLine
            $pound $pound
             "
    
    # Get keys and register them
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

    
    sudo apt-get update
    sudo apt-get install virtualbox-6.1
}

function bashTop(){
    echo "
            $pound $pound 
            $nextLine
            Installing and setting up BashTop
            $nextLine
            $pound $pound
             "
    sudo add-apt-repository ppa:bashtop-monitor/bashtop

    sudo apt update
    sudo apt install bashtop
}

function installGuake(){
    echo "
            $pound $pound 
            $nextLine
            Installing and setting up Guake
            $nextLine
            $pound $pound
             "
    sudo apt update
    sudo apt-get install guake
}

function installHomeBrew(){
    # Install dependancies
    sudo apt-get install build-essential procps curl file git

    # Get Homebrew and install 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Test to ensure HomeBrew is working
    brew install hello
}

function installNvim(){
    # Install latest version from brew and not apt

    brew install neovim
    # Install package manager

    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
     ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}


