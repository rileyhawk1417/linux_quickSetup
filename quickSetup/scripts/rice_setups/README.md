## Description

- This branch is mainly for customization.
- Most of the configurations will be Arch Based, maybe Ubuntu configs will be done on another branch.
- The configurations are mostly for Awesome Window Manager.

### Documentation subject to change

## Warnings

### Arch Based Problem

- When it comes to plymouth themes, theres a trick to it.
- If theres a chance plymouth is displaying boxes on boot, even with default themes. Then your /etc/mkinitcpio.conf needs to be edited.
- Theres the VGA driver that needs to be added in the column of
```bash
MODULES=""
```
- In order to get the graphics driver use this command.
```bash
lspci -v | grep -A10 VGA | grep driver
```

- Enter the words that pop up then run ```bash mkinitcpio -p linux ```.

