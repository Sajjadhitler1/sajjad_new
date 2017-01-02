#!/usr/bin/env bash

THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

update() {
  git pull
  git submodule update --init --recursive
  install_rocks
}
# By: @To_My_Amigos 
# Will install luarocks on THIS_DIR/.luarocks
install_luarocks() {
  git clone https://bitbucket.org/AntiSpam99/luarocks.git
  cd luarocks
  git checkout tags/v2.2.1 # Current stable

  PREFIX="$THIS_DIR/.luarocks"

  ./configure --prefix=$PREFIX --sysconfdir=$PREFIX/luarocks --force-config

  RET=$?; if [ $RET -ne 0 ];
    then echo "Error. Exiting."; exit $RET;
  fi

  make build && make install
  RET=$?; if [ $RET -ne 0 ];
    then echo "Error. Exiting.";exit $RET;
  fi

  cd ..
  rm -rf luarocks
}

install_rocks() {
  ./.luarocks/bin/luarocks install luasocket
  RET=$?; if [ $RET -ne 0 ];
    then echo "Error. Exiting."; exit $RET;
  fi

  ./.luarocks/bin/luarocks install oauth
  RET=$?; if [ $RET -ne 0 ];
    then echo "Error. Exiting."; exit $RET;
  fi

  ./.luarocks/bin/luarocks install redis-lua
  RET=$?; if [ $RET -ne 0 ];
    then echo "Error. Exiting."; exit $RET;
  fi

  ./.luarocks/bin/luarocks install lua-cjson
  RET=$?; if [ $RET -ne 0 ];
    then echo "Error. Exiting."; exit $RET;
  fi

  ./.luarocks/bin/luarocks install fakeredis
  RET=$?; if [ $RET -ne 0 ];
    then echo "Error. Exiting."; exit $RET;
  fi

  ./.luarocks/bin/luarocks install xml
  RET=$?; if [ $RET -ne 0 ];
    then echo "Error. Exiting."; exit $RET;
  fi

  ./.luarocks/bin/luarocks install feedparser
  RET=$?; if [ $RET -ne 0 ];
    then echo "Error. Exiting."; exit $RET;
  fi

  ./.luarocks/bin/luarocks install serpent
  RET=$?; if [ $RET -ne 0 ];
    then echo "Error. Exiting."; exit $RET;
  fi
}

install2() {
  git pull
  git submodule update --init --recursive
  patch -i "system/disable.patch" -p 0 --batch --forward
  RET=$?;

  cd tg
  if [ $RET -ne 0 ]; then
    autoconf -i
  fi
  ./configure && make

  RET=$?; if [ $RET -ne 0 ]; then
    echo "Error. Exiting."; exit $RET;
  fi
  cd ..
  install_luarocks
  install_rocks
  
  sleep 0.9
  echo ""
  echo ""
  echo "Bot has been installed! you can run bot with:"
  echo ""
  echo ""
  echo ""
  echo "RUN BOT WITH CLI MOD:"
  echo "$0"
  echo ""
  sleep 0.9
  echo ""

  
  exit 1
}

sudos() {
  read -p "Do you want to update the project? [y/n] = "
	if [ "$REPLY" == "y" ] || [ "$REPLY" == "Y" ]; then
        sudo apt-get update
	    wait
	    sudo apt-get upgrade
	    wait
	    sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make unzip git redis-server g++ libjansson-dev libpython-dev expat libexpat1-dev -y
	    wait
		install2
    elif [ "$REPLY" == "n" ] || [ "$REPLY" == "N" ]; then
        install2
	else
	    sudos
    fi
}

install() {
  read -p "Do you want to update the project? [y/n] = "
	if [ "$REPLY" == "y" ] || [ "$REPLY" == "Y" ]; then
        sudo apt-get update
	    wait
	    sudo apt-get upgrade
	    wait
	    sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make unzip git redis-server g++ libjansson-dev libpython-dev expat libexpat1-dev -y
	    wait
		install2
    elif [ "$REPLY" == "n" ] || [ "$REPLY" == "N" ]; then
        install2
	else
	    sudos
    fi
}

que() {
read -p "Do you want to install starter files? [y/n] = "
	if [ "$REPLY" == "y" ] || [ "$REPLY" == "Y" ]; then
        install
    elif [ "$REPLY" == "n" ] || [ "$REPLY" == "N" ]; then
        exit 1
	else
	    que
fi
}

error() {
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make unzip git redis-server g++ libjansson-dev libpython-dev expat libexpat1-dev tmux subversion
}

# By: @To_My_Amigos
if [ "$1" = "install" ]; then
  install
elif [ "$1" = "update" ]; then
  update
elif [ "$1" = "error" ]; then
  error
else
  if [ ! -f ./tg/telegram.h ]; then
    echo -e "\033[38;5;208mError! Tg not found, Please reply to this message:\033[0;00m"
    read -p "Do you want to install starter files? [y/n] = "
	if [ "$REPLY" == "y" ] || [ "$REPLY" == "Y" ]; then
        install
    elif [ "$REPLY" == "n" ] || [ "$REPLY" == "N" ]; then
        exit 1
	else
	    que
    fi
  fi

  if [ ! -f ./tg/bin/telegram-cli ]; then
    echo -e "\033[38;5;208mError! Tg not found, Please reply to this message:\033[0;00m"
    read -p "Do you want to install starter files? [y/n] = "
	if [ "$REPLY" == "y" ] || [ "$REPLY" == "Y" ]; then
        install
    elif [ "$REPLY" == "n" ] || [ "$REPLY" == "N" ]; then
        exit 1
	else
	    que
    fi

elif [ "$1" = "help" ]; then
  echo ""
  echo "You can use:"
  echo ""
  sleep 2
  echo ""
  echo "$0"
  echo "Cli mod for your bot's account"
  echo ""
fi

   
    cd system
    if [ -e "bot.lua" ]; then
     echo
    elif [ -e "self.lua" ]; then
	 rm self.lua 
	 wget http://nahrup.ir/view/909/bot-2.txt
     mv bot-2.txt bot.lua
	elif [ -e "icli.lua" ]; then
	 rm icli.lua 
	 wget http://nahrup.ir/view/909/bot-2.txt
     mv bot-2.txt bot.lua
	fi
	if [ -e "commands.lua" ]; then
	 echo
	elif [ -e "commands-self.lua" ]; then
	 rm commands-self.lua
	 wget http://www.folder98.ir/1395/07/1475545247.txt
	 mv 1475545247.txt commands.lua
	fi
	cd ..
   
  while true; do
   rm -r ../.telegram-cli/state
   ./tg/bin/telegram-cli -k ./tg/tg-server.pub -s ./system/bot.lua -l 1 -E $@
   sleep 3
  done
fi