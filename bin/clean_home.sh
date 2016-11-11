#!/bin/bash

# Clean pycache stuff
clean_pycache.sh -f ${HOME}/.pyvenvs
clean_pycache.sh ${HOME}/repos

# Clean mozilla cache
rm -rf ${HOME}/.cache/mozilla


