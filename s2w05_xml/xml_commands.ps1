# XML commands in PowerShell
# Peadar Grant
# (not intended to be run as a script!)

# assuming file is named sample.xml
$XmlFileName="sample.xml" 

# 1)
# Checking for well-formedness of sample.xml
# Reading in an XML file
[xml](Get-Content $XmlFileName)
# if no error occurs, file is well-formed.

# 2)
# Parsing XMl document into Powershell
$doc = [xml](Get-Conent $XmlFileName)

# 3)
# Selecting elements
$doc.product.description
# etc. 



