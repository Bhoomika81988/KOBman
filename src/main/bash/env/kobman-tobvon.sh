#!/bin/bash


function __kobman_development_tobvon_dir {

	cd ~	
	sudo mkdir -p DevDir_TOBVon
	cd DevDir_TOBVon
	export KOBMAN_VON_DEV_DIR=$PWD
	sudo chmod 777 ${KOBMAN_VON_DEV_DIR}
	cd ${KOBMAN_VON_DEV_DIR}
	sudo mkdir -p test/ dependency/
}                                                                                                                          
function __kobman_install_tobvon
{
		kobman_namespace="$1"	
		__kobman_echo_red "Building VON-(TheOrgBook) from"
		__kobman_echo_red " ${kobman_namespace}"
         
		cd ${KOBMAN_CANDIDATES_DIR}
		__kobman_development_tobvon_dir 
		echo "$PWD"
		sudo git clone https://github.com/${kobman_namespace}/von-network.git
                sudo von-network/manage rm
                sudo von-network/manage build
		cd ~
}

function __kobman_start_tobvon
{

	__kobman_echo_red "Starting VON-(TheOrgBook) from"
	__kobman_echo_red "${kobman_namespace}"
        cd ${KOBMAN_VON_DEV_DIR} 
	sudo von-network/manage start
}

function __kobman_uninstall_tobvon
{
 	__kobman_echo_red "VON-(TheOrgBook) - Uninstalling..."	
	cd ${KOBMAN_VON_DEV_DIR} 
	sudo rm -rf von-network/ 2> /dev/null	
	cd ~
	sudo rm -rf ${KOBMAN_VON_DEV_DIR} 2> /dev/null	

        cd ~
}


function __kobman_version_tobvon
{
	kobman_namespace="$1"
#        if [ -z "$kobman_namespace" ]; then
#                read -p "Enter namespace for Github :" kobman_namespace
#	fi	
# 	__kobman_echo_red "VON-(TheOrgBook) - Version"	
	git ls-remote --tags https://github.com/${kobman_namespace}/von-network | grep -o v0.0.*

}

