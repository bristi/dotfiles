#!/bin/bash

# Just search in present directory
#find . -maxdepth 1 -name ".*" | tail -n+2 | xargs du -sch

# Just search in $HOME
find ~ -maxdepth 1 -name ".*" | xargs du -sch


