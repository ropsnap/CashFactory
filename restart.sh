#!/bin/bash
#######################################################################

echo;
echo '	Restarting CashFactory...'
echo;

docker-compose down && docker-compose up -d;