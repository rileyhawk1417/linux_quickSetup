function terminals(){
    sudo pacman -S kitty guake
}

function VM_Utils(){
    # Install necessary libraries
    sudo pacman -S qemu libvirt iptables-nft dnsmasq virt-manager
    # Start the service
    sudo systemctl start libvirtd
    #Enable the service
    sudo systemctl enable libvirtd
    #Allow current user to use service
    sudo usermod -aG libvirt $USER
}


