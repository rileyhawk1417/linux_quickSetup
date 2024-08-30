function videoEditors() {
    paru -S obs-studio shotcut kdenlive vlc --noconfirm
}

function photosEditors() {
    paru -S flameshot darktable gimp inkscape krita --noconfirm
}

function audioEditors() {
    paru -S ocenaudio ardour --noconfirm
}

installMediaSuite() {
    videoEditors
    photosEditors
}
