#!/bin/bash
setfont ter-124b
head -n 8 -- "$0" | tail -n 5
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
    #     Mozart - Moonlight Sonata           #
 #         0:35 ━❍──────── -5:32           #
   #       ↻     ⊲  Ⅱ  ⊳     ↺               #
#          VOLUME: ▁▂▃▄▅▆▇ 100%          #
A='\e[1;31m' ; B='\e[0m' ; E='btrfs su cr @'  #
F='mount -o noatime,compress=zstd,subvol=@'   #
G="$(lscpu | grep -Eo 'AMD|Intel' | sort -u)" #
J='/etc/mkinitcpio.conf' ; K='/etc/pacman'    #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
gpg -k | pacman-key --populate
lsblk  | egrep --color 'NAME|SIZE|disk'
echo -en "${A}Enter Device to Install: ${B}"
read -r C ; until sgdisk /dev/${C} -Z \
-o -n 1::+512M -t 1:EF00 -n -i -v -p
do echo -en "${A}Try again:  ${B}" && \
read -r C ; done; sed -i 's/#Co/Co/' ${K}.conf
D1="$(ls /dev/* | egrep "^/dev/${C}p?1$") "
D2="$(ls /dev/* | egrep "^/dev/${C}p?2$") "
mkfs.vfat ${D1} ; mkfs.btrfs -fq ${D2}
mount ${D2}/mnt ; cd /mnt ; ${E}home
${E} ; cd ; umount /mnt  ; ${F} ${D2}/mnt
mkdir /mnt/{boot,home}  ; mount ${D1}/mnt/boot
${F}home ${D2}/mnt/home; lsblk -e 7,11
if [[ ${G} == Intel ]]; then I='i915 '\
 && H='intel-ucode'  ; fi
if [[ ${G} == AMD ]]; then I='amdgpu '\
 && H='amd-ucode'  ; fi
sed -i "s/ULES=()/ULES=(${I}btrfs)/" ${J}
timedatectl set-ntp true | reflector -f 2 \
-p https --score 5 --save ${K}.d/mirrorlist
pacstrap -i /mnt base base-devel linux xorg \
linux-headers linux-firmware efibootmgr vim \
networkmanager lxappearance-obconf-gtk3 git \
network-manager-applet nm-connection-editor \
pipewire pipewire-alsa pipewire-pulse plank \
pipewire-jack alsa-utils lxqt-policykit vlc \
gst-plugin-pipewire gvfs-afc gvfs-mtp xterm \
nemo-preview nemo-fileroller alacritty grub \
firefox firefox-ublock-origin geany-plugins \
libreoffice-still otf-fira-mono trayer sddm \
pkg-config otf-fira-sans xlockmore libpulse \
volumeicon screengrab galculator xorg-xinit \
arandr rofi gufw htop capitaine-cursors ${H}
cp ${J} mnt${J}; cp ${K} mnt${K}; curl -sSL \
https://raw.githubusercontent.com/djsharcode\
/Mona/main/install.sh > /mnt/etc/install.sh
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh /etc/install.sh
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
