#!/bin/bash
DATADIR="./blockchain"
if [ ! -d $DATADIR ]; then
    mkdir -p $DATADIR;
fi

nodine --snapshot $DATADIR"/data/snapshots/snapshot-00000e53e9dcfb0884ad545e7195a9904ad9790c407af4e0a4a5cc2d0da83d3c.bin" \
--plugin inery::producer_plugin \
--plugin inery::producer_api_plugin \
--plugin inery::chain_plugin \
--plugin inery::chain_api_plugin \
--plugin inery::http_plugin \
--plugin inery::history_api_plugin \
--plugin inery::history_plugin \
--plugin inery::net_plugin \
--plugin inery::net_api_plugin \
--data-dir $DATADIR"/data" \
--blocks-dir $DATADIR"/blocks" \
--config-dir $DATADIR"/config" \
--access-control-allow-origin=* \
--contracts-console \
--http-validate-host=false \
--verbose-http-errors \
--p2p-max-nodes-per-host 100 \
--connection-cleanup-period 10 \
--master-name rizal24 \
--http-server-address 0.0.0.0:8888 \
--p2p-listen-endpoint your_DNS_here:9010 \
--p2p-peer-address tas.blockchain-servers.world:9010 \
--signature-provider your_public_key=KEY:your_private_key \
--p2p-peer-address sys.blockchain-servers.world:9010 \
--p2p-peer-address master1.blockchain-servers.world:9010 \
--p2p-peer-address master2.blockchain-servers.world:9010 \
--p2p-peer-address master3.blockchain-servers.world:9010 \
>> $DATADIR"/nodine.log" 2>&1 & \
echo $! > $DATADIR"/ined.pid"
