#!/usr/bin/env sh

set -e

# install-postmarketos.sh

# Perform all installation steps after `pmbootstrap init`.
# ref: https://wiki.postmarketos.org/wiki/Installation/Using_pmbootstrap

echo -e "Generating an image for flashing to the device..."
pmbootstrap install

echo -e "Rebooting bootloader..."
sleep 1s; adb reboot bootloader

echo -e "Flashing rootfs..."
sleep 1s; pmbootstrap flasher flash_rootfs

echo -e "Flashing the kernel..."
sleep 1s; pmbootstrap flasher flash_kernel

sleep 1s; echo -e "...done flashing."

echo -e "Rebooting..."
sleep 1s; pmbootstrap chroot fastboot reboot
