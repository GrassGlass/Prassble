# Prassble
A LaTeX preamble made by Grass.

[//]: # (Add CTAN hyperlink)

> The LaTeX project Prassble

> Copyright (c) 2025 by Grass (GrassGlass) <shaohong00002 at gmail dot com>

> This work may be distributed and/or modified under the
> conditions of the LaTeX Project Public License, either version 1.3
> of this license or (at your option) any later version.
> The latest version of this license is in
>   http://www.latex-project.org/lppl.txt
> and version 1.3 or later is part of all distributions of LaTeX
> version 2005/12/01 or later.

> This work has the LPPL maintenance status `author-maintained'.

> This work consists of all files listed in README

`Prassble` provides a nice template preamble and coverpage for LaTeX documents---including useful macros/packages, colored boxes, etc.

## Contents of the LaTeX project Prassble

- preamble
    - environments
        - box_styles
            - listings
                - commands
                    - modified_commands
                        - `NewInputListing.tex`
                        - `NewListing.tex`
                    - newcommands
                        - `all_short_names.tex`
                        - `name_converters.tex`
                        - `new_varaibles.tex`
                - `codestyles.tex`
            - `nonlistings.tex`
        - derived_environments
            - `lengths_and_counters.tex`
            - `listings.tex`
            - `nonlistings.tex`
    - math
        - `general_math.tex`
        - `specific_math.tex`
    - `custom-symbols.tex`
    - `enumeration.tex`
    - `external_hyperlink_format.tex`
    - `Input_macro.tex`
    - `other.tex`
    - `page-formatting.tex`
    - `preamble.tex`
- `main.tex`
- test
  - `testing.tex`

## Known bugs: 
1. The custom listing environments (`code(*)`, `codeoutput(*)`, ...) cannot have `\hspace{<dim>}` or `\(...\)` included in the `tcbkey` `comment` (probably among other macros). The first results in `TeX capacity exceeded, sorry [input stack size=10000].`. As for the latter: the errors
```
\GenericError  ...                                
                                                    #4  \errhelp \@err@     ...
```
and 
```
The control sequence at the end of the top line
of your error message was never \def'ed. If you have
misspelled it (e.g., `\hobx'), type `I' and the correct
spelling (e.g., `I\hbox'). Otherwise just continue,
and I'll forget about whatever was undefined.
```
are produced. Interestingly, `$...$` works, though.