#!/bin/bash

#docker run -it --rm -v $PWD:/usr/local/structurizr structurizr/cli export -f plantuml -w ukama.dsl -o rendered
docker run -it --rm -v $PWD:/usr/local/structurizr structurizr/cli export -f $TARGET_PATH -w $FILE_NAME -o mermaid

cd $TARGET_PATH
rm -rf md
mkdir  md

INDX=DIAGRAMS.md
rm $INDX

echo "# Ukama C4 Diagrams" >> $INDX
echo "" >> $INDX

for file in ./*.mmd; do
    file_only=${file##*/}
    name=${file_only%.mmd}
    name=${name#structurizr-}
    
    echo  "# ${name}" >> ./md/${name}.md
    echo  "\`\`\`mermaid" >> ./md/${name}.md
    cat $file >> ./md/${name}.md
    echo "" >> ./md/${name}.md
    echo  "\`\`\`" >> ./md/${name}.md
    
    # add entry to index 
    echo "- [$name](md/$name.md)" >> $INDX
done