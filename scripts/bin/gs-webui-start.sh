#!/bin/bash

gs_webui_pid=$(ps -ef | grep "\-name webui" | grep -v grep | awk '{print $2}')
JSHOMEDIR="/srv/prop/gigaspaces/current"
GS_LOGS="${JSHOMEDIR}/logs"

if [[ ! -z "${gs_webui_pid}" ]]
then
    echo "WebUI is already running on PID ${gs_webui_pid}"
else
    echo "Starting WebUI Process"

    # This scripts invokes <GSROOT>/tools/gs-webui/gs-webui.sh script

    nohup ${JSHOMEDIR}/tools/gs-webui/gs-webui.sh $* > ${GS_LOGS}/gs-webui-nohup.out 2>&1 &

    sleep 10

    gs_webui_pid=$(ps -ef | grep "\-name webui" | grep -v grep | awk '{print $2}')

    if [[ ! -z "${gs_webui_pid}" ]]
    then
        echo "WebUI started on pid ${gs_webui_pid}"
    else
        echo "Could not start WebUI. Please contact Administrator"
    fi

    echo "check ${GS_LOGS}/gs-webui-nohup.out for errors"
fi
