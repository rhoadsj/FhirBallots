<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output media-type="html" />
    <xsl:template match="/">
        <xsl:apply-templates select="trackerItems"></xsl:apply-templates>
    </xsl:template>
    <xsl:template match="trackerItems">
        <html>
            <body>
                <xsl:for-each select="/trackerItems/item" >
                    <xsl:value-of select="@number" />
                </xsl:for-each>
            </body>
        </html>

    </xsl:template>
    
</xsl:stylesheet>