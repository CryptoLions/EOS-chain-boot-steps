#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################
#EOSIO_PRODUCER_KEY="$( jq -r '.EOSIO_PRODUCER_PUB_KEY' "00_CONFIG.conf" )"
#SYSTEM_ACCOUNT=($( jq -r '.SYSTEM_ACCOUNT' "00_CONFIG.conf" ))

#make a propose on transfer from eosio

proposer="lioninjungle"
proposalName="compens123"

CONTRACT="eosio.token"
ACTION="transfer"
DATA='{"from": "eosio", "to": "someuser", "quantity": "123.0000 EOS", "memo": "compensation"}'

#Propose expire in # hours
EXPIRATION_IN_H=24


#Get list active producers from eosio.prods and building requestedPermissions json object
requestedPermissions="";
PRODUCERS=$(./cleos.sh get account eosio.prods -j)
for row in $(echo "${PRODUCERS}" | jq -r '.permissions[] | @base64'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }

    perm_name=$(_jq '.perm_name')
    if [ "$perm_name" == "active" ]; then


        data_=$(_jq '.required_auth')


        #exit
        for accs in $(echo "${data_}" | jq -r '.accounts[] | @base64'); do
                _jq() {
                echo ${accs} | base64 --decode | jq -r ${1}
            }
            account=$(_jq '.permission.actor')
            permission=$(_jq '.permission.permission')

            #bp="$account@$permission"

            # Building requestedPermissions
            requestedPermission='{"actor": "'$account'", "permission": "'$permission'"}'

            if [ "$requestedPermissions" != "" ]; then
                requestedPermissions+=", "
            fi
            requestedPermissions+="$requestedPermission"
        done
        requestedPermissions="[$requestedPermissions]"

        #echo $requestedPermissions
    fi
done


trxPermissions='[{"actor": "eosio", "permission": "active"}]'

./cleos.sh multisig propose "$proposalName" "$requestedPermissions" "$trxPermissions" $CONTRACT $ACTION "$DATA" $proposer $EXPIRATION_IN_H -p $proposer
