# This script is to automate install as much as possible
# TODO: Connect the other scripts

source "arch_scripts/codingUtils.sh"
source "arch_scripts/essentials.sh"
source "arch_scripts/mediaUtils.sh"

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
