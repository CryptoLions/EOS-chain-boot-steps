#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################

EOSIO_PRODUCER_KEY="$( jq -r '.EOSIO_PRODUCER_PUB_KEY' "00_CONFIG.conf" )"

./cleos.sh create account eosio eosio.token $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio
./cleos.sh create account eosio eosio.msig $EOSIO_PRODUCER_KEY $EOSIO_PRODUCER_KEY -p eosio


