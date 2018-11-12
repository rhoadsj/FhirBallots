<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fn="http://www.johnrhoads.net/fn"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match='/'>
        <xsl:value-of select="fn:MonthAbbrevToNumber('Mar')"/>
    </xsl:template>
    
    <xsl:function name="fn:MonthAbbrevToNumber" as="xs:integer">
        <xsl:param as="xs:string" name="monthAbbrev" />
        <xsl:choose>
            <xsl:when test="'Jan'=$monthAbbrev">1</xsl:when>
            <xsl:when test="'Feb'=$monthAbbrev">2</xsl:when>
            <xsl:when test="'Mar'=$monthAbbrev">3</xsl:when>
            <xsl:when test="'Apr'=$monthAbbrev">4</xsl:when>
            <xsl:when test="'May'=$monthAbbrev">5</xsl:when>
            <xsl:when test="'Jun'=$monthAbbrev">6</xsl:when>
            <xsl:when test="'Jul'=$monthAbbrev">7</xsl:when>
            <xsl:when test="'Aug'=$monthAbbrev">8</xsl:when>
            <xsl:when test="'Sep'=$monthAbbrev">9</xsl:when>
            <xsl:when test="'Oct'=$monthAbbrev">10</xsl:when>
            <xsl:when test="'Nov'=$monthAbbrev">11</xsl:when>
            <xsl:when test="'Dec'=$monthAbbrev">12</xsl:when>
            
        </xsl:choose>
    </xsl:function>
</xsl:stylesheet>