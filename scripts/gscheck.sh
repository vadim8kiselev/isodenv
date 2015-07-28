#!/bin/bash
v_gsa_pid=`ps -ef | grep com.gigaspaces.start.SystemBoot | grep -v grep | grep -e GSA -e LH -e GSM -e GSC | awk '1==1 { print $2 }'`

if [ -n "$v_gsa_pid" ]
then
 sudo kill -9 $v_gsa_pid
fi

if [ -d /srv/prop/gigaspaces/current/work/processing-units/ ]
then
  sudo rm -rf /srv/prop/gigaspaces/current/work/processing-units/*
fi

if [ -d /logs/apps/gigaspaces ]
then
  sudo rm -rf /logs/apps/gigaspaces/*
fi
