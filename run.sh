#!/bin/bash

#docker run -it --rm -v $PWD:/usr/local/structurizr structurizr/cli export -f plantuml -w  $FILE_NAME -o rendered
mkdir -p $TARGET_PATH
docker run -it --rm -v $PWD:/usr/local/structurizr structurizr/cli export -f mermaid -w $FILE_NAME -o $TARGET_PATH/mermaid

cd $TARGET_PATH

rm -rf md
mkdir  md

INDX=README.md
rm $INDX

echo "# Ukama C4 Diagrams" >> $INDX
echo "" >> $INDX

echo "Processing files in $(realpath ./mermaid)"
for file in ./mermaid/*.mmd; do
    file_only=${file##*/}
    name=${file_only%.mmd}
    name=${name#structurizr-}
    echo "Processing $file"
    
    echo  "# ${name}" >> ./md/${name}.md
    echo  "\`\`\`mermaid" >> ./md/${name}.md
    cat $file >> ./md/${name}.md
    echo "" >> ./md/${name}.md
    echo  "\`\`\`" >> ./md/${name}.md
    
    # add entry to index 
    echo "- [$name](md/$name.md)" >> $INDX
done

sudo rm -rf mermaid