#!/bin/bash

source "scripts/codingTools.sh" 
source "scripts/graphicsSuite.sh" 
source "scripts/multiInstaller.sh"
source "scripts/generalTools.sh"

echo "#############################################"
echo "# Welcome to quickstart Script installer 😉 #" 
echo "# Do you wish to continue yes ✅ or no ❌ ###"
echo "#############################################"


read -r -p "Y/N: " answer

case $answer in 
    [Yy]* )
        echo "Beginning Installation"
	    menuDisplay
        ;;
    [Nn]* )
        cancelInstall
        ;;
    *) 
        echo "Undefined Command"
        ;;
esac
