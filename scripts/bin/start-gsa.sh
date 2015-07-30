JSHOMEDIR="/srv/prop/gigaspaces/current/"
services="com.gigaspaces.start.services=\"GSA\"" 
command_line="gsa.lus 1 gsa.gsm 1 gsa.global.lus 0 gsa.global.gsm 0 gsa.gsc 1"
sudo nohup ${JSHOMEDIR}/bin/gs.sh start $services $command_line &
