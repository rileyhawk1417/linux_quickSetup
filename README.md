****

# Description 📝

This repo is for easy installation of linux tools.
Most of them are just my personal tools and apps but the scripts can be edited to suit personal needs.

I prefer using package manager when possible because at times the current version isn't always available for the distro you are trying to install on

## For example 

ZorinOS 15.3 Ubuntu based on 18.04LTS Bionic Beaver

``` bash
❯ apt search guake
Sorting... Done
Full Text Search... Done
guake/bionic, bionic 3.0.5-1 all 
  Drop-down terminal for GNOME Desktop Environment

guake-indicator/bionic, 1.1-2build1 amd64
  Guake terminal app indicator
```
Pop_OS! 20.04LTS based on Ubuntu 20.04LTS

``` bash
pop-os@pop-os:~$ apt search guake
Sorting... Done
Full Text Search... Done
guake/focal, focal 3.6.3-2 all
  Drop-down terminal for GNOME Desktop Environment

guake-indicator/focal, 1.4-build1 amd64
  Guake terminal app indicator
```
## 25/05/21

Added a function where it will copy my existing profiles, that are in the folders to the new setup. Also edited the README file.

---

## 11/08/21

Refactored some code and added some more new functions, calling too many functions in one command didnt work.
So some of the functions were split into new files instead and then imported.

---
## Warning ⚠️
The scripts can run on ubuntu based systems or systems that use apt
Am not an expert am also learning, feel free to give some pointers
``` bash
 apt-get
```
## ToDo List
- [ ] Plans to support other systems like Arch 
- [ ] Optimize script and remove bugs 
- [x] Allow power users to use cli without using interactive shell?
- [x] Add peazip file compressor to general tools, or alternatives like unrar.
- [ ] Refactor to make it robust or efficient.
## Link 🌍
When learning bash or shellscript, I recommend the following links. They are not fuly detailed but at least cheatsheets can give a rough idea of what to do

* [Linuxize](https://linuxize.com/tags/terminal/#)
* [Flavio](https://flaviocopes.com/bash-scripting/)
* [devhints.io](https://devhints.io/bash)
