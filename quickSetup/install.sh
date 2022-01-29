#!/bin/bash
# This file pth is only for debugging in VSCode
# source "quickSetup/scripts/codingTools.sh" 
# source "quickSetup/scripts/graphicsSuite.sh" 
# source "quickSetup/scripts/multiInstaller.sh"
# source "quickSetup/scripts/generalTools.sh"
# source "quickSetup/scripts/colors.sh"


source "scripts/lazyScript.sh"
source "scripts/misc.sh"

function helpMsg() {
  echo "
  Shortcuts or flags to trigger bypassing wizard
  Or install a specific program
  Command                                       --Options/Long Notation 
  -c     | --coding                             --coding, flag installs coding tools.
  -gfx   | --graphics                           --graphics, flag installs graphics tools.
  -m     | --minimal                            --minimal, flag installs general tools.
  -db    | --databases                          --databases, flag installs database tools.
  -cli   | --terminal                           --terminal, flag installs cli tools.
  -g     | --game                               --game, flag installs game launchers.                                           
  -a     | --all                                --all, flag bypasses setup and installs everything.                                            
                                                --help:  prints help message and exits.
    "
  exit
}

    while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
      -c | --coding )
        codingToolsOnly 
        exit
        ;;
      -gfx | --graphics )
        graphicsSuite 
        exit
        ;;
      -m | --minimal )
        generalToolsOnly 
        exit
        ;;
      -db | --databases )
        databasesOnly 
        exit
        ;;
      -cli | --cli )
        cliOnly 
        exit
        ;;
      -g | --game )
        gameOnly 
        exit
        ;;
      -a | --all )
        everything 
        exit
        ;;
      -h | --help )
        helpMsg
        ;;
      * )
        helpMsg
        ;;
    esac; shift; done
    if [[ "$1" == '--' ]]; then shift; 
    else 
      menuDisplay
    fi

