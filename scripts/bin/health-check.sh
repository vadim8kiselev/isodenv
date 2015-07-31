#!/bin/bash

HEALTHCHECK_URL="http://localhost:8080/petclinic-web/"

success=$(curl -Is $HEALTHCHECK_URL | head -n 1)

if [ "$success" != "" ]
then
  success=${success: -3:-1}
fi

if [ "$success" = "OK" ]
then
	echo "Success deploy."
else
	echo "Failed deploy." 
fi
