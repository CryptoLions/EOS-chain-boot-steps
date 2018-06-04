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



#TX should be approved by each producer
proposer="lioninjungle"
proposalName="compens123"

#BP_ACCOUNT:
ACCOUNT="bpaccount111"

permissions='{"actor": "'$ACCOUNT'", "permission": "active"}'

./cleos.sh multisig approve $proposer $proposalName "$permissions" -p $ACCOUNT
