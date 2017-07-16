#!/bin/bash
# A script to create subtitle svg files for Open Shot.

create_subtitle() {
    sed s/Textholder/"${2}"/ <dummy.svg>subtitle-$1.svg
    inkscape \
        --select=text5323 --verb=AlignHorizontalCenter \
        --verb FileSave --verb=FileQuit subtitle-$1.svg
}

echo "Creating Subtitles for Open Shot."
LinesFile="lines.txt"
echo "Reading File"
readarray -t Lines<"$LinesFile"
NumLines=$(wc -l < "$LinesFile")

start=1
echo "Creating Subtitles"
echo "Total Lines = $NumLines"

for i in "${!Lines[@]}"
do
    echo "i = $i, Line = ${Lines[$i]}"
    create_subtitle $(($i+$start)) "${Lines[$i]}"
done

echo "Finished."

