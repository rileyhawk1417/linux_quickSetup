function archivers(){
    sudo pacman -S p7zip p7zip-plugins unrar tar rsync
}

function codecs(){
    sudo pacman -S a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer0.10-plugins
}

function helpers(){
    # Download helpers in download folder and delete after

    # Install yay aur helper
    sudo pacman -S --needed git base-devel
    cd ~/Downloads
    mkdir helpers
    cd helpers
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ../

    # Install paru helper
 
    sudo pacman -S --needed base-devel
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
    sudo pamac install snapd libpamac-snap-plugin

    # Start snap services
    sudo systemctl enable --now snapd.socket

    # Enable support for classic snaps
    ln -s /var/lib/snapd/snap /snap
  
}

function stores(){
    enableAur

    # Install aur helpers both yay and paru
    helpers
    # Install flatpak
    sudo pamac install flatpak libpamac-flatpak-plugin
    
    # Install Snap
    enableSnap

    # Test Installation

    snap version
    flatpak --version
    pamac --version
    yay --version
    paru --version

  }

# Add function to decide productivity

function productivity(){
  # Install Planner
  flatpak install flathub com.github.alainm23.planner

  # Run planner to test install
  flatpak run com.github.alainm23.planner

  # Install superproductivity
  sudo snap install superproductivity

  # Install notable
  sudo pamac install notable-bin

  # Install joplin
  sudo pamac instal joplin-desktop-bin
}
