#!/usr/bin/env pwsh
# Convert md to html for labs
# Peadar Grant

# Lab web pages

$input_files = Get-ChildItem $pwd -Filter '*.md'
Write-Host $input_files

foreach ( $input_file in $input_files ) {
    
    # construct the new output filename
    $output_filename = $input_file.Name.Replace('.md','.html')

    # pandoc to do the conversion using CSS
    pandoc --standalone -t html --css ../lab.css -o $output_filename $input_file.Name

}


# GraphViz diagrams

$input_files = Get-ChildItem $pwd -Filter '*.gv'
Write-Host $input_files

foreach ( $input_file in $input_files ) {
    
    # construct the new output filename
    $output_filename = $input_file.Name.Replace('.gv','.pdf')

    # pandoc to do the conversion using CSS
    dot -Tpdf -o $output_filename $input_file.Name

}


# Latex Docs

latexmk --shell-escape -pdf

