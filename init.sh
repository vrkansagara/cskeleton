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

originaFile="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
originaFilePath=$(readlink -f "$originaFile")
originaFileDirectory=$(dirname "$originaFilePath")
originaFileiExtention="${originaFile##*.}"
originaFileinameWithoutExtention="${originaFile##*/}"

echo
echo "File name								$originaFile"
echo "File name only						$originaFileinameWithoutExtention"
echo "File extentin only					$originaFileinameWithoutExtention"
echo "Script path is						$originaFilePath"
echo "Script directory is					$originaFileDirectory"
echo

currentFileName="${0##*/}"
currentFilePath=${0}
currentFileDirectory=$(dirname "$currentFilePath")
currentFileExtentionOnly="${currentFileName##*.}"
currentFileNameOnly="${currentFileName%.*}"

echo
echo "Current file							$currentFileName"
echo "Current file path						$currentFilePath"
echo "Current file directory				$currentFileDirectory"
echo "Current file first part				$currentFileNameOnly"
echo "Current file extention part			$currentFileExtentionOnly"

# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#  Maintainer :- Vallabh Kansagara<vrkansagara@gmail.com> — @vrkansagara
#  Note		  :-
# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

cd src/

${SUDO} make clean install


echo "main binary installed .............[DONE]."

exit 0
