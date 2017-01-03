#!/bin/bash

# Force all cleaning without asking first
FORCE=false

SCRIPTNAME=`basename $0`

USAGE="
Usage:
  $SCRIPTNAME [-f]
  $SCRIPTNAME [-h|--help]

  -f                 Force (don't ask) removal of all cache objects
  -h|--help          Show this help
"

if [[ $1 == "-h" ]]; then
    echo "$USAGE"
    exit 0
fi

if [[ $1 == "-f" ]]; then
    FORCE=true
fi

# Clean pycache stuff
if ! $FORCE; then
    read -p "** Clean python cache objects? (y/N) " ANSWER
fi
if $FORCE || [[ $ANSWER == "y" ]]; then
    echo "****************************************"
    echo "** Cleaning python cache objects      **"
    echo "****************************************"
    echo ""
    clean_pycache.sh -f ${HOME}/.pyvenvs
    clean_pycache.sh ${HOME}/repos
    ANSWER="N"
fi

# Clean pip cache
if ! $FORCE; then
    read -p "** Clean pip cache? (y/N) " ANSWER
fi
if $FORCE || [[ $ANSWER == "y" ]]; then
    echo "****************************************"
    echo "** Cleaning pip cache                 **"
    echo "****************************************"
    echo ""
    rm -rf ${HOME}/.cache/pip
    ANSWER="N"
fi

# Clean mozilla cache
if ! $FORCE; then
    read -p "** Clean mozilla cache? (y/N) " ANSWER
fi
if $FORCE || [[ $ANSWER == "y" ]]; then
    echo "****************************************"
    echo "** Cleaning mozilla cache             **"
    echo "****************************************"
    echo ""
    rm -rf ${HOME}/.cache/mozilla
    ANSWER="N"
fi


