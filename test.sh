#!/bin/bash
set -e

# DISTRO_NAME="pop_os"

# if [ $DISTRO_NAME = 'pop_os' ]
# then
#   echo 'pop os'
# elif [ $DISTRO_NAME = 'Ubuntu' ]
# then
#   echo 'ubuntu'
# else
#   echo 'nada'
# fi

realpath() { [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"; }