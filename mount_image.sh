modprobe dm_mod
kpartx -av disk.raw

LOOPBACK_PARTITION=/dev/mapper/loop0p1

[ -d mnt ] || mkdir mnt
mount ${LOOPBACK_PARTITION} mnt/

mount -t proc proc mnt/proc/

