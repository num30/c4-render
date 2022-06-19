#!/bin/bash
rm -rf md
mkdir  md

INDX=README.md
rm $INDX

echo "# Ukama C4 Diagrams" >> $INDX
echo "" >> $INDX

echo "Current dir:" $pwd
echo "Current dirs:"
ls
echo List of mermaid files:
ls mermaid 
for file in mermaid/*.mmd; do
    file_only=${file##*/}
    name=${file_only%.mmd}
    name=${name#structurizr-}
    echo "Processing $file"
    
    echo  "# ${name}" >> md/${name}.md
    echo  "\`\`\`mermaid" >> md/${name}.md
    cat $file >> md/${name}.md
    echo "" >> md/${name}.md
    echo  "\`\`\`" >> md/${name}.md
    
    # add entry to index 
    echo "- [$name](md/$name.md)" >> $INDX
done

sudo rm -rf mermaid