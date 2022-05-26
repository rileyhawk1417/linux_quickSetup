# Mostly I dont use one terminal I just have a variety
function terminals(){
    sudo pacman -S kitty --noconfirm
}

function homeBrew(){
  #Grab brew first then install other components

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Git CLI tools
function githubCLI(){
    paru -S github-cli heroku-cli --noconfirm
}

# Glow MarkDown Reader
# fd is a fuzzy file finder, bat is similar to less but with syntax highlighting.
# Glow is a markdown reader.
function cliDocs(){
    paru -S glow bat fd --noconfirm
}

function launchers(){
    paru -S rofi appimagelauncher --noconfirm
}

# Btop Sys Monitor
function btopMonitor(){
    paru -S btop --noconfirm
}

# youtube_dl fork namely YT-DLP
function yt_DLP(){
    python3 -m pip install -U yt-dlp
}

# Install text editors
function editors(){
    paru -S neovim vim visual-studio-code-bin --noconfirm
}

# Intellij family editors
function intellij(){
    # Download the archives first.
    # Decompress them and cd into the folder
    # Export or print the path to profile then restart session or computer
    echo "export PATH=\$PATH:"`pwd`"/bin" >> ~/.profile\
    export PATH="$PATH:`pwd`/bin"
}

# Install FTP Client
function ftpClient(){
    paru -S filezilla --noconfirm
}

# Needed when installing Virtual Machines
function VM_Utils(){
    # Install necessary libraries
    sudo pacman -S qemu libvirt iptables-nft dnsmasq virt-manager --noconfirm
    # Start the service
    sudo systemctl start libvirtd --noconfirm
    #Enable the service
    sudo systemctl enable libvirtd --noconfirm
    #Allow current user to use service
    sudo usermod -aG libvirt $USER
}


# Install sdkman
function sdkMan(){
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
}

# Get kotlin, java & gradle sdk using sdkman
function getSdks(){
    sdk install gradle 7.4.2
    sdk install kotlin 1.6.21
    sdk install java 18.0.1.fx-zulu
}

# Setup rust toolchain
function rustSetup(){
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env
    rustup toolchain install stable
    rustup default stable
}
