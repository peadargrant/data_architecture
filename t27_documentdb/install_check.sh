#!/bin/bash
# install checks for MongoDB

ISSUES=0
COMMANDS="mongo mongosh mongod"
for COMMAND in $COMMANDS
do
    echo -n "checking for $COMMAND ... "
    if command -v $COMMAND > /dev/null
    then
	echo found
    else
	echo not found
	ISSUES=$((ISSUES + 1))
    fi
done

echo "issues found: $ISSUES"




    
