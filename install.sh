#!/bin/bash
set -euo pipefail
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
S='       ';Z='             localhost
';B='\e[1;31m';A='\e[0m';F='en_US.UTF
';D='/Adwaita/Oranchelo';head -15 $0|
tail -13;C='Fira Sans Condensed Book/
';J='systemctl enable';G='/Cantarell'
H='openbox-session';E='/usr/share/gtk
' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
until printf "${B}Enter Root Password
:${A}"&&passwd;do :;done;until print\
f "${B}User Name: ${A}"&&read -r R &&
U="${R,,}"&&[[ "$U" =~ ^[a-z]*$ ]] &&
[[ ${#U} -gt 4 ]];do :;done;useradd \
-m -G wheel ${U}; until echo -e "${B}
Enter User's Password${A}"&&passwd $U
do :;done;P="${U}pc";echo -e "127.0.\
0.1${S}localhost\n::1${Z}127.0.1.1${\
S}${P}.localdomain ${P}" >>/etc/hosts
sed -i '0,/# %/ s/# %/ %/' /etc/sudo\
ers;ln -sf /$(cat /etc/T ) /etc/loca\
ltime;sed -i "s/#${F}/$F/" /etc/loca\
le.gen;echo "LANG=${U}-8" >/etc/loca\
le.conf;locale-gen;echo $P>/etc/host\
name;echo "/home/$U/m.sh" >/etc/U;hw\
clock --systohc;echo "$H" >/home/$U/\
.xinitrc;sed -i 's/aut/1920x1080,aut/
' /etc/default/grub;sed -i "s/twm/$H/
" /etc/X11/xinit/xinitrc;sed -i -e "
s$G/$C" -e "3 s$D/" -e "2 s$D-Beka/
" $E-3.0/settings.ini;sed -i -e "s$D\
-Beka/" -e "2 s$D/" -e "s$G/$C" -e $\
E-2.0/gtkrc;echo -e "${B}GRUB${A}";g\
rub-install --target=x86_64-efi --ef\
i-directory=/boot --bootloader-id=GR\
UB;grub-mkconfig >/boot/grub/grub.cfg
echo -e "${B}NETWORK${A}";$J Network\
Manager;echo -e "${B}DISPLAY ENABLED
${A}";$J sddm;I='$(xrandr|egrep';ech\
o -e 'M=$(find /home/*/.screenlayout\
/*.sh) \nP="'"$I"'-c '"'HDMI|eDP'"')"
N="'"$I"'-o '"'HDMI-1|HDMI1'"')"\nO='
"$I"'-o '"'eDP1|eDP-1'"')"\nP='"$I"'\
-c '"'eDP|HDMI'"')"\nif [[ -r ${M} ]]
&&$(grep -q xrandr ${M});then ${M};e\
lif [[ $P -ge 2 ]];then xrandr --out\
put $O --mode 1920x1080 --pos 0x0 --\
rotate normal --output $N --primary \
--mode auto --pos 1920x0 --rotate no\
rmal;fi'>/usr/share/sddm/scripts/Xse\
tup;curl -s https://raw.githubuserco\
ntent.com/djSharcode/Mona/main/insta\
llMo.sh>~$U/.sh;cd /;chown root:root /ho\
me;chmod 755 /home;runuser --login $\
U --session-command "sh ~/.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
