#!/bin/bash   
head -n 15 install.sh | tail 14
 #8'         8888
#d8.-=. ,==-.:888b 
#>8 `~` :`~' d8888                 
#88         ,88888                 
#88b. `-~  ':88888                 
#888b ~==~ .:88888               
#88888o--:':::8888                 
#`88888| :::' 8888b             
#8888^^'       8888b               
#d888           ,%888b.           
#d88%            %%%8--'-.        
#/88:.__ ,       _%-' ---  -       
 #  '''::===..-'   =  --.  `                 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A="printf '\e[1;31m'" ; B='\e[0m' ; D='en_US.UTF-8' ; E='GRUB_GFXMODE=' ; F='/etc/pacman.conf' 
G='TotalDownload' ; H='/etc/locale.' ; I='/etc/host' ; J='do echo "Try again"' ; W='%wheel ALL=(ALL) ALL' ; P='passwd' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#           
sed -i 's/#Color/Color/' ${F} ; sed -i "s/#${G}/${G}/" ${F} ; pacman -S --needed git cmake freetype2 fontconfig pkg-config  
"${A}Enter Root Password: ${B}\n" ; ${P} ; until ${P}  ; ${J} ; done ; "${A}Enter User Name: ${B}" ;  read -r U 
useradd -m -G wheel ${U} ; ${P}  "${U}" ; until ${P} "${U}" ; ${J} ; done
sed -i "s/# ${W}/ ${W}/" /etc/sudoers ; curl -sL https://git.io/Jspfl > /home/${U}/installMO.sh 
ln -sf "/share/zoneinfo/$(curl -s https://ipapi.co/timezone)" /etc/localtime ; hwclock --systohc
echo "LC_ALL=${D}" >> /etc/environment ; echo "${D} UTF-8" >> ${H}gen ; echo "LANG=${D}" >> ${H}conf ; locale-gen ${D} 
echo -e "127.0.0.1 localhost \n::1 localhost \n127.0.1.1 ${U}pc.localdomain ${U}pc \n" >> ${I}s ; echo "${U}pc" >> ${I}name
"${A}GRUB INSTALL ${B}\n" ; sed -i 's/'${E}'auto/'${E}'1920x1080,auto/' /etc/default/grub 
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB ; grub-mkconfig -o /boot/grub/grub.cfg 
cd / ; chown root:root /home ; chmod 755 /home ; runuser --login ${U} --session-command 'sh ~/installMO.sh' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
