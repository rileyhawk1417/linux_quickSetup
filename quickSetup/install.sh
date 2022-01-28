#!/bin/bash
# This file path is only for debugging in VSCode
# source "quickSetup/scripts/codingTools.sh" 
# source "quickSetup/scripts/graphicsSuite.sh" 
# source "quickSetup/scripts/multiInstaller.sh"
# source "quickSetup/scripts/generalTools.sh"
# source "quickSetup/scripts/colors.sh"

# TODO: Fix installer to detect or help user choose type of distro and script
source "scripts/misc.sh"

function helpMsg() {
  echo "
  Shortcuts or flags to trigger bypassing wizard
  Or install a specific program
  Command/Flags
  -c | --rice                                           --coding, flag downloads rice/customization scripts.
  -g | --arch                                           --graphics, flag downloads arch scripts.
  -m | --ubuntu                                         --ubuntu, flag downloads ubuntu scripts.
                                                        --help:  prints help message and exits
    "
  exit
}

    while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
      -r | --rice )
        rice_setup 
        exit
        ;;
      -a | --arch )
        arch_setup 
        exit
        ;;
      -u | --ubuntu )
        ubuntu_scripts 
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

