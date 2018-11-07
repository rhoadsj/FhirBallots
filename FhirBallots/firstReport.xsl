<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" />
    
    <xsl:template match="/" >
        <xsl:apply-templates select="trackerItems"></xsl:apply-templates>               
    </xsl:template>
    
    <xsl:template match="trackerItems">
        <xsl:apply-templates select="item" />             
    </xsl:template>
      
    <xsl:template match="item">
        <xsl:value-of select="@number"/>
        <xsl:text>&#x9;</xsl:text>
       <xsl:value-of select="@realSubmitter"/>
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="@summary"/>
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="@group"/>
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="@moverSeconderFor-Against-Abstain"/>
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="@ballotResolution"/>
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="@resolutionDate"/>
 !--        <xsl:text> </xsl:text>
        <xsl:value-of select="resolution"/>
-->        
        <xsl:text>&#xA;</xsl:text>    </xsl:template>
</xsl:stylesheet>