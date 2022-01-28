# Install necessary configs for awesome desktop

function awesomeWM(){
    sudo pacman -S awesome
}

function notifications(){
    sudo pacman -S mpd polybar dunst
}

function launchers(){
    sudo pacman -S rofi
}

function startUp(){
    sudo pacman -S plymouth
}

function displayManagers(){
    sudo pacman -S lightdm-plymouth
}


