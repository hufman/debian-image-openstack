curl https://raw.github.com/openstack/nova/master/contrib/openstack-config > mnt/etc/init.d/openstack-config
chown root:root mnt/etc/init.d/openstack-config
chmod 755 mnt/etc/init.d/openstack-config
chroot mnt/ /usr/sbin/update-rc.d openstack-config defaults
