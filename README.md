ISODENV
=======
Isolated Developer Environment for XAP Gigaspaces developers

## About
ISODENV it is project for developer, which can help him to deploy his project in virtual system without:
- *pollution* of system
- difficulty in the use of
- manual use much of the technology

## How does it work?
### Downloading
- **git init** in root of your project
- **git clone https://github.com/vadim8kiselev/isodenv.git**

### Installation
- **mv isodenv/Vagrantfile ..**
- Change place-holders in Vagrantfile (**sed -i "s#%PH%#PATH#g" Vagrantfile**):
  - %ISODENV% - path to isodenv/
  - %CONFIGS% - path to your project configs(sla for ex.)
   
- Change place-holders in provision/playbook.yml:
  - %SERV_IP% - ip-address of server (with your Java and Gigaspaces)
  - %JAVA_SERV% - name Java-package on server 
  - %JAVA% - name Java-folder on machine
  - %GS_SERV% - name GS-package on server
  - %GS_HOME% - name GS-folder on machine
- **vagrant up**

### Usage
- Configurate your **gs.sh** commands in isodenv/scripts/deploy_script.sh 
- Setup RUN_WEBUI, DO_HEALTHCHECK and HEALTHCHECK_URL (optionally)
- **vagrant ssh --command "service gigaspaces deploy-app"** for deploy artifacts
- **vagrant ssh --command "service gigaspaces help"** for discover about other commands

## Dependencies
- Git
- Virtual Box
- Vagrant
- Ansible
