#!/usr/bin/env bash
# Mostly I dont use one terminal I just have a variety
terminals() {
	paru -S kitty alacritty miniterm --noconfirm
}

# Configure git profile
configGit() {
	git config --global user.email "rileyhawk249@gmail.com"
	git config --global user.name "Sean Riley Hawkins"
}

# Git CLI tools
githubCLI() {
	paru -S npm github-cli lazygit gitui --noconfirm
}

# Glow MarkDown Reader
# fd is a fuzzy file finder
# Glow is a markdown reader.
# tealdeer is for "Too Long Didnt Read"

cliDocs() {
	paru -S glow fd tealdeer moar --noconfirm
}

launchers() {
	paru -S rofi appimagelauncher --noconfirm
}

# Btop Sys Monitor
btopMonitor() {
	paru -S btop --noconfirm
}

# System Monitoring Center
#sysCenter() {
#	sudo pip install system-monitoring-center
#}

# youtube_dl fork namely YT-DLP
yt_DLP() {
	python3 -m pip install -U yt-dlp --noconfirm
}

# Install text editors
editors() {
	# Get Vim Plug
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	paru -S neovim vim visual-studio-code-bin vscodium-bin pulsar-bin --noconfirm
}

# Intellij family editors
intellij() {
	paru -S intellij-idea-community-edition android-studio --noconfirm
}

pnpmInstall() {
  #TODO: Replace this install with npm install
  curl -fsSL https://get.pnpm.io/install.sh | sh -
}


# Needed when installing Virtual Machines
VM_Utils() {
	# Install necessary libraries
	sudo pacman -S qemu libvirt iptables-nft dnsmasq virt-manager --noconfirm
	# Start the service
	sudo systemctl start libvirtd --noconfirm
	#Enable the service
	sudo systemctl enable libvirtd --noconfirm
	#Allow current user to use service
	sudo usermod -aG libvirt "$USER"
}

# Install sdkman
# TODO: Replace with asdf
sdkMan() {
	curl -s "https://get.sdkman.io" | bash
	source "$HOME/.sdkman/bin/sdkman-init.sh"
}

# Get kotlin, java & gradle sdk using sdkman
getSdks() {
	sdk install gradle 7.4.2
	sdk install kotlin 1.6.21
	sdk install java 18.0.1.fx-zulu
	paru -S python3 --noconfirm
}

getCli() {
	paru -S thefuck httpie cmus neofetch exa ncdu ripgrep ranger lf --noconfirm
}
# Meh might not install php
#getPHP() {
#	paru -S php php-pgsql php81-pdo --noconfirm
#}

getZSH() {
	# Get default zsh bin
	paru -S zsh --noconfirm

	# Get Oh-my-zsh using curl
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# Install powerlevel10k theme
	#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

	# Install auto-suggestions
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  
  # Install syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

# Setup docker and respective containers
setupDocker() {
	paru -S docker containerd docker-compose --noconfirm --nosudoloop

	# Start docker services.
	sudo systemctl start docker.service

	# Auto start docker services on boot
	#sudo systemctl enable docker.service

	# Add docker to root user
	sudo usermod -aG docker $USER
}

# Setup Oracle Virtual Box
setupVBox() {
	paru -S virtualbox linux515-virtualbox-host-modules --noconfirm
	sudo vboxreload
	sudo modprobe vboxdrv
}

# Setup rust toolchain
rustSetup() {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source $HOME/.cargo/env
	rustup toolchain install stable
	rustup default stable
}

# Install portainer
portainer() {
	docker volume create portainer_data
	docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
}

# Setup AppFlowy Dev
getDeps() {
	paru -S curl base-devel sqlite openssl clang cmake ninja pkg-config gtk3 unzip --noconfirm --nosudoloop
}

setupFlutter() {
	git clone https://github.com/flutter/flutter.git
	cd flutter || echo "No such directory"
	echo "export PATH=\$PATH:$(pwd)/bin" >>~/.profile
	export PATH="$PATH:$(pwd)/bin"

	flutter channel stable
	flutter config --enable-linux-desktop
	flutter doctor

}

setupValgrind() {
	sudo pacman -Syu #<---Important or you will build a glibc different from what is on your system.
	#Added export DEBUGINFOD_URLS="https://debuginfod.archlinux.org" to my .bash_profile
	echo 'export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"' >>.bash_profile
	git clone https://github.com/archlinux/svntogit-packages.git
	cd svntogit-packages/glibc/trunk
	#Modified line in the file PKGBUILD
	grep -v "#" /etc/locale.gen >>locale.gen.txt
	makepkg --skipchecksums
	sudo pacman -U glibc #<should be the same as whats on your system>
}
# A helper to pull everything

codingUtils() {
	terminals
	configGit
	githubCLI
	btopMonitor
	yt_DLP
	editors
	#VM_Utils
	#TODO: sdkMan
	getSdks
	getCli
	getZSH
	setupDocker
	setupVBox
	rustSetup
  cliDocs
}

