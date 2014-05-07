OS=wheezy
KERNEL=linux-image-amd64
MIRROR=http://ftp.us.debian.org/debian/
PACKAGES=openssh-server,sudo,ca-certificates

dd if=/dev/null bs=1M seek=8192 of=disk.raw

parted -s disk.raw mklabel msdos
parted -s disk.raw mkpart primary 0% 100%
parted -s disk.raw set 1 boot on

install-mbr disk.raw

modprobe dm_mod
kpartx -av disk.raw

LOOPBACK_PARTITION=/dev/mapper/loop0p1

yes | mkfs.ext4 ${LOOPBACK_PARTITION}

tune2fs -i 0 /dev/mapper/loop0p1

mkdir mnt
mount ${LOOPBACK_PARTITION} mnt/

debootstrap --include=${PACKAGES},${KERNEL} ${OS} mnt/ ${MIRROR}

mount -t proc proc mnt/proc/

chroot mnt/ apt-get update
chroot mnt/ apt-get install locales
chroot mnt/ locale-gen en_US.utf8

echo "LANG=en_US.UTF-8" >> mnt/etc/environment
echo "LANGUAGE=en_US.UTF-8" >> mnt/etc/environment
echo "LANG=en_US.UTF-8" >> mnt/etc/default/locale
echo "LANGUAGE=en_US.UTF-8" >> mnt/etc/default/locale
chroot mnt/ /bin/bash -c "DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales"
chroot mnt/ /bin/bash -c "locale-gen --purge en_US.UTF-8"

chroot mnt/ apt-get upgrade
chroot mnt/ apt-get clean

echo "stackguest" > mnt/etc/hostname
rm mnt/etc/udev/rules.d/70-persistent-net.rules
