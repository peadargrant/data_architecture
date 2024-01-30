# XML commands in bash (linux/unix)
# Peadar Grant
# (not really intended to be run as a script!)

filename=sample.xml

# how to check if XML is well-formed
xmllint --noout $filename

# evalute an xpath expression
xmllint $filename --xpath '/xpath/goes/here'


