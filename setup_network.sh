echo -e "auto eth0\niface eth0 inet dhcp" >> mnt/etc/network/interfaces
echo -e "auto em1\niface em1 inet dhcp" >> mnt/etc/network/interfaces

cat mnt/etc/network/interfaces
