#!/bin/bash

source "scripts/misc.sh"


# TODO: # Try getting peazip from source or just get unrar and rar from apt
# TODO: # wget https://sourceforge.net/projects/peazip/files/8.1.0/peazip_8.1.0.LINUX.x86_64.Qt5.deb

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

function mediaPlayers() {
    clear
    echo"Install both Sayonara and VLC"

    sudo apt-add-repository ppa:lucioc/sayonara
    sudo apt-get update  
    sudo apt-get install sayonara vlc -y
}

function wpsOffice() {
    clear
    echo "####Installing WPS Office####"
    cd ~/Downloads
    wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/10702/wps-office_11.1.0.10702.XA_amd64.deb

    sudo dpkg -i wps-office_11.1.0.10702.XA_amd64.deb

    rm -f wps-office_11.1.0.10702.XA_amd64.deb

}

function discord_Install() {
    clear

    echo "Install pre-requisuite libraries for discord"

    sudo apt-get install libatomic1 gconf-service-backend gconf-service gconf2-common libgconf-2-4 libc++abi1 libc++1 libdbusmenu-gtk4 libindicator7 libappindicator1

    echo "#####Installing Discord Messenger#####"

    cd ~/Downloads

    wget https://discord.com/api/download?platform=linux &format=deb

    mv "download\?platform=linux\&format=deb" ~/Downloads/discord.deb

    sudo dpkg -i discord.deb
}

function generalTools() {
    fdmInstall
    chromeInstall
    mediaPlayers
}

# TODO: # If you want build your own backup gnome extension tool


function cliTools() {
    sudo apt-get install ncdu htop cmus unrar rar python python3 python-pip python3-venv python3-pip -y
#    pip3 install --user gnome-extensions-cli

#    echo PATH=$PATH:${HOME}/.local/bin >>~/.profile
#   echo PATH=$PATH:${HOME}/.local/bin >>~/.zshrc

}

function games() {
    sudo apt-get install steam lutris -y
}
