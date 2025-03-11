<?xml version="1.0" encoding="UTF-8"?>
<!--
    This is an "identity transform" document to strip troublesome xmlns to make XPath easier
    Peadar Grant
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="node()|@*">   <!-- Identity template copies all nodes (except for elements, which are handled by the other template) -->
        <xsl:copy>
            <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*">           <!-- Removes all namespaces from all elements -->
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="node()|@*" />
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
