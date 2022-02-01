#!/bin/bash

#Variables that can be reused.
p10k="/usr/share/fonts/TFF/powerlevel10k"
microsoft="/usr/share/fonts/TFF/microsoft"
nerdFonts="/usr/share/fonts/TFF/nerdFonts"

# Remember to source Misc scripts for cheats.

#Remember to fetch Git first


function menuDisplay(){
    echo "This script will help you install programs and libraries"
# TODO: Add multi selection option
}




function rice_scripts(){
   git clone -b rice_script --single-branch https://github.com/rileyhawk1417/linux_quickSetup.git
  
   cd linux_quickSetup
  
   /usr/bin/bash install.sh
}

function arch_scripts(){
   git clone -b arch_scripts --single-branch https://github.com/rileyhawk1417/linux_quickSetup.git
  
   cd linux_quickSetup
  
   /usr/bin/bash install.sh
}

function ubuntu_scripts(){
  git clone -b ubuntu_scripts --single-branch https://github.com/rileyhawk1417/linux_quickSetup.git

  #Cd into directory then run
  cd linux_quickSetup
  
  /usr/bin/bash install.sh
}

# Function to install fonts

function font_installer(){
  # Create directories
  sudo mkdir $p10k $microsoft $nerdFonts

  # Copy fonts to directories
  sudo cp extra/powerline_fonts/* $p10k
  
  #Refresh cache
  fc-cache

}
