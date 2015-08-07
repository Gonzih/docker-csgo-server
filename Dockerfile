from ubuntu:12.04
maintainer Max Gonzih <gonzih at gmail dot com>

run apt-get -y update
run apt-get -y upgrade
run apt-get -y install lib32gcc1 lib32z1 lib32ncurses5 lib32bz2-1.0 lib32asound2 wget
run apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

env USER tf2

run adduser --gecos "" $USER

user $USER
env HOME /home/$USERc
env SERVER $HOME/hlserver
run mkdir $SERVER
run wget -O - http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C $SERVER -xvz
add ./tf2_ds.txt $SERVER/tf2_ds.txt
add ./update.sh $SERVER/update.sh
add ./tf.sh $SERVER/tf.sh
run $SERVER/update.sh

expose 27015/udp

entrypoint ["/home/$USER/hlserver/tf.sh"]
cmd ["+sv_pure", "1", "+mapcycle", "mapcycle_quickplay_payload.txt", "+map", "pl_badwater", "+maxplayers", "24"]
