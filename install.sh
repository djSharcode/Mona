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
';A='\e[1;31m';B='\e[0m ';C='en_US.U'
D='/Adwaita/Oranchelo';head -15 "$0"|
tail -13;E='Fira Sans Condensed Book/
';F='/Cantarell';G='systemctl enable'
H='openbox-session';I='usr/share/gtk'
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
until printf $A"Enter User Name:$B"&&
read R&&U="${R,,}"&&[ ${#U} -gt 4 ]&&
[[ "$U" =~ ^[a-z]*$ ]];do :;done;use\
radd -m -G wheel $U;until printf $A"\
User Password"$B&&passwd $U;do :;done
until printf $A"Enter Root Password \
"$B&&passwd;do :;done;echo -e "127.0\
.0.1${S}localhost\n::1${Z}127.0.1.1$\
S${U}c.localdomain ${U}c"> /etc/hosts
sed -i '0,/# %/ s/# %/ %/' /etc/sudo\
ers;ln -sf "$(cat /etc/T)" /etc/loca\
ltime;echo LANG=${C}TF-8 > /etc/loca\
le.conf;sed -i "s/#$C/$C/" /etc/loca\
le.gen;echo "/home/$U/n" > /etc/U;s\
ed -i 's/au/1920x1080,au/' /etc/defa\
ult/grub;sed -i "s/tw/$H/" /etc/X11/\
xinit/xinitrc;echo ${U}c > /etc/host\
name;echo $H>/home/${U}/.xinitrc;hwc\
lock --systohc;locale-gen;sed -i -e "
s$F/$E" -e "2 s$D/" -e "s$D-Beka/" /\
$I-2.0/gtkrc;sed -i -e "s$F/$E" -e "
3 s$D/" -e "2 s$D-Beka/" /$I-3.0/set\
tings.ini;echo -e $A"SDDM"$B;$G sddm
echo -e $A"NETWORK"$B;$G NetworkMana\
ger;echo -e $A"GRUB"$B;grub-install \
--target=x86_64-efi --efi-directory=\
/boot --bootloader-id=GRUB;grub-mkco\
nfig>/boot/grub/grub.cfg;I='"$(xrandr
|egrep -';echo -e 'N='$I'o '"'HDMI-1|
HDMI1'"')";O='$I'o '"'eDP1|eDP-1'"')"
M="$(find /home/*/.screenlayout/*.sh)
";P='$I'c '"'HDMI|eDP'"')";if [ -r $M 
]&&$(grep -q xrandr $M)&&;then $M;elif
[ $P -ge 2 ];then xrandr\
--output $N --pos 1920x0 --primary \
--rotate normal --pos 1920x0 --mode \
auto --output $O --pos 0x0 --rotate \
normal --mode 1920x1080;fi'>/usr/sha\
re/sddm/scripts/Xsetup;curl -sSL htt\
ps://raw.githubusercontent.com/djSha\
rcode/Mona/main/installMo.sh>/home/$\
U/Mo.sh;cd /;chown root:root /home;c\
hmod 755 /home;runuser --login $U --\
session-command "sh ~/Mo.sh"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
