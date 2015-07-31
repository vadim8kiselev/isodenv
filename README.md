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
- **cd isodenv/**
- Tap **[here](https://github.com/vadim8kiselev/isodenv/blob/dev/MANUAL.md)** for more details configurate of your ISODENV
- Configurate your **gs.sh** commands in isodenv/scripts/deploy_script.sh
- **vagrant up** (It's automatically deploy your application on start (everytime))

### Usage
- **vagrant ssh --command "service gigaspaces deploy"** for deploy artifacts
- **vagrant ssh --command "service gigaspaces help"** for discover about other commands

## Dependencies
- Git
- Virtual Box
- Vagrant
- Ansible
