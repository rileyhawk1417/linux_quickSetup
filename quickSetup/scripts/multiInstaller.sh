#!/bin/bash

source "scripts/graphicsSuite.sh"
source "scripts/codingTools.sh"
source "scripts/generalTools.sh"


nextLine=\

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
    
    read -r -p  option

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
    codingToolsReadme
   
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

declare -A errs
errs[no_internet]="No internet connection ❌"
errs[bug]="The script is broken somewhere :("

declare -A green
green[ok_internet]="Internet connection ok"
green[install_complete]="Installation Completed without errors"

function Fail_Install(){

    if ping -c 1 google.com; then
        echo ${green[ok_internet]}
    else 
        echo ${errs[no_internet]}
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


function menuDisplay() {
    clear
    echo "Choose any one of the options below: "
    optionsList
}


function optionsList() {
    clear
    select Choice in Graphics_Tools Coding_Tools Graphics_Coding_Tools General_Tools Databases GamingSetup CliTools Everything Exit
    do 
       case $Choice in
	   Graphics_Tools) installGraphics;; 
	   Coding_Tools) codingToolsOnly;;
       Graphics_Coding_Tools) graphics_coding_tools;;
	   General_Tools) generalToolsOnly;;
       Databases) databasesOnly;;
       GamingSetup) gameOnly;;
       CliTools) cliOnly;;
	   Everything) everything;;
       Exit) cancelInstall;;
	    *)exit 1;;
       esac
    done
}

function ThanksMessage(){
    clear
    green[install_complete]
    echo "Thanks for installing"
    echo "Will exit now"
    exit 1
}
