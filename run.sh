#!/bin/bash
cd $TARGET_PATH

rm -rf ./md
mkdir ./md

INDX=README.md
rm $INDX

echo "# C4 Diagrams" >> $INDX
echo "" >> $INDX


echo "Current dir: " $(pwd)
echo "Current files:"
ls
echo List of mermaid files:
ls $PWD/mermaid
for file in $PWD/mermaid/*.mmd; do
    file_only=${file##*/}
    name=${file_only%.mmd}
    name=${name#structurizr-}
    echo "Processing $file"
    
    echo  "# ${name}" >> $PWD/md/${name}.md
    echo  "\`\`\`mermaid" >> $PWD/md/${name}.md
    cat $file >> $PWD/md/${name}.md
    echo "" >> $PWD/md/${name}.md
    echo  "\`\`\`" >> $PWD/md/${name}.md
    
    # add entry to index 
    echo "- [$name](md/$name.md)" >> $INDX
done

sudo rm -rf mermaid
