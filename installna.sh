#!/bin/bash
set -euo pipefail ; U=$(cat /etc/u.txt)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
A="/home/${U}/.config/pikaur.conf" ; B='\e[1;31m' ; C='\e[0m' ; D='reversesearchsorting = '; E='Adwaita/Oranchelo-Beka'
F='Adwaita/Oranchelo' ; G='/usr/share/gtk-2.0/gtkrc' ; H='/usr/share/gtk-3.0/settings.ini' ; I='Cantarell 11/Fira Sans Condensed Book'
J='gtk-cursor-theme-name=' ; K='capitaine-cursors-light' ; X='/usr/share/sddm/scripts/Xsetup' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
#if [[ "$( pacman -Qd | grep -Ec tpl )" == [1-9] ]] ; then printf "${B}NETWORK ENABLED${C}\n" && systemctl enable tlp && systemctl enable acpid ; fi
printf "${B}DISPLAY MANAGER ENABLED${C}\n" ; systemctl enable sddm 
printf "${B}NETWORK ENABLED${C}\n" ; systemctl enable NetworkManager
{ echo 'M="$( xrandr | grep -Ec '"'HDMI-1|HDMI1|eDP1|eDP-1|VGA1|VGA-1|DVI1|DVI-1'"' )"'
 echo 'M1="$( xrandr | grep -Eo '"'HDMI-1|HDMI1|DVI-1|DVI1|VGA1|VGA-1'"' )"'
 echo 'M2="$( xrandr | grep -Eo '"'eDP1|eDP-1'"' )"' ; echo 'if [[ "${M}" -ge "2" ]]' 
 echo 'then xrandr --output "${M2}" --mode 1920x1080 --output "${M1}" --primary --auto'; echo 'fi' ; } >> ${X} 
sed -i -e "1 s/${E}/" -e "2 s/${F}/" ${G} ; sed -i -e "2 s/${E}/" -e "3 s/${F}/" ${H} ; sed -i "s/${D}no/${D}yes/" ${A}
echo ''"${J}"' "'"${K}"'"' >> ${G} ; echo "${J} ${K}" >> ${H} ; sed -i "s/${I}/" ${H} ; sed -i "s/${I}/" ${G}
update-desktop-database ; printf "${B}Done! ( Type: 'exit' and then 'reboot' )${C}\n" ; rm /etc/u.txt ; rm /home/${U}/installMO.sh 
rm -- "$0"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
