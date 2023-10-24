#!/bin/sh
PURPLE='\033[1;35m'
NC='\033[0m' # No Color

echo -e "${PURPLE}Set up integration tests${NC}"
source daisy.env
docker-compose build daisy
bash setup_virtual_serial_port.sh &

echo -e "${PURPLE}Bring up containers${NC}"
docker-compose up --abort-on-container-exit

echo -e "${PURPLE}Run integration tests${NC}"
pytest test_integration.py

echo -e "${PURPLE}Tear down integration tests${NC}"
rm test-data/test-output.json
