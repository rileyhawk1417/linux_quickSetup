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
: '
ColourGreen(){
    echo -ne $green$1$clear
}

ColourGreen(){
    echo -ne $green$1$clear
}
'
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
    JRE -  This is the Java Runtime Environment
    ZSH - Powerful terminal emulator with alot of tricks
    Upload & Download Tools - These include git, wget, curl and other essentials
    KVM - This is a library for building virtual machines
    Preset profiles that would make setting up the environment easier
    $nextLine
    Install the tools Y/N: 
    "
}

function generalToolsReadme() {
    clear

    echo "The following will be installed ⚙️ : "
    echo $nextLine
    echo "Google-Chrome - Web Browser,"
    echo "FDM - Download Manager alternative to IDM,"
    echo "VLC - Powerful Open Source Video Player"
    echo "Sayonara - Open Source Lightweight music player"
    echo $nextLine
}

function cliToolsReadme() {
    clear
    
    echo "The following Command Line Tools will be installed:"
    echo $nextLine
    echo "CMUS - Command line music player with Vim like keybindings"
    echo "HTOP - Command line system monitor  or task manager"
    echo "NCDU - Command line disk usage tool"
    echo "Python - Installs python libraries along with python3 pip"
}

function gamesReadme() {
    clear
    echo "The following gaming tools will be installed:"
    echo "Steam"
    echo "Lutris"
}

function graphicsReadme() {
    clear
    
    echo "The following will be installed"
    echo ""
    echo "GIMP - Image Manipulator," 
    echo "Inkscape - Image Manipulator,"
    echo "OBS - Screencast and Video Editor"
    echo $nextLine
    echo "Do you want to install ?"
    echo "Y/N"
}

