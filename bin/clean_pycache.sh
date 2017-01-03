#!/bin/bash

SCRIPTNAME=`basename $0`

USAGE="
Usage:
  $SCRIPTNAME [-f] [start-directory]
  $SCRIPTNAME [-h|--help]

start-directory    Top directory from which to recursively remove pycache objects
-f                 Remove file objects (.pyc) as well - BEWARE other file with same extension
-h|--help          Show this help
"

START_DIR=""
CLEAN_FILE_OBJECTS=false

# Read command line parameters
while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "$USAGE"
            exit 0
            ;;
        -f)
            CLEAN_FILE_OBJECTS=true
            shift
            ;;
        *)
            # Check if START_DIR is already set
            if [[ -z START_DIR ]]; then
                echo "Unrecognized option: '$1'!"
                exit 2
            fi
            # Check if directory exists
            if [[ ! -d $1 ]]; then
                echo "'$1' is not a valid directory!"
                exit 3
            fi
            # Set START_DIR
            START_DIR=$1
            shift
            ;;
    esac
done

# Set default START_DIR
if [[ -z $START_DIR ]]; then
    START_DIR=.
fi

# Confirm cleaning

CONFIRM_STRING="Will remove all __pycache__ directories"
if $CLEAN_FILE_OBJECTS; then
    CONFIRM_STRING=${CONFIRM_STRING}", as well as .pyc files,"
fi
CONFIRM_STRING=${CONFIRM_STRING}" from $START_DIR and all sub-directories.
"
if $CLEAN_FILE_OBJECTS; then
    CONFIRM_STRING="${CONFIRM_STRING}
    CAVEAT: ALL FILES with '.pyc' file name extension will be removed!
"
fi

echo "$CONFIRM_STRING"
read -p "Press any key to continue or CTRL-C to cancel now.."

# Clean __pycache__
find $START_DIR -type d -name "__pycache__" -print0 | xargs -0 -r rm -rf

# Clean .pyc
if $CLEAN_FILE_OBJECTS; then
    find $START_DIR -type f -name "*.pyc" -print0 | xargs -0 -r rm
fi

