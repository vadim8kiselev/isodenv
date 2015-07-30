#!/bin/bash

v_gsa_pid=`ps -ef | grep com.gigaspaces.start.SystemBoot | grep -v grep | grep -e GSA -e LH -e GSM -e GSC | awk '1==1 { print $2 }'`

if [ -n "$v_gsa_pid" ]
then
 echo 'Gigaspaces is running.'
else
 echo 'Gigaspaces is off.'
fi

