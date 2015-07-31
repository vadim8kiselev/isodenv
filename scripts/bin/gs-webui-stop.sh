#!/bin/bash

gs_webui_pid=$(ps -ef | grep "\-name webui" | grep -v grep | awk '{print $2}')

if [[ -z "${gs_webui_pid}" ]]
then
	echo "WebUI process not running"
else
	echo "Stopping WebUI process running on PID $gs_webui_pid"
    kill -9 ${gs_webui_pid}
    sleep 60
fi
