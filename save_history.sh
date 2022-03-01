#!/bin/bash
# Peadar Grant
# Save in-class bash history to git repo

if [ ! -f "../save_history.sh" ]
then
    echo "must run from a topic folder"
    exit
fi

mkdir -p _capture

cd _capture

outfile=history_$(date '+%Y-%m-%d-%H%M').sh
echo output filename $outfile

# write history to file (w/o line numbers)
history -w $outfile

# add the file to git
git add $outfile

# clear terminal history
history -c

