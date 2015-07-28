#!/bin/bash

#list of artifacts for deployment
function deploy_app {

/srv/prop/gigaspaces/current/bin/gs.sh "deploy -sla file:///configs/sla.xml /vagrant/petclinic-gs/petclinic-processor/target/petclinic-processor.jar"
/srv/prop/gigaspaces/current/bin/gs.sh "deploy -sla file:///configs/sla.xml /vagrant/petclinic-gs/petclinic-web/target/petclinic-web.war"
}

#restart WEB_UI
RUN_WEBUI=true

#do health-check after deployment
DO_HEALTHCHECK=true
HEALTHCHECK_URL="http://localhost:8080/petclinic-web/"


#######################
#EXECUTE OF DEPLOYMENT#
#######################

#kill_gs
sudo bash /isodenv/scripts/gscheck.sh

#restart_webui
if $RUN_WEBUI; then
  bash /isodenv/scripts/gs-webui-stop.sh
  bash /isodenv/scripts/gs-webui-start.sh
fi

#start_gs
bash /isodenv/scripts/start_gsa.sh

#deployment artifacts
deploy_app

#health_check
if $DO_HEALTHCHECK; then
  bash /isodenv/scripts/health_check.sh
fi
