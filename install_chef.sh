#!/bin/bash
cat - >mnt/tmp/install_chef <<EOF
#!/bin/bash
  if command -v wget >/dev/null ; then
    wget https://www.opscode.com/chef/install.sh -O - | sudo -E bash 
  elif command -v curl >/dev/null ; then
    curl -sSL https://www.opscode.com/chef/install.sh | sudo -E bash 
  else
    echo ">>>>>> Neither wget nor curl found in this image"
    exit 16
  fi
EOF
chmod 755 mnt/tmp/install_chef
chroot mnt "/tmp/install_chef"
