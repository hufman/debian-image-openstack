VMLINUZ=`chroot mnt find boot/ -name "vmlinuz-*"`
INITRD=`chroot mnt find boot/ -name "initrd*"`
echo -e "default linux\ntimeout 1\n\nlabel linux\nkernel ${VMLINUZ}\nappend initrd=${INITRD} root=UUID=${PARTITION_UUID} ro quiet" > mnt/extlinux.conf
cat mnt/extlinux.conf

extlinux --install mnt/
