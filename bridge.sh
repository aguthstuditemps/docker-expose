#!/bin/bash
# mkdir /tmp/blabla && cd /tmp/blabla
# curl -LsSO https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant
# mv vagrant ~/.ssh/id_rsa_insecure
# chmod 600 ~/.ssh/id_rsa_insecure
# cd -

DHOST=$1
CONTAINER=$(ssh docker docker inspect port-bridge | grep -A1 '"Links":' | tail -1 | sed 's/.*\"\/\(.*\):.*\"/\1/')
MAPPING=$2:$CONTAINER:$3
PORT=$(ssh $DHOST docker ps | grep port-bridge | sed -e 's/.*0.0.0.0:\(.*\)->22.*/\1/')
ssh -p $PORT -i ~/.ssh/id_rsa_insecure -o StrictHostKeyChecking=no -L $MAPPING -N app-admin@$DHOST
