#!/bin/bash

# This script is for installing graphics programs in linux
# Such as video editors and photo manipulation tools

# Installing GIMP

function gimpInstall() {

    sudo add-apt-repository ppa:otto-kesselgulasch/gimp

    sudo apt install gimp
}

function inkscapeInstall() {

    sudo add-apt-repository ppa:inskcape.dev/stable

    sudo apt-get install inkscape
}
# When downloading Natron go to the website and get the binaries
# sudo apt-get install libegl1-mesa
# Then cd into the directory and run install.sh

function obsInstall() {

    sudo add-apt-repository ppa:obsproject/obs-studio

    sudo apt-get install obs-studio
}

function graphicsSuite() {
    clear
    
    obsInstall
    inkscapeInstall
    gimpInstall

    sudo apt-get update

    exit 1
}

function graphicsReadme() {
    clear
    
    echo "The following will be installed"
    echo ""
    echo "GIMP - Image Manipulator," 
    echo "Inkscape - Image Manipulator,"
    echo "OBS - Screencast and Video Editor"
    echo $nextLine
    echo "Do you want to install ?"
    echo "Y/N"
}
