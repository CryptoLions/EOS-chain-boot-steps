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
INIT_URL="$( jq -r '.INIT_URL' "00_CONFIG.conf" )"


./cleos.sh system regproducer $INIT_ACCOUNT $INIT_PUB_KEY "$INIT_URL" -p INIT_ACCOUNT

