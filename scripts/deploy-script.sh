#!/bin/bash

#list of artifacts for deployment
function deploy_app {

/srv/prop/gigaspaces/current/bin/gs.sh "-initialization-timeout 20000 deploy -sla file:///configs/sla.xml /vagrant/petclinic-processor/target/petclinic-processor.jar"
/srv/prop/gigaspaces/current/bin/gs.sh "-initialization-timeout 20000 deploy -sla file:///configs/sla.xml /vagrant/petclinic-web/target/petclinic-web.war"
}


#######################
#INSTALL VARIABLES#####
#######################

#restart WEB_UI
RUN_WEBUI=true

#do health-check after deployment
DO_HEALTHCHECK=true

#######################
#EXECUTE OF DEPLOYMENT#
#######################

#kill_gs
sudo bash /isodenv/scripts/lib/gs-kill.sh

#restart_webui
if $RUN_WEBUI; then
  bash /isodenv/scripts/lib/gs-webui-stop.sh
  bash /isodenv/scripts/lib/gs-webui-start.sh
fi

#start_gs
bash /isodenv/scripts/lib/start-gsa.sh

#deployment artifacts
deploy_app

#health_check
if $DO_HEALTHCHECK; then
  bash /isodenv/scripts/lib/health-check.sh
fi