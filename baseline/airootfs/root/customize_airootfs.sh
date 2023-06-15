#!/usr/bin/env bash

# cp usr/local/bin/bigsur boot/grub/themes -r
# rm usr/local/bin/bigsur -r
 pacman-key --init
 pacman-key --populate
#  pacman -Sy --noconfirm

cp /root/kernel/vmlinuz-linux /boot
rm /usr/lib/modules/* -rf
cp /root/kernel/6.2.0* /usr/lib/modules/ -rf
rm /root/kernel -rf
mkinitcpio -p linux


echo "End of my customization"