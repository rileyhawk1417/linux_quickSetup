#!/bin/bash

source scripts/codingTools.sh
source scripts/graphicsSuite.sh
source scripts/multiInstaller.sh

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
        echo "Installation Cancelled ❌"
        ;;
    *) 
        echo "Undefined Command"
        ;;
esac
