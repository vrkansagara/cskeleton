#!/usr/bin/env bash

# set -e # This setting is telling the script to exit on a command error.
# set -x # You refer to a noisy script.(Used to debugging)
export DEBIAN_FRONTEND=noninteractive

if [ "(whoami)" != "root" ]; then
	SUDO=sudo
fi

CURRENT_DATE=$(date "+%Y%m%d%H%M%S")

# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#  Maintainer :- Vallabh Kansagara<vrkansagara@gmail.com> — @vrkansagara
#  Note		  :- Linux binary (main)
# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

cd src/

${SUDO} make clean install

main& 

echo "main binary installed .............[DONE]."

exit 0
