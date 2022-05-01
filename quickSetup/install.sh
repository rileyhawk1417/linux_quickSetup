#!/bin/bash

source "scripts/multiInstaller.sh";

# TODO: Rewrite script for arch distro and connect everything

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
        codingTools
        essentials
        exit
        ;;
      -g | --graphics )
        mediaUtils
        essentials
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
     echo "Call Main Function"; 
    fi

