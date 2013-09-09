file='cloud-init_0.7.2-3~bpo70+1_all.deb'
! [ -e mnt/tmp/$file ] && wget http://ftp.us.debian.org/debian/pool/main/c/cloud-init/$file -O mnt/tmp/$file && chroot mnt/ dpkg -i /tmp/$file

file='cloud-utils_0.26-2~bpo70+1_all.deb'
! [ -e mnt/tmp/$file ] && wget http://ftp.us.debian.org/debian/pool/main/c/cloud-init/$file -O mnt/tmp/$file && chroot mnt/ dpkg -i /tmp/$file

chroot mnt/ apt-get install -fy

cat - >mnt/etc/cloud/cloud.cfg.d/90_dpkg.cfg <<EOF
# to update this file, run dpkg-reconfigure cloud-init
datasource_list: [ NoCloud, AltCloud, ConfigDrive, Ec2, MAAS, OVF, None ]
EOF
cat mnt/etc/cloud/cloud.cfg.d/90_dpkg.cfg
