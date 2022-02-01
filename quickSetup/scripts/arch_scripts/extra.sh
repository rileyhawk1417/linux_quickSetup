function radeon_profile(){
  # Function to install radeon profile for amd cards
  sudo pamac install radeon-profile-daemon radeon-profile

  sudo systemctcl enable radeon-radeon-profile-daemon

  sudo systemctcl start radeon-radeon-profile-daemon

}

function editModprobe(){
  sudo touch /etc/modprobe.d/amdgpu.conf

  sudo touch /etc/modprobe.d/radeon.conf

  echo "options amdgpu si_support=1 \noptions amdgpu cik_support=1" >> /etc/modprobe.d/amdgpu.conf

  echo "options radeon si_support=1 \noptions radeon cik_support=1" >> /etc/modprobe.d/radeon.conf
  
  # Generate intrafms
  mkinitcpio -p linux510 # Linux510 is for the default kernel

}
