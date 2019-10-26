#!/bin/bash -e

IP=$1

sudo sed -i "s/bindIp\:\ 127\.0\.0\.1/bindIp\:\ 127\.0\.0\.1,${IP}/g" /etc/mongod.conf
sudo cat >> /etc/mongod.conf << EOF
replication:
  replSetName: "rs01"
EOF

sleep 5

sudo systemctl start mongod

sleep 5