debian-image-openstack
======================

few scripts to create a debian image and upload it to glance
you can specify which version (squeeze/wheezy) and packages to add.

You must run this script as root

Upstream at https://github.com/l0nkaji/debian-image-openstack

Steps:

1. apt-get install debootstrap mbr kpartx glance
2. ./create\_image.sh
3. ./setup\_fstab.sh
4. ./setup\_network.sh
5. ./setup\_extlinux.sh
6. ./setup\_configdrive.sh
7. Optional steps:
  * ./install\_chef.sh
8. ./convert\_to\_qcow.sh
9. ./upload\_to\_glance.sh NAME


