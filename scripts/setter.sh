#!/bin/bash

######################
##Deployment script###
######################

#Restart WebUI (Start if it's off)
#true/false
RUN_UI=false

#Do health-check after deployment
#true/false
DO_HC=true

#Url of checking project
#http://localhost:port/name/
HC_URL="http://localhost:8080/petclinic-web/"


######################
####Vagrantfile#######
######################

#Full path to your/project/isodenv
ISODENV_PATH='/home/student/ISODENV/petclinic-gs/isodenv'

#Full path to your/project/configs (ex. sla.xml)
CONFIGS_PATH='/home/student/ISODENV/petclinic-gs/configs'

#####################
##Ansible playbook###
#####################

#Url server with your Java and Gigaspaces
#http://A.B.C.D:port/
SERV_IP='http://172.26.6.6:8080/'

#Name Java archive on server
JAVA_SERV='jdk-7u79-linux-x64.gz'

#Path to Java in Vagrant
#/srv/prop/jdk/name
JAVA='/srv/prop/jdk/jdk1.7.0_79/'

#Name Gigaspaces archive on server
GS_SERV='gs.tar.gz'

#Path to Gigaspaces in Vagrant
#srv/prop/gigaspaces/name
GS_HOME='/srv/prop/gigaspaces/gigaspaces-xap-premium-9.6.2-ga'

####################
#Execute of setter##
####################

sed -i "s#%RUN_UI%#${RUN_UI}#g" ${ISODENV_PATH}/scripts/deploy_script.sh
sed -i "s#%DO_HC%#${DO_HC}#g" ${ISODENV_PATH}/scripts/deploy_script.sh

sed -i "s#%HC_URL%#${HC_URL}#g" ${ISODENV_PATH}/scripts/lib/health_check.sh

sed -i "s#%ISODENV%#${ISODENV_PATH}#g" ${ISODENV_PATH}/Vagrantfile
sed -i "s#%CONFIGS%#${CONFIGS_PATH}#g" ${ISODENV_PATH}/Vagrantfile


sed -i "s#%SERV_IP%#${SERV_IP}#g" ${ISODENV_PATH}/provision/playbook.yml
sed -i "s#%JAVA_SERV%#${JAVA_SERV}#g" ${ISODENV_PATH}/provision/playbook.yml
sed -i "s#%JAVA%#${JAVA}#g" ${ISODENV_PATH}/provision/playbook.yml
sed -i "s#%GS_SERV%#${GS_SERV}#g" ${ISODENV_PATH}/provision/playbook.yml
sed -i "s#%GS_HOME%#${GS_HOME}#g" ${ISODENV_PATH}/provision/playbook.yml

mv ${ISODENV_PATH}/Vagrantfile ${ISODENV_PATH}/..

#sudo rm ${ISODENV_PATH}/scripts/setter.sh


