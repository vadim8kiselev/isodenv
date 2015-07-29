#!/bin/bash

#list of artifacts for deployment
function deploy_app {

/srv/prop/gigaspaces/current/bin/gs.sh "deploy -sla file:///configs/sla.xml /vagrant/petclinic-gs/petclinic-processor/target/petclinic-processor.jar"
/srv/prop/gigaspaces/current/bin/gs.sh "deploy -sla file:///configs/sla.xml /vagrant/petclinic-gs/petclinic-web/target/petclinic-web.war"
}


#######################
#INSTALL VARIABLES#####
#######################

#restart WEB_UI
RUN_WEBUI=%RUN_UI%

#do health-check after deployment
DO_HEALTHCHECK=%DO_HC%

#######################
#EXECUTE OF DEPLOYMENT#
#######################

#kill_gs
sudo bash /isodenv/scripts/lib/gscheck.sh

#restart_webui
if $RUN_WEBUI; then
  bash /isodenv/scripts/lib/gs-webui-stop.sh
  bash /isodenv/scripts/lib/gs-webui-start.sh
fi

#start_gs
bash /isodenv/scripts/lib/start_gsa.sh

#deployment artifacts
deploy_app

#health_check
if $DO_HEALTHCHECK; then
  bash /isodenv/scripts/lib/health_check.sh
fi
