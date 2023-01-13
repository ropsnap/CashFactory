export ENABLE_AUTO_LIST_HOME_DIR=0
export ENABLE_CASH_FACTORY_RESTART=0
export ENABLE_AUTO_CODE_SERVER_START=0

sleep 1

clear

echo
echo '  → Initializining VMCF subsystem'

echo
neofetch;
echo

if [ "$ENABLE_AUTO_LIST_HOME" == 1 ]
then
        echo
        echo '  → Listing $HOME dir'
        ll
fi

cd CashFactory;

sleep 1

if [ "$ENABLE_CASH_FACTORY_RESTART" == 1 ]
then

        echo
        echo '   → Turning off CashFactory in order to restart'
        echo

        sleep 1

        sudo docker-compose down;

        echo
        echo '   → Turning on CashFactory'
        echo

        port=80 COMPOSE_HTTP_TIMEOUT=180 sudo docker-compose up -d
fi


if [ "$ENABLE_AUTO_CODE_SERVER_START" == 1 ]
then

        echo
        echo '  → Starting code-server'
        echo

        sleep 1;
        code-server;
fi

sleep 1

echo;
echo "Your username: $(whoami)";
echo "Your ip address:";
echo

ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}'

echo
echo '  ✓ Ready'
echo

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
