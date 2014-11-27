FROM ubuntu:12.04
MAINTAINER Max Gonzih <gonzih at gmail dot com>

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install lib32gcc1 lib32z1 lib32ncurses5 lib32bz2-1.0 lib32asound2 wget
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN adduser --gecos "" tf2

USER tf2
ENV HOME /home/tf2
ENV SERVER $HOME/hlserver
RUN mkdir $SERVER
RUN wget -O - http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C $SERVER -xvz
ADD ./tf2_ds.txt $SERVER/tf2_ds.txt
ADD ./update.sh $SERVER/update.sh
ADD ./tf.sh $SERVER/tf.sh
RUN $SERVER/update.sh

EXPOSE 27015/udp

ENTRYPOINT ["/home/tf2/hlserver/tf.sh"]
CMD ["+sv_pure", "1", "+mapcycle", "mapcycle_quickplay_payload.txt", "+map", "pl_badwater", "+maxplayers", "24"]
