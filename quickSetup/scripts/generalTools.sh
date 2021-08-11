#!/bin/bash
nextLine=\

function generalToolsReadme() {
    clear
    
    echo "The following will be installed ⚙️ : "
    echo $nextLine
    echo "Google-Chrome - Web Browser," 
    echo "FDM - Download Manager alternative to IDM,"
    echo "VLC - Powerful Open Source Video Player"
    echo $nextLine
}

function cliToolsReadme(){
    clear
    echo "The following Command Line Tools will be installed:"
    echo $nextLine
    echo "CMUS - Command line music player with Vim like keybindings"
    echo "HTOP - Command line system monitor  or task manager"
    echo "NCDU - Command line disk usage tool"
}

function gamesReadme(){
    clear
    echo "The following gaming tools will be installed:"
    echo "Steam"
    echo "Lutris"
}

# Chrome
function chromeInstall() {
    clear

    echo "#####Downloading Chrome#####"
    cd ~/Downloads

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        
    echo "#####Installing Chrome#####"   
    sudo dpkg -i google-chrome-stable_current_amd64.deb

    rm -f google-chrome-stable_current_amd64.deb
}

#FDM
function fdmInstall() {
    clear

    echo "Installing pre-requisuites for fdm"
     sudo apt-get install ffmpeg

    echo "######Installing FDM#####"   

    cd ~/Downloads

    wget https://dn3.freedownloadmanager.org/6/latest/freedownloadmanager.deb


    sudo dpkg -i freedownloadmanager.deb

    rm -f freedownloadmanager.deb
}

function vlcInstall(){
    clear
    echo "Installing VLC"
    
    sudo apt-get install vlc
}

function wpsOffice(){
   clear
    echo "####Installing WPS Office####" 
    cd ~/Downloads
    wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10702/wps-office_11.1.0.10702.XA_amd64.deb

    sudo dpkg -i wps-office_11.1.0.10702.XA_amd64.deb

    rm -f wps-office_11.1.0.10702.XA_amd64.deb

}

function discord_Install(){
    clear
   
   echo "Install pre-requisuite libraries for discord"
   
    sudo apt-get install libatomic1 gconf-service-backend gconf-service gconf2-common libgconf-2-4 libc++abi1 libc++1 libdbusmenu-gtk4 libindicator7 libappindicator1


    echo "#####Installing Discord Messenger#####"

    cd ~/Downloads

    wget https://discord.com/api/download?platform=linux&format=deb

    mv "download\?platform=linux\&format=deb" ~/Downloads/discord.deb

    sudo dpkg -i discord.deb
}

function generalTools() {
    fdmInstall
    chromeInstall
    vlcInstall 
}

function cliTools(){
    sudo apt-get install ncdu htop cmus python python3 python-pip python3-venv python3-pip 
    pip3 install --user gnome-extensions-cli
}

function games(){
    sudo apt-get install steam lutris
}


