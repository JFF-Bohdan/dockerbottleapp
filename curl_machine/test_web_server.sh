#!/bin/bash

# initial wait interval (in seconds)
initial_sleep_interval=5

# target host
target_host="172.17.0.2"

# overriding host using current docker-compose configuration
target_host="bap_web"

# target host port
target_port='80'

# compiling target url
url="http://$target_host:$target_port/api/beacon"

echo "Waiting for $initial_sleep_interval second(s) while web server will start..."
sleep $initial_sleep_interval

echo "Checking beacon UID..."

# get output, append HTTP status code in separate line, discard error message
OUT=$( curl -q --fail --silent --write-out '\n%{http_code}' "${url}" ) 2>/dev/null

# get exit code
RET=$?

if [[ $RET -ne 0 ]] ; then
    # if error exit code, print exit code
    echo "[FAILED]"
    echo "\tcurl exit code: $RET"

    # print HTTP error
    echo "\tHTTP error: $(echo "$OUT" | tail -n1 )"

    exit 1
else
    BEACON_UID=$(echo "$OUT" | head -n-1)

    if [ "$BEACON_UID" == "5914e2c1e1724ca597695a177fdaf8ea" ]; then
        echo "[  OK  ]"
        exit 0
    fi

    echo "[FAILED]"
    echo "Wrong beacon value: $BEACON_UID"
    exit 2
fi

