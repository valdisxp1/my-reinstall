#!/bin/bash

# /usr/share/kbd/keymaps/i386/qwerty/lv.map.gz
# latvian keyboard apostrophe
# loadkeys lv

# sync time online
timedatectl set-ntp true

# "n\np\n\n+2G\n" "n\np\n\n\n" "w\n"
# TODO automate partitioning
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda1 /mnt
mkdir /mnt/boot
mount /dev/sda2 /mnt/boot

# Install the base packages
pacstrap /mnt base

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

# Timezone
#ls -sf /usr/share/zoneinfo/Europe/Riga /etc/localtime
ls -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime

hwclock --systohc

locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=lv" > /etc/vconsole.conf
echo "archy" > /etc/hostname

echo "127.0.0.1       localhost" > /etc/hosts
echo "::1             localhost" >> /etc/hosts
echo "127.0.1.1       archy.localdomain archy" >> /etc/hosts

#mkinitcpio -p linux

# interactive
passwd
