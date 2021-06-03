#!/usr/bin/bash
set -euo pipefail 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
A='alacritty' ; B='.bash' ; C='completion' ; D='https://' ; E='git clone' ; F='pikaur' ; G="pikaur -S --needed" ; H='xfce4' ; I='pipewire' 
J='firefox-developer-edition-i18n-' ; K='otf-fira-' ; L='manager' ; M='plugin' 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
cd ~ ;  ${E} ${D}github.com/${A}/${A}.git ; cd ${A} ; curl --proto '=https' --tlsv1.2 -sSf ${D}sh.rustup.rs | sh ; source $HOME/.cargo/env 
cargo build --release ; mkdir -p ~/${B}_${C} ; cp extra/${C}s/${A}${B} ~/${B}_${C}/${A} ; echo "source ~/${B}_${C}/${A}" >> ~/${B}rc
cd ~ ; ${E} ${D}aur.archlinux.org/${F}.git ; cd ${F} ; makepkg -fsri
${G} xorg rsync xfce-polkit openbox ${H}-settings archlinux-xdg-menu xfconf nm-connection-editor gufw xterm sddm-stellar-theme
${G} alsa-utils ${I} ${I}-alsa ${I}-pulse ${I}-jack gst-${M}-${I} libpulse vlc picom xorg-xprop gvfs xcursor-breeze geany geany-${M}s
${G} nemo nemo-fileroller nemo-image-converter nemo-preview nemo-python nemo-qt-components obkey ristretto menulibre timeshift 
${G} ${J}en-us ${J}en-gb ${J}en-ca ${J}fr ${J}de ${J}it ${J}ja ${J}zh-cn ${J}zh-tw ${J}ru ${J}he ${J}pt-br ${K}sans ${K}mono ttf-ms-fonts 
${G} ${H}-whiskermenu-${M} ${H}-task${L} ${H}-screenshooter ${H}-notes-${M} ${H}-appfinder ${H}-datetime-${M} ${H}-mpc-${M} 
${G} galculator ; if [[ -n "$(grep -E '[8|9|10|11|12|13|14]' /sys/class/dmi/id/chassis_type)" ]] ; then ${F} ${H}-power-${L} ${H}-battery-${F} ; fi
curl -sL hhttps://git.io/JGVg5 > ~/installna.sh ; su --login root -c 'sh ~/installna.sh'
