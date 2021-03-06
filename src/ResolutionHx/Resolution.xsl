<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" />
    
    <xsl:template match="/" >
        <xsl:for-each select="trackerItems/item">
            <xsl:sort select="@resolutionDate"></xsl:sort>
            <xsl:value-of select="@number"/>
            <xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="@resolutionDate"/>
            <xsl:text>&#xA;</xsl:text>           
        </xsl:for-each>
    </xsl:template>
    

</xsl:stylesheet>
