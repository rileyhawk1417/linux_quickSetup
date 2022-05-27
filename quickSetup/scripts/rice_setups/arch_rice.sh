# Install necessary configs for awesome desktop

# Picom is to reduce screen tearing

function awesomeWM(){
    sudo pacman -S awesome picom --noconfirm
}


# Pre-requisites for awesomeWM
function fixes(){
    # touchpad fix using xorg needs restart
    echo "
    Section "InputClass"
        Identifier "touchpad"
        Driver "libinput"
        MatchIsTouchPad "On"
        Option "Tapping" "On"
        Option "TappingButtonMap" "lrm"
        Option "ClickMethod" "clickfinger"
        Option "TappingDrag" "true"
        Option "TappingDragLock" "true"
        Option "DisableWhileTyping" "true"
        Option "NaturalScrolling" "true"
        Option "HorizontalScrolling" "true"
    EndSection
    " >> /etc/X11/xorg.conf.d/70-touchpad-settings.conf

    # Install brightness, screamsink & picom compositor
    paru -S picom scream brightnessctl --noconfirm
}


function dracula(){
    paru -S lxappearance
    wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
}

function keyboardLayout(){
    paru -S xfce4-xkb-plugin
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




