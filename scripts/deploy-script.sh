#!/bin/bash

#list of artifacts for deployment
function deploy_app {

#Example
#/srv/prop/gigaspaces/current/bin/gs.sh "-initialization-timeout 20000 deploy -sla file:///configs/sla.xml /vagrant/petclinic-processor/target/petclinic-processor.jar"
#/srv/prop/gigaspaces/current/bin/gs.sh "-initialization-timeout 20000 deploy -sla file:///configs/sla.xml /vagrant/petclinic-web/target/petclinic-web.war"

}


#######################
#INSTALL VARIABLES#####
#######################

#restart WEB_UI
RUN_WEBUI=true

#do health-check after deployment
DO_HEALTHCHECK=false

#######################
#EXECUTE OF DEPLOYMENT#
#######################

#kill_gs
sudo bash /isodenv/scripts/bin/gs-kill.sh

#restart_webui
if $RUN_WEBUI; then
  bash /isodenv/scripts/bin/gs-webui-stop.sh
  bash /isodenv/scripts/bin/gs-webui-start.sh
fi

#start_gs
bash /isodenv/scripts/bin/start-gsa.sh

#deployment artifacts
deploy_app

#health_check
if $DO_HEALTHCHECK; then
  bash /isodenv/scripts/bin/health-check.sh
fi
