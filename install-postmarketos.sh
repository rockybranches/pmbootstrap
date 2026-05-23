#!/usr/bin/env sh

set -e

# install-postmarketos.sh

# Perform all installation steps after `pmbootstrap init`.
# ref: https://wiki.postmarketos.org/wiki/Installation/Using_pmbootstrap

ensure_sudo() {
    echo -e "Ensure sudo credentials are available..."
    sudo -v
    sleep 1s
}

ensure_sudo
echo -e "Generating an image for flashing to the device..."
pmbootstrap install

ensure_sudo
echo -e "Rebooting bootloader..."
sleep 1s; adb reboot bootloader

ensure_sudo
echo -e "Flashing rootfs..."
sleep 1s; pmbootstrap flasher flash_rootfs

ensure_sudo
echo -e "Flashing the kernel..."
sleep 1s; pmbootstrap flasher flash_kernel

sleep 1s; echo -e "...done flashing."

ensure_sudo
echo -e "Rebooting..."
sleep 1s; pmbootstrap chroot fastboot reboot
