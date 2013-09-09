LOOPBACK_PARTITION=/dev/mapper/loop0p1
PARTITION_UUID=`blkid -o value -s UUID ${LOOPBACK_PARTITION}`

VMLINUZ=`chroot mnt find boot/ -name "vmlinuz-*"`
INITRD=`chroot mnt find boot/ -name "initrd*"`
echo -e "default linux\ntimeout 1\n\nlabel linux\nkernel ${VMLINUZ}\nappend initrd=${INITRD} root=UUID=${PARTITION_UUID} ro console=ttyS0" > mnt/extlinux.conf
cat mnt/extlinux.conf

extlinux --install mnt/
