#!/bin/bash
source "scripts/misc.sh"

# This script is for installing graphics programs in linux
# Such as video editors and photo manipulation tools



function gimpInstall() {
    echo "
            $pound $pound 
            $nextLine
            Installing Gimp
            $nextLine
            $pound $pound
             "

    sudo add-apt-repository ppa:otto-kesselgulasch/gimp

    sudo apt install gimp
}

function inkscapeInstall() {
    echo "
            $pound $pound 
            $nextLine
            Installing InkScape
            $nextLine
            $pound $pound
             "

    sudo add-apt-repository ppa:inskcape.dev/stable

    sudo apt-get install inkscape
}

function obsInstall() {
    echo "
            $pound $pound 
            $nextLine
            Installing OBS
            $nextLine
            $pound $pound
             "
             
    sudo add-apt-repository ppa:obsproject/obs-studio

    sudo apt-get install obs-studio
}

    function flameShot(){
    echo "
            $pound $pound 
            $nextLine
            Installing FlameShot
            $nextLine
            $pound $pound
             "

        sudo apt-get install flameshot -y
    }

function graphicsSuite() {
    clear
    
    obsInstall
    inkscapeInstall
    gimpInstall
    flameShot
    
    sudo apt-get update

    exit 1
}


