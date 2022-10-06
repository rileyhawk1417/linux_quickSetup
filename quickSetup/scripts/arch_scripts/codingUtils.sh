# Mostly I dont use one terminal I just have a variety
function terminals(){
    sudo pacman -S kitty alacritty --noconfirm
}

# Configure git profile
function configGit(){
    git config --global user.email "rileyhawk249@gmail.com"
    git config --global user.name "Sean Riley Hawkins"
}


# Git CLI tools
function githubCLI(){
    configGit
    paru -S github-cli heroku-cli --noconfirm
}

# Glow MarkDown Reader
# fd is a fuzzy file finder
# bat is similar to less but with syntax highlighting.
# Glow is a markdown reader.
# tealdeer is for "Too Long Didnt Read"

function cliDocs(){
    paru -S glow bat fd tealdeer --noconfirm
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
    python3 -m pip install -U yt-dlp --noconfirm
}

# Install text editors
function editors(){
    paru -S neovim nvim-packer vim visual-studio-code-bin --noconfirm
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

function getHerokuCli(){
    paru -S npm heroku-cli --noconfirm
}

function getCli(){
    paru -S thefuck httpie cmus neofetch exa ncdu ripgrep ranger --noconfirm
}

function getPHP(){
    paru -S php php-pgsql php81-pdo --noconfirm
}

function getZSH(){
    # Get default zsh bin
    paru -S zsh --noconfirm

    # Get Oh-my-zsh using curl
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Install powerlevel10k theme
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # Install auto-suggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}


# Setup docker and respective containers
function setupDocker(){
    paru -S docker containerd docker-compose --noconfirm --nosudoloop

    # Start docker services.
    sudo systemctl start docker.service

    # Auto start docker services on boot
    #sudo systemctl enable docker.service

    # Add docker to root user
    sudo usermod -aG docker $USER

}

# Setup Oracle Virtual Box
function setupVBox(){
    mhwd-kernel -li | grep  "(linux"
    # Somehow its supposed to get the kernel version from the text o_o
    paru -S virtualbox linux515-virtualbox-host-modules --noconfirm
    sudo vboxreload
    sudo modprobe vboxdrv
}

# Setup rust toolchain
function rustSetup(){
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env
    rustup toolchain install stable
    rustup default stable
}

# Setup AppFlowy Dev
function getDeps(){
    paru -S curl base-devel sqlite openssl clang cmake ninja pkg-config gtk3 unzip --noconfirm --nosudoloop
}

function setupFlutter(){
    git clone https://github.com/flutter/flutter.git
    cd flutter
    echo "export PATH=\$PATH:"`pwd`"/bin" >> ~/.profile
    export PATH="$PATH:`pwd`/bin"

    flutter channel stable
    flutter config --enable-linux-desktop
    flutter doctor

}
