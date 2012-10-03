RAW_SIZE=`cat disk.qcow2 | wc -c`
echo "RAW_SIZE=${RAW_SIZE}"

echo 'Be sure to have export your openstack credentials'

glance add name=IMAGE_NAME is_public=True disk_format=qcow2 container_format=bare image_size="${RAW_SIZE}" < disk.qcow2
