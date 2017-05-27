#!/bin/bash
# A script to create subtitle svg files for Open Shot.

create_subtitle() {
    sed s/Textholder/"${2}"/ <dummy.svg>subtitle-$1.svg
    inkscape \
        --verb=EditSelectAll --verb=AlignHorizontalCenter \
        --verb FileSave --verb=FileQuit subtitle-$1.svg
}

echo "Creating Subtitles for Open Shot."

readarray -t Lines < lines.txt

start=1

for i in "${!Lines[@]}"
do
    echo "i = $i, Line = ${Lines[$i]}"
    create_subtitle $(($i+$start)) "${Lines[$i]}"
done

echo "Finished."

