sync; sleep 2; sync
umount mnt/proc
umount mnt/
sync
kpartx -d disk.raw
sync

[ -e disk.qcow2 ] && rm disk.qcow2
qemu-img convert -f raw -O qcow2 disk.raw disk.qcow2
