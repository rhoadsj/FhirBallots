<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:jrfn="http://www.johnrhoads.net/jrfn"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:function name="jrfn:MonthAbbrevToNumber" as="xs:string">
        <xsl:param as="xs:string" name="monthAbbrev" />
        <xsl:choose>
            <xsl:when test="'Jan'=$monthAbbrev">01</xsl:when>
            <xsl:when test="'Feb'=$monthAbbrev">02</xsl:when>
            <xsl:when test="'Mar'=$monthAbbrev">03</xsl:when>
            <xsl:when test="'Apr'=$monthAbbrev">04</xsl:when>
            <xsl:when test="'May'=$monthAbbrev">05</xsl:when>
            <xsl:when test="'Jun'=$monthAbbrev">06</xsl:when>
            <xsl:when test="'Jul'=$monthAbbrev">07</xsl:when>
            <xsl:when test="'Aug'=$monthAbbrev">08</xsl:when>
            <xsl:when test="'Sep'=$monthAbbrev">09</xsl:when>
            <xsl:when test="'Oct'=$monthAbbrev">10</xsl:when>
            <xsl:when test="'Nov'=$monthAbbrev">11</xsl:when>
            <xsl:when test="'Dec'=$monthAbbrev">12</xsl:when>
            
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="jrfn:iso-ize-date">
        <xsl:param name="abbrevDate" as="xs:string"></xsl:param>
        <xsl:variable name="dateString" select="tokenize($abbrevDate,'\s')" 
            as="xs:string*"/>
        <xsl:variable name="resDate"
            select="xs:date(concat($dateString[3],
            '-',jrfn:MonthAbbrevToNumber($dateString[1]),
            '-',$dateString[2]))" as="xs:date" /> 
        
        <xsl:value-of select="$resDate" />
        
    </xsl:function>
    
    <xsl:template match="/trackerItems">
        <xsl:for-each select="item">
            <xsl:sort select="xs:date(jrfn:iso-ize-date(@resolutionDate))"/>
            <xsl:value-of select="xs:date(jrfn:iso-ize-date(@resolutionDate))"/>
   
            <xsl:text>"&#x09;"</xsl:text>
            <xsl:value-of  select="@number"/>
 
            <xsl:text>"&#x09;"</xsl:text>
            <xsl:value-of select="@summary"/>
            
            <xsl:text>"&#x09;"</xsl:text>
            <xsl:value-of select="@moverSeconderFor-Against-Abstain"/>
            
            <xsl:text>"&#x0A;"</xsl:text>
            
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>