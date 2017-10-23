From: https://askubuntu.com/a/666632/543204
Adapted for my use
# Disable Fast Startup
TODO automate
# Set up the partitions with gparted
- 200MB+ (260MB) FAT32 mount as EFI system partition
- 50% windows FAT32
- 50% linux
  - 1GB /boot EXT4
  - * / BTRFS
# Install linux
# Install windows
# Disable Fast Startup again
# Update grub
From https://askubuntu.com/a/489556/543204
```bash
sudo update-grub
sudo grub-install /dev/sdX # replace X with the letter of the partition where grub is located
sudo update-grub
sudo reboot
```
