#!/bin/bash

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
