#!/bin/bash
# Note! This script is built for a GitHub Codespace (specifically one spun up with the .devcontainer included). Slight modifications may be needed for it to run correctly on your machine. 

# Ensure bash script works correctly in PATH (i.e. when it is incorporated into TeXlive)
    # Remove the script if it is already present, so we can copy the updated version (if it has been updated, otherwise the same version) 
        rm /usr/local/bin/file_tree
    # Copy with symbolic link
        sudo cp -s "/workspaces/Prassble/testing/tree/file_tree.sh" "/usr/local/bin/file_tree"
    # Magic update thingy
        source ~/.bashrc

# Ensure this directory "packages" is registered under TeXlive  
    texmf_cnf="$(kpsewhich texmf.cnf)"
    append_texmf_cnf="TEXMFLOCAL = $SELFAUTOPARENT/../texmf-local,/workspaces/Prassble/packages"
    # If $append_texmf_cnf is not found in $texmf_cnf, then append it to the end of $texmf_cnf
        if ! grep -q "$append_texmf_cnf" "$texmf_cnf"; then
            Some Actions # SomeString was not found
        fi
    # Update stuff for kpsewhich to function correctly
        texhash