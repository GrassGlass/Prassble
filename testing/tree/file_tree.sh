#!/bin/bash
# Store the name of the target directory as $directory_name
    # Source: https://stackoverflow.com/a/1371283/31298396
directory_name=$(basename "$(realpath "$1")")
# Escape $1 
    # Source: https://stackoverflow.com/a/29613573/31298396
directory_path_escaped=$(sed 's/[^^]/[&]/g; s/\^/\\^/g' <<< "$1") # escape it.
`# Generate the file tree for the directory $1` \
    `# Source: https://tex.stackexchange.com/q/515582/383565` \
tree \
    `# Exclude the folder "some_folder", "another_folder", all files starting with "ignore_this", and all files with extension .log, .out, etc` \
    -I 'FileTrees*|_minted*|ignore_this*|*.log|*.out|*.tmp|*.synctex(busy)|*.listing|*.pre|*.aux|*.auxlock|*.toc|*.config.minted' \
    `# Print out an XML representation of the tree.` \
    -X \
    `# Turn off file/directory count at end of tree listing.` \
    --noreport \
    `# The directory $1` \
    $1 \
`# Pass the output of tree to the input of sed` \
| \
`# Text manipulation, for us to convert the XML output format to a TikZ forest one. The option "-e [command]" adds [command] to the list of commands that sed executes. ` \
    `# syntax of the s command: 's/regexp/replacement/flags'` \
sed \
    `# Replace "<directory name=".">" by "<directory name=#directory_name>"` \
    -e "s/<directory name=\".\">/<directory name=\"$directory_name\">/" \
    `# Replace "<directory name="$1">" by "<directory name=#directory_name>"` \
    -e "s/<directory name=\"$directory_path_escaped\">/<directory name=\"$directory_name\">/" \
    `# Replace "<tree>" by "\begin{forest}for tree={folder,grow\'=0}/"` \
    -e "s/<tree>/\\\begin{forest}\n file tree,/" \
    `# Replace "</tree>" by "\end{forest}"` \
    -e 's/<\/tree>/\\end{forest}/' \
    `# Replace "<directory name=" and "<file name=" by an opening square bracket [ (escaped to make it an actual square bracket)` \
    -e 's/\(<directory name=\)\|\(<file name=\)/[/' \
    `# Replaces "anything that does not contain a double-quotation mark by "` \
            `# backslash \: escapes the character following it.` \
        `# Regex operators` \
            `# \(...\): a capturing group. This simply capture its contents ... as one unit. Think of how curly braces {...} work in LaTeX.` \
            `# \n: contents of the nth capturing group (...).` \
        `# Wildcard operators` \
            `# [...]: a matching list. A character is matched iff it is contained in [...].` \
            `# [^...]: a nonmatching list. A character is matched iff it is not contained in [^...].` \
            `# <string>*: any string that starts with <string>` \
        `# Breakdown` \
            `# \": a double-quote character` \
            `# [^\"]: any character that is not a double-quote character` \
            `# [^\"]*: any string that does not start with a double-quote character` \
            `# \([^\"]*\): same as before` \
            `# \"\([^\"]*\)\">: any <string> of the form <string> = "<substring>">, where <substring> (which is just \1) does not contain any double-quote character. ` \
            `# "\([^\"]*\)\">/\1: replace any <string> --- of the form <string> = "<substring>">>, where <substring> (which is just \1) does not contain any double-quote character --- by \1 = <substring>` \
    -e 's/\"\([^\"]*\)\">/\1/' \
    `# Replace "</directory> by a closing square bracket "]"` \
    -e 's/<\/directory>/]/' \
    `# Replace "</directory> by a closing square bracket "]"` \
    -e 's/<\/file>/, file]/' \
    `# Delete any string that starts with "<?xml version"` \
    -e '/^<?xml version/d' \
    `# Replace the character "_" by its escaped LaTeX counterpart "\_".` \
    -e 's/_/\\_/g' \
    `# Pass the output of sed to the input of install` \
    | \
    `# Create the directory FileTrees and the file tree_$2. if necessary. Then, write the output of sed to tree_$2.` \
        `# Source: https://stackoverflow.com/a/21053077/31298396` \
    install -D /dev/stdin FileTrees/tree_$2.tmp
