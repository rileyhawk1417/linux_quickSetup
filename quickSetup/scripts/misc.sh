#Colours
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

# Colour Changers
ColourGreen(){
    echo -ne $green$1$clear
}

ColourBlue(){
    echo -ne $blue$1$clear
}

ColourGreen(){
    echo -ne $green$1$clear
}

ColourGreen(){
    echo -ne $green$1$clear
}

# Cheats to avoid repetition

pound='#####'
nextLine=\


# Error and Complete Strings
no_internet="No internet connection ❌"
bug_error="The script is broken somewhere :("

ok_internet="Internet connection ok"
install_complete="Installation Completed without errors"



function poundPrint(){
        for ((y=1 ; y<=11 ; y++ )); do
        echo -ne $pound
        done
}

# ReadMe functions to clear other files.

function CodeReadME(){
    clear

    echo "
    The following will be installed ⚙️ : 
    $nextLine
    Visual Studio Code - Powerful text editor and IDE, 
    Node - Powerful library for JavaScript and other node related projects,
    Databases - These include Postgresql and Sqlite3
    ZSH - Powerful terminal emulator with alot of tricks
    Upload & Download Tools - These include git, wget, curl and other essentials
    KVM - This is a library for running virtual machines
    SDKMan - This tool installs SDK's with ease.
    Preset profiles that would make setting up the environment easier
    $nextLine
    Install the tools Y/N: 
    "
}

function codeTools(){
    clear

    echo "
            The following  will be installed :
            $nextLine
            KVM - This is a library for running virtual machines
            SDKMan - This tool installs SDK's with ease. 
            JDK - Java Development Kit
            Do you want to install ?
            $nextLine
            Y/N
            "
}

function generalToolsReadme() {
    clear

    echo "
            The following will be installed ⚙️ :
            $nextLine
            Google-Chrome - Web Browser,
            FDM - Download Manager alternative to IDM,
            VLC - Powerful Open Source Video Player
            Sayonara - Open Source Lightweight music player
            $nextLine
            Do you want to install ?
            $nextLine
            Y/N
            "
}

function cliToolsReadme() {
    clear
    
    echo "
            The following Command Line Tools will be installed :
            $nextLine
            CMUS - Command line music player with Vim like keybindings
            HTOP - Command line system monitor or task manager
            BASHTOP - Command line system monitor 
            NCDU - Command line disk usage tool
            Python-Tools - Installs python libraries along with python3 pip
            Upload & Download Tools - These include git, wget, curl and other essentials
            $nextLine
            Continue: Y/N
            "
}

function gamesReadme() {
    clear
    echo "
            The following gaming tools will be installed:
            Steam
            Lutris
            Do you want to install ?
            $nextLine
            Y/N
            "
}

function graphicsReadme() {
    clear
    
    echo "
            The following will be installed
            $nextLine
            GIMP - Image Manipulator, 
            Inkscape - Image Manipulator,
            OBS - Screencast and Video Editor
            FlameShot - Screenshot Tool
            $nextLine
            Do you want to install ?
            $nextLine
            Y/N
            "
}

function sdkReadMe(){
    clear

    echo "
            Do you want to install Software Development Kits
            The tools are needed when writing programs and code.
            $nextLine
            Do you want to install ?
            $nextLine
            Y/N
            "
}

