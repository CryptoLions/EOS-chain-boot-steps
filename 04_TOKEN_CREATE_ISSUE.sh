#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS Junlge testnet
#
# https://github.com/CryptoLions/
#
################################################################################

./cleos.sh push action eosio.token create '["eosio", "10000000000.0000 EOS", 0, 0, 0]' -p eosio.token
./cleos.sh push action eosio.token issue '["eosio",  "1000000000.0000 EOS", "init"]' -p eosio

./cleos.sh push action eosio.token create '["eosio", "1000000000.0000 JUNGLE", 0, 0, 0]' -p eosio.token
./cleos.sh push action eosio.token issue '["eosio", "1000000000.0000 JUNGLE", "init"]' -p eosio



