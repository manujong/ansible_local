#!/bin/bash
# Package perso script to launch ansible site.yml
#   
#   
#   Copyright © 2016 Emmanuel Dubois
#    
#   
#   @file     default_install.sh
#   @brief    This script is used to install personal default packages and default configuration as backup
#   @author   Emmanuel Dubois <dubois.manu@laposte.net>

sudo ansible-playbook -i hosts  -e secret --vault-password-file ~/.vault_pass.txt ~/sys/dev/local/default_install/site.yml

