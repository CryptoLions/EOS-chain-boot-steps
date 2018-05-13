#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################

INIT_ACCOUNT="$( jq -r '.INIT_ACCOUNT' "00_CONFIG.conf" )"
INIT_PUB_KEY="$( jq -r '.INIT_PUB_KEY' "00_CONFIG.conf" )"

./cleos.sh system newaccount --stake-net "200000000.0000 EOS" --stake-cpu "200000000.0000 EOS" --buy-ram-bytes 8888888 eosio $INIT_ACCOUNT $INIT_PUB_KEY $INIT_PUB_KEY -p eosio


