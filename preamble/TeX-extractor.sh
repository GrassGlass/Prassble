#!/bin/sh

while IFS= read -r LINE; do
    preamble.tex=$(printf '%s' "$LINE" | sed -n 's/^\\Input{\(.*\)}$/\1/p')
    [ -z "$FILE" ] &&
        printf '%s\n' "$LINE" ||
        cat -- "$(kpsewhich "$FILE")"
done <"$1"