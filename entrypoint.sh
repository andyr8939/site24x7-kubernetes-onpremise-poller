#!/bin/bash
# Replace the Device Key in the silent install config with the environment varibale
sed -i "s/S24X7KEY=/S24X7KEY=$MY_247_DEVICE_KEY/g" /opt/Site24x7OnPremisePoller/conf/install.txt

# Start the server, in forground so if it crashes the the container will restart.
./StartServer.sh 



