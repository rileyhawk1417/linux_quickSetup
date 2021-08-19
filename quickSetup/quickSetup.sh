#!/bin/bash
# This file pth is only for debugging in VSCode
# source "quickSetup/scripts/codingTools.sh" 
# source "quickSetup/scripts/graphicsSuite.sh" 
# source "quickSetup/scripts/multiInstaller.sh"
# source "quickSetup/scripts/generalTools.sh"
# source "quickSetup/scripts/colors.sh"


source "scripts/codingTools.sh" 
source "scripts/graphicsSuite.sh" 
source "scripts/multiInstaller.sh"
source "scripts/generalTools.sh"
source "scripts/misc.sh"

function helpMsg() {
  echo "
  Shortcuts or flags to trigger bypassing wizard
  Or install a specific program
  Command                                   --Options/Long Notation 
  -c | --coding                             --coding, flag installs tools only in the coding section
  -g | --graphics                           --graphics, flag installs tools only in the graphics section
  -m | --minimal                            --minimal, flag installs tools only in the general section
                                            --help:  prints help message and exits
    "
  exit
}

    while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
      -c | --coding )
        codingToolsOnly 
        exit
        ;;
      -g | --graphics )
        graphicsSuite 
        exit
        ;;
      -m | --minimal )
        generalTools 
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
      optionsList
    fi

