#!/bin/bash -e

IPMASTER=$1
NAMEMASTER=$2
IPREPL01=$3
NAMEREPL01=$4
IPREPL02=$5
NAMEREPL02=$6

sudo cat >> /etc/hosts << EOF
$IPMASTER     $NAMEMASTER 
$IPREPL01     $NAMEREPL01 
$IPREPL02     $NAMEREPL02 
EOF

sleep 5

sudo systemctl restart mongod

sleep 5