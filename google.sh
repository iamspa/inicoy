rm -rf iniminer-linux-x64  restart_iniminer.sh && \
wget https://github.com/Project-InitVerse/ini-miner/releases/download/v1.0.0/iniminer-linux-x64 && chmod +x iniminer-linux-x64 && touch restart_iniminer.sh && chmod +x restart_iniminer.sh && \
echo '#!/bin/bash

# Path to the executable and its arguments
./iniminer-linux-x64 --pool stratum+tcp://0xde1d9fd7ff6fccf6179244ee238954e2c7dfbf10.google@pool-core-testnet.inichain.com:32672 --cpu-devices 1
 
# Infinite loop to restart the process if it terminates
while true; do
    echo "Starting iniminer..."
./iniminer-linux-x64 --pool stratum+tcp://0xde1d9fd7ff6fccf6179244ee238954e2c7dfbf10.google@pool-core-testnet.inichain.com:32672 --cpu-devices 1
    echo "Process terminated. Restarting in 5 seconds..."
    sleep 5
done' > restart_iniminer.sh && \
echo './restart_iniminer.sh' >> .bashrc && \
./restart_iniminer.sh