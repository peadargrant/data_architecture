#!/usr/bin/env pwsh
# Convert md to html for labs
# Peadar Grant

Param ( 
$input_filename
)

$output_filename = $input_filename.Replace('.md','.html')

pandoc --standalone -t html --css ../lab.css -o $output_filename $input_filename



