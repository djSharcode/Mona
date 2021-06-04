#!/bin/bash
set -euo pipefail 
A='pikaur' ; B='\e[1;31m' ; C='\e[0m' ;  D='.config' ; E='openbox' ; F='reversesearchsorting =' ; G='noedit =' ; H='alacritty' ; I='.config/openbox/menu.xml' 
J='<item label="' ; K='"><action name="Execute"><command>' ; L='</command></action></item>' ; M='manager' ; N='GRUB_GFXMODE=' ; U=$(cat /etc/u.txt)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
sed -i "s/${F} no/${F} yes/" /home/${U}/${D}/${A}.conf ; sed -i "s/${G} no/${G} yes/" /home/${U}/${D}/${A}.conf 
cp /home/${U}/${H}/target/release/${H} /usr/local/bin ; cp /etc/xdg/${E}/environment /home/${U}/${D}/environment
cp /etc/xdg/${E}/menu.xml /home/${U}/${I}
sed -i '5,$d' /home/${U}/${D}/${E}/menu.xml ; echo -e '<menu id="root-menu" label="Openbox 3">' >> /home/${U}/${I}
echo -e "${J}File Manager${K}nemo${L}\n${J}Internet${K}firefox-developer-edition${L}\n${J}Terminal${K}${H}${L}" >> /home/${U}/${I}
echo -e "${J}Text Editor${K}geany${L}\n${J}Settings${K}xfce4-settings-${M}${L}\n${J}Calculator${K}galculator${L}" >> /home/${U}/${I}
echo -e "${J}Reboot${K}reboot${L}\n${J}Power Off${K}poweroff${L}\n</menu>\n</openbox_menu>\n" >> /home/${U}/${I} 
echo -e "xfce-mcs-${M} &\n\nxfce4-panel &\n" >> /home/${U}/${D}/${E}/autostart ; echo "exec ${E}-session" >> /home/${U}/.xinitrc 
printf "${B}DISPLAY MANAGER ENABLED${C}" ; systemctl enable sddm ; printf "${B}NETWORK ENABLED${C}\n" ; systemctl enable NetworkManager 
printf "${B}Done! (Type: Exit ; umount -a ; reboot)${C}\n" ; rm /etc/u.txt  
#exit ; umount -a # read -e -p "Reboot? [Y/n] " Y ; if [[ $Y == "y" || $Y == "Y" || $Y == "" ]] ; then reboot ; fi
# read -r -p "reboot? (y/n) " W ; if [ "$W" != "${W#[Yy]}" ] ; then exit && exit && exit && umount -a && reboot ; fi 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
