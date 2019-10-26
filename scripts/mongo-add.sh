#!/bin/bash -e

HOSTNAME=$1

mongo --eval 'rs.initiate ({_id: "rs01",members: [{_id: 0,host: "mongodb01:27017"}, {_id: 1,host: "mongodb02:27017"}, {_id: 2,host: "mongodb03:27017"}]});'