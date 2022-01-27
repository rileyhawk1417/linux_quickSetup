#!/bin/bash

source "scripts/graphicsUtils.sh"
source "scripts/codingUtils.sh"
source "scripts/essentialUtils.sh"
source "scripts/misc.sh"

function menuDisplay() {
    clear
    #echo $pound$pound$pound$pound$pound$pound$pound$pound$pound$pound$pound
    poundPrint
    echo $nextLine
    echo "$pound Welcome to quickstart Script installer 😉   $pound" 
    echo "$pound Do you wish to continue yes ✅ or no ❌     $pound"
    poundPrint
 

    echo "Choose any one of the options below: "

}

function dispOptions(){
echo "
    1) installGraphics  
    2) codingToolsOnly 
    3) graphics_coding_tools 
    4) generalToolsOnly 
    5) databasesOnly 
    6) gameOnly 
    7) cliOnly 
    8) wpsOffice
    9) everything
    0) cancelInstall
"
}


function cancelInstall() {
    echo "Installation cancelled ❌ "
    exit 1
}

function graphics_coding_tools() {
    clear
    
    echo "Coding Tools will be installed with Graphics Tools ⚙️ : "
    echo $nextLine
    echo "Y/N"
    
    read -r -p option

    case $option in 
	[Yy]* )
        if graphicsSuite && codingToolsOnly; then
            echo "Tools have been installed thanks"
        else 
            Fail_Install
        fi
        ;;
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Command not recognized"
         exit 1
         ;;
   esac


}


function everythingReadme() {
    clear 

    echo $nextLine
    echo "This will install Graphics Software, Coding Software and General Tools ⚙️ : "
    echo $nextLine
    echo "Install everything?"
    echo "Y/N"
}

deny='n'
confirm='y'

function installGraphics() {
    graphicsReadme
    echo $nextLine
    
    read  option

    case $option in 
	[Yy]* )
             if graphicsSuite; then
                ThanksMessage
            else
                Fail_Install
            fi
             ;;
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Command not recognized"
         exit 1
         ;;
   esac

}

function codingToolsOnly() {
   CodeReadME
   
    read  option

    case $option in 
	[Yy]* )
             if codingToolsOption; then
                ThanksMessage
            else
                Fail_Install
            fi
             ;;           
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Command not recognized"
         exit 1
         ;;
   esac

}

function generalToolsOnly() {
    generalToolsReadme

    read -r -p option

    case $option in 
	[Yy]* )
             if generalTools; then
                ThanksMessage
            else
                Fail_Install
            fi
             ;;
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Command not recognized"
         exit 1
         ;;
   esac

}

function databasesOnly() {
    databaseOnlyReadme

    read -r -p  option

    case $option in 
	[Yy]* )
             if dataBase; then
                ThanksMessage
            else
                Fail_Install
            fi
             ;; 
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Command not recognized"
         exit 1
         ;;
   esac

}

function gameOnly(){
    gamesReadme

    read -r -p  option

    case $option in 
	[Yy]* )
             if games; then
                ThanksMessage
            else
                Fail_Install
            fi
             ;; 
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Command not recognized"
         exit 1
         ;;
   esac

}

function cliOnly(){
    cliToolsReadme

    read -r -p  option

    case $option in 
	[Yy]* )
             if cliTools; then
                ThanksMessage
            else
                Fail_Install
            fi
             ;;
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Command not recognized"
	     
         exit 1
         ;;
   esac

}



function everything() {
    everythingReadme

    read -r -p  option

    case $option in 
	[Yy]* )
             if graphicsSuite && codingToolsOption && generalTools && cliTools && games; then
                ThanksMessage
            else
                Fail_Install
            fi
             ;;
	 [Nn]* )
        cancelInstall
         ;;
	 *)
	     echo "Command not recognized"
         exit 1
         ;;
   esac

}

function Fail_Install(){

    if ping -c 1 google.com; then
        echo $ok_internet
    else 
        echo $no_internet
    fi
    echo "Go back to main menu and retry?"
    read -r -p "Y/N: " answer
    case $answer in 
        [Yy]* )
            echo "Heading to main menu"
            menuDisplay
            ;;
        [Nn]* )
            echo "Quitting Installer...."
            exit 1
            ;;
        *)
            echo "No command"
            menuDisplay
            ;;
    esac
}


# TODO: # Always refactor when possible
# TODO: # Research on how to neatly present your options on command line
# TODO: # Look into fixing line 295: column 5 something about the array?
# TODO: # Make sure to add fail safes in the event of user error


function optionsList() {
    clear
    menuDisplay
    dispOptions

    read answer
       case $answer in
	   1) installGraphics ; optionsList ;; 
	   2) codingToolsOnly ; optionsList ;;
       3)graphics_coding_tools ; optionsList ;;
	   4)generalToolsOnly ; optionsList ;;
       5)databasesOnly ; optionsList ;;
       6)gameOnly ; optionsList ;;
       7)cliOnly ; optionsList ;;
       8)wpsOffice ; optionsList ;;
	   9)everything ; optionsList ;;
       0)cancelInstall ; optionsList ;;
	   *) echo "Oops the option isnt listed";;
       esac
}

function ThanksMessage(){
    clear
    echo $install_complete
    echo "Thanks for installing"
    echo "Will exit now"
    exit 1
}
