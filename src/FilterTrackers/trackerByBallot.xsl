<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output standalone="yes" method="xml" />

    <xsl:param name="which-ballot" select="'2018-Jan PHD'" />
    
    <xsl:template match="/">
       <xsl:copy select="trackerItems">
            <xsl:for-each select="/trackerItems/item[ballot=$which-ballot]" >
            <xsl:copy-of select="."></xsl:copy-of>           
            </xsl:for-each>
       </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
