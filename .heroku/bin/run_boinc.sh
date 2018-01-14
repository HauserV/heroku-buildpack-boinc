#!/usr/bin/env bash

export BOINC_PORT=${BOINC_PORT:-"3333"}

boinc --allow_multiple_clients --gui_rpc_port $BOINC_PORT &

while [ ! -f "gui_rpc_auth.cfg" ]; do
   sleep 1
done

echo "Started BOINC with port ${BOINC_PORT}, password $(cat gui_rpc_auth.cfg)."
fg
