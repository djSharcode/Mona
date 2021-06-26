#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='.config/openbox' ; B='<item label="'
Z='.config/pikaur.conf' ; S='sleep 2 &&'
C='"><action name="Execute"><command>'
D='</command></action></item>' 
E='<separator></separator>' ; Q='docks.ini'
F='.config/plank/dock1/launchers'
G='net/launchpad/plank/docks'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
mkdir ~/.config 
cp -a etc/xdg/openbox/ ~/.config/
git clone \
https://aur.archlinux.org/pikaur.git
cd pikaur; makepkg -sri; pikaur -S \
picom-git oranchelo-icon-theme-git \
jbxkb ttf-ms-fonts timeshift; sed -\
i 's/g = no/g = yes/' ~/${Z}; sed -\
i 's/g = no/g = yes/' ~/${Z}; sed -\
i '5,$d' ~/${A}/menu.xml ; sed -i -\
e '5,120 s/8/12/' -e '131 s/4/2/' -\
e 's/sans/Fira Sans Condensed Book/' -\
e 's/W-e/0x85/' -e 's/A-space/0x85/' -\
e 's/Konqueror/m/' -e '5,99 s/9/13/' -\
e 's/Clearlooks/Bear2/' -e \
's/kfmclient openProfile filemanagement/rofi -show drun/' ~/${A}/rc.xml
echo -e "<menu id="'"root-menu"'" \
label="'"Openbox 3"'"> \n${B}Files\
${C}nemo${D}\n${B}Search${C}rofi -\
show drun ${D}\n${B}Web${C}firefox\
${D}\n${B}Terminal${C}alacritty${D}
${B}Text${C}geany${D}\n${B}Calcula\
tor${C}galculator${D}${E}\n${B}Ref\
resh${C}openbox --reconfigure ${D}\
${E}${B}Lock Screen${C}xlock -mode\
atlantis -echokeys -echokey '*' -i\
nfo +description "'"Password : "'"\
${D}\n${B}Reboot${C}reboot${D}${B}\
Power Off${C}poweroff${D}\n</menu>\
</openbox_menu>" >> ~/${A}/menu.xml
echo -e "lxqt-policykit &\n\npicom \
--experimental-backends &\n\nplank &
\ntrayer --monitor primary --align \
right --tint 0x716966 --height 40 -\
-transparent true &\n\n(nm-applet) &
\n(volumeicon) &\n\n(sleep 5 && sh \
~/mona.sh) &" > ~/$A/autostart
echo -e 'dconf dump /'"$G"'/ > ~/'"$Q"'
'"$S"' sed -i '"'s/bottom/right/'"' ~/'"$Q"'
'"$S"' cat ~/'"$Q"' | dconf load /'"$G"'/
'"$S"' echo -e "'"[PlankDockItemPreferences]
Launcher=file:///usr/share/applications/nemo\
.desktop"'"\ > ~/'"$F"'/nemo.dockitem
'"$S"' rm ~/'"$F"'/geeqie.dockitem
'"$S"' rm ~/'"$F"'/vlc-1.dockitem
'"$S"' rm ~/'"$F"'/vlc.dockitem
'"$S"' sed -i '"'13,"'$d'"'"'\
 ~/.config/openbox/autostart
'"$S"' pkill volumeicon 
'"$S"' sed -i -e '"'s/5/1/'"' \
-e '"'s/l=false/l=true/'"' -e \
'"'s/b_slider=false/b_slider=true/'"'\
  ~/.config/volumeicon/volumeicon
'"$S"' volumeicon ; sleep 10 && \
rm ~/'"$Q"' && rm ~/mona.sh' > ~/mona.sh 
su root -c "chmod 755 /$(cat /etc/U)/mona.sh && rm /etc/U && rm -- $0"
echo -e '\e[1;31mDone!\nTo Finish Type: "'"reboot"'"\e[0m'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
