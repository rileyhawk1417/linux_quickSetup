
# Install archovers
function archivers(){
    sudo pacman -S p7zip p7zip-plugins unrar tar rsync --noconfirm
}

# Install media codecs
function codecs(){
    sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins --noconfirm
}

# Install browser and download manager
function browser(){
    paru -S vivaldi freedownloadmanager --noconfirm
}



function helper(){
    # Download helper in download folder and delete after

    # Install paru helper

    sudo pacman -S --needed base-devel --noconfirm
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si

    cd ../
    rmdir helpers
}

function enableAur(){
    # Enable aur
    sudo sed --in-place "s/#EnableAUR/EnableAUR/" "/etc/pamac.conf"
    #Check AUR updates
    sudo sed --in-place "s/#CheckAURUpdates/CheckAURUpdates/" "/etc/pamac.conf"
}

function enableSnap(){
    # Install snap
    paru install snapd libpamac-snap-plugin --noconfirm

    # Start snap services
    sudo systemctl enable --now snapd.socket

    # Enable support for classic snaps
    ln -s /var/lib/snapd/snap /snap

}

function stores(){
    enableAur

    # Install aur helpers both yay and paru
    helper
    # Install flatpak
    sudo pamac install flatpak libpamac-flatpak-plugin --noconfirm

    # Install Snap
    enableSnap

    # Test Installation

    snap --version
    flatpak --version
    yay --version
    paru --version

  }

# Add function to decide productivity

function noteChoice(){
  while [[ "$1" =~ ^-&& ! "$" == "--" ]]; do case $1 in
    -p | --planner )
        flatpak install flathub.com.alainm23.planner
        flatpak run com.github.alainm23.planner
        ;;
    -j | --joplin )
        paru -S install joplin-desktop-bin --noconfirm
        ;;
    * )
        echo "Undefined"
        ;;
      esac; shift; done
      if [[ "$1" == '--' ]]; then shift;
      else
        echo "Script Broken"
      fi

}

function productivity(){
  # Install Planner
  flatpak install flathub com.github.alainm23.planner

  # Run planner to test install
  flatpak run com.github.alainm23.planner

  # Install joplin
  paru -S joplin-desktop-bin --noconfirm
}

function onlineStorage(){
    paru -S internxt-drive-bin megasync google-drive-desktop --noconfirm
}
