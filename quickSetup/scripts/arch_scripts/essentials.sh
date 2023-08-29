#!/usr/bin/env bash
# Install archivers
archivers() {
	sudo pacman -S p7zip p7zip-plugins unrar tar rsync --noconfirm
}

getBuildTools() {
	paru -S cmake ninja meson clang curl base-devel sqlite \
    openssl clang cmake ninja pkg-config gtk3 \
    unzip --noconfirm --nosudoloop
}

# Install media codecs
codecs() {
	sudo pacman -S a52dec faac faad2 flac jasper lame libdca \
    libdv libmad libmpeg2 libtheora libvorbis libxv wavpack \
    x264 xvidcore gstreamer0.10-plugins --noconfirm
}

# Install browser's and download manager
browser() {
	paru -S brave-bin opera firefox min freedownloadmanager --noconfirm
}

helper() {
	#TODO: Check if yay is installed then remove it(my preference really)
	# Download helper in download folder and delete after

	# Install paru helper
  # TODO: Fetch paru from AUR

  sudo pacman -S curl wget --noconfirm
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  sudo pacman -S rust
	sudo pacman -S --needed base-devel --noconfirm
	git clone https://aur.archlinux.org/paru.git
	cd paru || echo "No Directory found"
	makepkg -si

	cd ../
	rmdir helpers
}

stores() {
	enableAur

	# Install aur helpers both yay and paru
	helper
	# Install flatpak
	sudo paru install flatpak libpamac-flatpak-plugin --noconfirm

	# Test Installation

	flatpak --version
	paru --version

}

storeSetup() {
	sudo paru -S flatpak --noconfirm
}

# Disk Tools
driveTools() {
	sudo paru -S gnome-disk-utility gparted --noconfirm
}

# Write to .xinitrc
writeKeyring() {
	echo "
    source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh


    eval $(/usr/bin/gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK

    mkdir -p "$HOME"/.local/share/keyrings
" >>~/.xinitrc
}

# Install keyring helpers
keyRings() {
	sudo paru -S gnome-keyring libsecret libgnome-keyring
}

hotspotTools() {
	paru -S create_ap haveged
}

gamingTools(){
  paru -S wine lutris
}

# Have a  to pull everything together

essentials() {
	archivers
	codecs
	#TODO: helper
  storeSetup
  driveTools
  keyRings
	browser
	hotspotTools
  gamingTools
  driveTools
  getBuildTools
}
