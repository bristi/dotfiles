#!/bin/bash

USAGE="
USAGE:

  $0 [-h] | [-q] <compare directory> <file to compare>

    -h   Print usage (this)
    -q   Quiet comparison (no git diff for modified files)
"

QUIET=false

# Handle options
while test $# -gt 0; do
    case "$1" in
        -h)
            printf "$USAGE"
            exit 0
            ;;
        -q)
            shift
            QUIET=true
            ;;
        *)
            break
            ;;
    esac
done

# Check for required parameters
if [[ $# < 2 ]]; then
    echo "Too few parameters!"
    echo ""
    printf "$USAGE"
    exit 1
fi
if [[ $# > 2 ]]; then
    echo "Too many parameters!"
    echo ""
    printf "$USAGE"
    exit 1
fi

# Set and check compare directory (remove trailing slash, if any)
COMPARE_DIR=${1%/}
if [[ ! -d $COMPARE_DIR ]]; then
    echo "Directory '$COMPARE_DIR' does not exist!"
    exit 2
fi

# Set and check compare file
COMPARE_FILE=$2
if [[ ! -f $COMPARE_FILE ]]; then
    echo "File '$COMPARE_FILE' does not exist!"
    exit 3
fi

echo "DEBUG: QUIET = $QUIET"
echo "DEBUG: COMPARE_DIR = $COMPARE_DIR"
echo "DEBUG: COMPARE_FILE = $COMPARE_FILE"

check_file () {
    # Check for modifications
    if [ "$QUIET" = true ]; then
        git status | grep $COMPARE_FILE
    else
        git status | grep $COMPARE_FILE && git diff -- $COMPARE_FILE
    fi

    # Check which commits file exist in
    git cfl $COMPARE_FILE
}

# Print file being checked
echo "-- File (current dir): `pwd`/$COMPARE_FILE"

# Check file
check_file

# Go to compare dir
cd $COMPARE_DIR

# Print file being checked
echo "-- File (compare dir): `pwd`/$COMPARE_FILE"

# Check file
check_file

exit 99


$TMPFILE && cd /mnt/NGS01/scratch/NGS_Storage/bst_dropbox/rga-ngss && echo "-- File: `pwd`/$TMPFILE" && git status | grep $TMPFILE && git diff -- $TMPFILE

git cfl $TMPFILE && cd $TMPCURDIR



echo "Please read script. Not done."
exit 1

TMPFILE=docs/sysdoc-infrastructure.rst

TMPCURDIR=`pwd`

echo "-- File: `pwd`/$TMPFILE" && git status | grep $TMPFILE && git diff -- $TMPFILE

git cfl $TMPFILE && cd /mnt/NGS01/scratch/NGS_Storage/bst_dropbox/rga-ngss && echo "-- File: `pwd`/$TMPFILE" && git status | grep $TMPFILE && git diff -- $TMPFILE

git cfl $TMPFILE && cd $TMPCURDIR


