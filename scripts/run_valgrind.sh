#!/usr/bin/env bash
# set -e # This setting is telling the script to exit on a command error.
# set -x # You refer to a noisy script.(Used to debugging)

CURRENT_DATE=$(date "+%Y%m%d%H%M%S")
export DEBIAN_FRONTEND=noninteractive

SCRIPT=$(readlink -f "")
SCRIPTDIR=$(dirname "$SCRIPT")

if [ "$(whoami)" != "root" ]; then
	SUDO=sudo
fi

# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#  Maintainer :- Vallabh Kansagara<vrkansagara@gmail.com> — @vrkansagara
#  Note		  :-
# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! command -v valgrind &> /dev/null
then
	echo "Installatin sterd for the valgrind command not found"
	${SUDO} apt-get install valgrind
fi

valgrind \
	--leak-check=full \
	--show-reachable=yes \
	--show-leak-kinds=all \
	--track-fds=yes \
	--errors-for-leak-kinds=all \
	--suppressions="${SCRIPTDIR}/main_suppressions.valgrind" \
	"${SCRIPTDIR}/../src/main"
