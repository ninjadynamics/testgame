#!/bin/bash
sed -i 's/\s*$//g'   *.html
git ls-files -z | while IFS= read -rd '' f; do
    if [[ $f =~ .*\.(html$|sh$) ]]; then
        tail -c1 < "$f" | read -r _ || echo >> "$f"; #dos2unix "$f";
    fi
done
dos2unix *.sh
