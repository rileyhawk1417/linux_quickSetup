# This script is to automate install as much as possible
# TODO: Connect the other scripts

source "scripts/arch_scripts/codingUtils.sh"
source "scripts/arch_scripts/essentials.sh"
source "scripts/arch_scripts/mediaUtils.sh"

function codingTools(){
  #Collect functions from there.
  terminals
  # Test if sys is 64 bit before installing homeBrew
  githubCLI
  glowMD
  btopMonitor
  yt_DLP
  VM_Utils
}

function essentials(){
  #Collect functions from there.
  archivers
  codecs
  helpers
  enableAur
  enableSnap
  stores
  productivity
}

function mediaUtils(){  
  #Collect functions from there.
  videoEditors
  photoEditors
}

function mainMenu(){
  echo "
  Linux Setup:
  This setup is aimed at installing Arch components.
  You can choose from any options of below.
  1. Coding Tools (VS-Code, Terminals) 
  2. Media Tools (Media Codecs, Photo Editors, Video Editors)
  3. Productivity Tools (Planner, Joplin Note Taker)
  4. CLI-Tools (Btop, youtube_dl, homebrew, github-cli, glow)
  5. Package Managers (Snap, Paru, Yay, Flatpak)
  6. Archivers (p7zip, unrar, tar, rsync)
  7. Coding Suite (Coding Tools and CLI-Tools, Package Managers)
  8. Basics (Package Managers, Archivers, Media Tools, Productivity)
  9. Install All
  "
  read 

}
