# Install necessary configs for awesome desktop

# Picom is to reduce screen tearing

function awesomeWM(){
    sudo pacman -S awesome picom
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


