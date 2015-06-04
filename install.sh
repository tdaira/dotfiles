#!/bin/bash

for f in .??*

do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    cp -r ./"$f" ../"$f"
done
