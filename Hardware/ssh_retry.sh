#!/bin/bash -f

# Check we've got command line arguments
if [ -z "$*" ] ; then
    echo "Need to specify ssh options"
    exit 1
fi

# Start trying and retrying
((count = 100))
while [[ $count -ne 0 ]] ; do
    ssh $*
    rc=$?
    if [[ $rc -eq 0 ]] ; then
        ((count = 1))
    fi
    ((count = count - 1))
done

# Print a message if we failed
if [[ $rc -ne 0 ]] ; then
    echo "Could not connect to $* after 100 attempts - stopping."
fi


