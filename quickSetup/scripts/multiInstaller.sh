#!/bin/bash

source graphicsSuite.sh
source codingTools.sh

function cancelInstall {
    echo "Installation cancelled ❌ "
    exit 1
}

function combinedInstall {
    clear
    
    echo "Coding Tools will be installed with Graphics Tools ⚙️ : "

    graphicsSuite
    codingSuite

    exit 1
}

function everythingReadme {
    clear 

    echo "This will install Graphics Software,Coding Software and General Tools ⚙️ : "
    echo ""
}

function installGraphics {
    graphicsReadme

    read -r -p "Y/N: " option

    case $option in 
	[Yy]* )
             graphicsSuite
             ;;
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Unknown command"
         exit 1
         ;;
   esac

}

function codingToolsOnly {
    codingToolsReadme
    

    read -r -p "Y/N: " option

    case $option in 
	[Yy]* )
             codingToolsOption
             ;;
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Unknown command"
         exit 1
         ;;
   esac

}

function generalToolsOnly {
    generalToolsReadme

    read -r -p "Y/N: " option

    case $option in 
	[Yy]* )
             generalTools
             ;;
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Unknown command"
         exit 1
         ;;
   esac

}

function databasesOnly {
    databaseOnlyReadme

    read -r -p "Y/N: " option

    case $option in 
	[Yy]* )
             dataBase
             ;;
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Unknown command"
         exit 1
         ;;
   esac

}

function everything {
    everythingReadme

    read -r -p "Y/N: " option

    case $option in 
	[Yy]* )
             combinedInstall
             ;;
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Unknown command"
         exit 1
         ;;
   esac

}

function menuDisplay {
    clear
    echo "Choose any one of the options below: "
    optionsList
}

function optionsList {
    clear
    select Choice in Graphics_Tools Coding_Tools General_Tools Databases Everything Exit
    do 
       case $Choice in
	   Graphics_Tools) installGraphics;;
	   Coding_Tools) codingToolsOnly;;
	   General_Tools) generalToolsOnly;;
       Databases) databasesOnly;;
	   Everything) everything;;
       Exit) cancelInstall;;
	    *)exit 1;;
       esac
    done
}
