<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="xml" version="1.0" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:for-each select="/Tracker/TrackerItem">
            <xsl:value-of select="translate(Summary,'+',' ')" />
            
            <xsl:value-of select="translate(Details,'+',' ')" />
        </xsl:for-each>
    
    </xsl:template>
</xsl:stylesheet>