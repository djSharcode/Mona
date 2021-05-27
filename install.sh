#!/bin/bash  
set -euo pipefail 
# 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Color Templates || #6F674B #837B5E #998F71 #A89E81 #B5AB8A #C8BE9A #e7e3d5 #9a978a #6F674B #837B5E #998F71 #A89E81 #B5AB8A #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
LBL='\033[1;31m' ; NC='\033[0m' ; printf "${LBL}Enter Root Password: ${NC}\n" ; passwd ; printf "${LBL}Enter User Name: ${NC}" 
read -r USN ; useradd -m -G wheel ${USN} ; passwd ${USN} ; sed -i 's/# %wheel ALL=(ALL) ALL/ %wheel ALL=(ALL) ALL/' /etc/sudoers 
ln -sf /share/zoneinfo/$(curl -s https://ipapi.co/timezone) /etc/localtime ; hwclock --systohc ; locale-gen --purge en_US.UTF-8 
echo -e LANG="en_US.UTF-8" >> /etc/locale.conf ; echo "KEYMAP=us" >> /etc/vconsole.conf ; echo "${USN}pc" >> /etc/hostname  
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${USN}pc.localdomain ${USN}pc \n" >> /etc/hosts 
printf "${LBL}NETWORK ENABLED${NC}\n" ; systemctl enable NetworkManager ; printf "${LBL}GRUB INSTALL ${NC}\n" 
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; grub-mkconfig > /boot/grub/grub.cfg
#SU="sudo -u ${USN}"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
