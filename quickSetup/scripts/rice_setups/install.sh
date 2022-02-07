# Install necessary configs for awesome desktop

# Picom is to reduce screen tearing

function awesomeWM(){
    sudo pacman -S awesome picom --noconfirm
}

function notifications(){
    sudo pacman -S mpd polybar dunst --noconfirm
}

function launchers(){
    sudo pacman -S rofi --noconfirm
}

function startUp(){
    sudo pacman -S plymouth --noconfirm
}

function lightDM(){
  
    # lightdm-plymouth is meant to work with plymouth
    sudo pacman -S lightdm-plymouth lightdm-webkit2-greeter --noconfirm

    echo "[Seat:*] \n\ngreeter-session=lightdm-webkit2-greeter" >> /etc/lightdm/lightdm.conf

    systemctl enable lightdm-plymouth.service
}

function displayManagers(){
   lightDM 
}




