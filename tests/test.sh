#!/bin/sh
PURPLE='\033[1;35m'
NC='\033[0m' # No Color

echo -e "${PURPLE}Set up integration tests${NC}"
sudo docker compose build daisy
bash setup_virtual_serial_port.sh &

# Allow ports time to startup
sleep 5
# Symlinks do not work in docker-compose files. Write correct port numbers to be used in .env file
echo "export DAISY_PORT="$(readlink /dev/ttyharness0) > .env
echo "export HARNESS_PORT="$(readlink /dev/ttyharness1) >> .env
source .env

echo -e "${PURPLE}Bring up containers${NC}"
sudo docker compose up --abort-on-container-exit

echo -e "${PURPLE}Run integration tests${NC}"
pytest test_integration.py

echo -e "${PURPLE}Tear down integration tests${NC}"
rm test-data/test-output.json
sleep 10
killall socat
