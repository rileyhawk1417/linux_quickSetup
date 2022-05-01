# Mostly I dont use one terminal I just have a variety
function terminals(){
    sudo pacman -S kitty guake alacritty --noconfirm
}

function homeBrew(){
  #Grab brew first then install other components

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Github CLI tool
function githubCLI(){
  pacman -S github-cli
}

# Glow MarkDown Reader
function glowMD(){
 pacman -S glow 
}

# Btop Sys Monitor
function btopMonitor(){
 paru -S btop 
}

# youtube_dl fork namely YT-DLP
function yt_DLP(){
 python3 -m pip install -U yt-dlp 
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


