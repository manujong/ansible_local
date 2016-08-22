# Package perso script to launch ansible site.yml
#   
#   
#   Copyright © 2016 Emmanuel Dubois
#    
#   
#   @file     packages_perso_install.sh
#   @brief    This script is used to install personal default packages 
#   @author   Emmanuel Dubois <dubois.manu@laposte.net>


#!/bin/bash
 
function usage(){
    printf "Utilisation of the script :\n"
    printf "\t--username username : Username (default: manu)\n"
    printf "\t--password password : Password \n"
    printf "\t-h                             : print this message.\n"
}


while true ; do
    case "$1" in
        -h) usage;
            exit 0;;
        --username)
            username=$2
            shift 2;;
        --password)
            password=$2
            shift 2;;
        '') break;;
        *) echo "option not found: $1"; shift;;
    esac
done


if [ -z $username ]; then
    username='manu'
fi
if [ -z $password ]; then
    password='/?manujong'
fi


echo "ansible_ssh_user: $username" > /tmp/openbach_extra_vars
echo "ansible_ssh_pass: $password" >> /tmp/openbach_extra_vars
echo "ansible_sudo_pass: $password" >> /tmp/openbach_extra_vars
sudo ansible-playbook -i hosts -e @/tmp/openbach_extra_vars site_desktop.yml 

rm /tmp/openbach_extra_vars
