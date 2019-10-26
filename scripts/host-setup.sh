#!/bin/bash -e

IPMASTER=$1
IPREPL01=$2
IPREPL02=$3
NAMEMASTER=$4
NAMEREPL01=$5
NAMEREPL02=$6

sudo cat >> /etc/hosts << EOF
$IPMASTER     $NAMEMASTER 
$IPREPL01     $NAMEREPL01 
$IPREPL02     $NAMEREPL02 
EOF

sleep 10

sudo systemctl start mongod

sleep 10