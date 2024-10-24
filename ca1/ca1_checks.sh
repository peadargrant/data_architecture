#!/bin/bash
# Checks for CA1

echo "checks for data architecture CA1"

RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'   # Green

issues=0
for f in README.txt er_diagram.pdf database_setup.sql data_load.sh
do
    echo -n "checking for $f ... "
    if [ -f "$f" ]
    then
	echo -e "${GREEN}found${NC}"
    else
	echo -e "${RED}missing!${NC}"
        issues=$((issues+1))
    fi
done

if ((issues>0))
then
    echo -e "${RED}$issues issues found.${NC}"
    echo -e "${RED}Fix and try this script again.${NC}"
else
    echo -e "${GREEN}No issues found. Ready to submit!${NC}"
fi


