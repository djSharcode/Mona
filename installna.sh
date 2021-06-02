#!/usr/bin/bash
set -euo pipefail 
A='pikaur' = B='\e[1;31m' ; C='\e[0m' ;  D='.config' ; E='openbox' ; F='reversesearchsorting =' ; G='noedit =' ; H='alacritty' ; I='menu.xml' 
J='<item label="' ; K='"><action name="Execute"><command>' L='</command></action></item>' ; M='manager'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
sed -i "s/${F} no/${F} yes/" ~/${E}/${A}.conf ; sed -i "s/${G} no/${G} yes/" ~/${E}/${A}.conf
cp ~/${H}/target/release/${H} /usr/local/bin ; mkdir -p ~/${D}/${E} ; cp -a /etc/xdg/${E}/ ~/${D}/
sed -i '5,$d' ~/${D}/${E}/menu.xml ; echo -e '<menu id="root-menu" label="Openbox 3">' >> ~/${D}/${E}/${I}
echo -e "${J}Internet${K}firefox-developer-edition${L}\n${J}File Manager${K}nemo${L}\n${J}Terminal${K}${A}${L}\n" >> ~/${D}/${E}/${I}
echo -e "${J}Text Editor${K}geany${L}\n${J}Settings${K}xfce4-settings-${M}${L}\n${J}Turn Off${K}sudo shutdown now${L}\n" >> ~/${D}/${E}/${I}
echo -e "${J}Calculator${K}galculator${L}\n</menu>\n</openbox_menu>\n" >>~/${D}/${E}/${I}
echo -e "xfce-mcs-${M} &\n\nxfce4-panel &\n" >> ~/${D}/${E}/autostart ; echo "exec ${E}-session" >> ~/.xinitrc 
printf "${B}DISPLAY MANAGER ENABLED${C}" ; systemctl enable sddm
printf "${B}NETWORK ENABLED${C}\n" ; systemctl enable NetworkManager ; printf "${B}SYSTEM CLEANUP${C}\n" ; pacman -Sc
printf "${B}Done!${C}\n" ; read -r "reboot? (y/n) "-p W ; if [ "$W" != "${W#[Yy]}" ] ; then exit ; umount -a ; reboot ; fi    
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#