<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="galMarkup" select="document('../xml/KYW_chs13-17.xml')"/>
    <!-- KYW: grabs markup from local github directory -->
    
    <xsl:template match="$galMarkup">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/walker-exercise-e-output.html">
            <html>
            <head>
                <title>Gallipoli Diaries Chapters 13-17</title><link rel="stylesheet" type="text/css" href="exercise-e.css"/>
                <!-- KYW: links to CSS file -->
            </head>
            <body>
               <xsl:for-each select="descendant::p">
               <p><xsl:apply-templates/></p>
                   <!-- KYW: outputs text between <p> tags -->
               </xsl:for-each>
            </body>
        </html>
        </xsl:result-document>
    </xsl:template>
    
   
    <xsl:template match="location">
        <span class="location"><xsl:apply-templates/></span>
    </xsl:template>
    <!-- KYW: applies stylesheet to location spans -->
    
    <xsl:template match="person">
        <xsl:if test="@name='Lord_Kitchener'">
            <span class="kitchener"><xsl:apply-templates/></span>
        </xsl:if>
    </xsl:template>
    <!-- KYW: creates span elements only for person elements that have the attribute value 'Lord_Kitchener'-->
    
</xsl:stylesheet>