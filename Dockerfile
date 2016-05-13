FROM ubuntu:12.04
MAINTAINER Max Gonzih <gonzih at gmail dot com>

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install lib32gcc1 lib32z1 lib32ncurses5 lib32bz2-1.0 lib32asound2 curl
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV USER csgo

RUN useradd $USER
ENV HOME /home/$USER
RUN mkdir $HOME
RUN chown $USER:$USER $HOME

USER $USER
ENV SERVER $HOME/hlserver
RUN mkdir $SERVER
RUN curl http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C $SERVER -xvz
ADD ./csgo_ds.txt $SERVER/csgo_ds.txt
ADD ./update.sh $SERVER/update.sh
ADD ./csgo.sh $SERVER/csgo.sh
RUN $SERVER/update.sh

EXPOSE 27015/udp

WORKDIR /home/$USER/hlserver
ENTRYPOINT ["./csgo.sh"]
CMD ["+game_type" "0" "+game_mode" "0" "+mapgroup" "mg_bomb" "+map" "de_dust2"]
