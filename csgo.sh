#!/bin/sh
cd $HOME/hlserver
csgo/srcds_run -game csgo -autoupdate -steam_dir ~/hlserver -steamcmd_script ~/hlserver/csgo_ds.txt $@
