<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>
  <!-- match the outermost element -->
  <xsl:template match="/PROCEDURE">
    <instructions>
      <name><xsl:value-of select="TITLE"/></name>
      <xsl:apply-templates select="EQUIPMENT" />
      <xsl:apply-templates select="INSTRUCTIONS" />
    </instructions>
  </xsl:template>
  <xsl:template match="EQUIPMENT">
    <xsl:apply-templates select="ITEM" />
  </xsl:template>
  <xsl:template match="ITEM">
    <need><xsl:value-of select="."/></need>
  </xsl:template>
  <xsl:template match="INSTRUCTIONS">
    <xsl:apply-templates select="STEP" />
  </xsl:template>
  <xsl:template match="STEP">
    <action><xsl:value-of select="."/></action>
  </xsl:template>
</xsl:stylesheet>
