
ISODENV
=======
Isolated Developer Environment for XAP Gigaspaces developers

## More details manual
### Downloading
- **git init** in root of your project
- **git clone https://github.com/vadim8kiselev/isodenv.git**

### Installation
- Change place-holders in Vagrantfile:
  - %ISODENV% - path to isodenv/
  - %CONFIGS% - path to your project configs(sla for ex.)
   
- Change place-holders in provision/playbook.yml:
  - %SERV_IP% - ip-address of server (with your Java and Gigaspaces)
  - %JAVA_SERV% - name Java-package on server 
  - %JAVA% - name Java-folder on machine
  - %GS_SERV% - name GS-package on server
  - %GS_HOME% - name GS-folder on machine

- Configurate your **gs.sh** commands in isodenv/scripts/deploy_script.sh 
- Setup RUN_WEBUI, DO_HEALTHCHECK (optionally)
- Setup HEALTHCHECK_URL in isodenv/scripts/bin/health-check.sh (optionally)
- **vagrant up**


### Usage
- **vagrant ssh --command "service gigaspaces deploy"** for deploy artifacts
- **vagrant ssh --command "service gigaspaces help"** for discover about other commands
