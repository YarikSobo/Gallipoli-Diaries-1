<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!-- KYW: adapted from for-each-group solution for SVG E2 -->
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="gal_text" select="document('../xml/gallipoli_all_chapters.xml')"/>
    <xsl:variable name="xspacer" select="30"/>
    <xsl:variable name="yspacer" select="30"/>
    <!-- KYW: global variables-->
    
    <xsl:template match="$gal_text">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/walker-SVG-E3-output.html">
            <html>
                <head><title>Gallipoli Diaries - Chapters 13-17</title> <link rel="stylesheet" type="CSS"></link></head>
                <body>
                    <h1>Towns in the Gallipoli Diaries, by frequency</h1>
                    <svg viewBox="0 0 2250 1850">
                        <g transform="translate(400,10)">
                            <xsl:for-each-group select="//p//location" group-by="@town">
                                
                                <xsl:sort select="count(current-group())" order="descending"/>
                                <xsl:variable name="town-occurrence-count" select="count(current-group())"/>
                                <xsl:variable name="town-sequence" select="position()"/>
                                
                                <line x1="0" x2="{$xspacer * $town-occurrence-count}" 
                                    y1="{$yspacer * $town-sequence}" y2="{$yspacer * $town-sequence}"
                                    stroke-width="10" stroke="red"/>
                                <!-- KYW: horizontal bars for entries -->
                                
                                <text x="-10" y="{$yspacer * $town-sequence + 5}" text-anchor="end">
                                    <xsl:value-of select="$town-sequence"/><xsl:text>: </xsl:text>
                                    <xsl:apply-templates select="string()[1]"/></text>
                                <!-- KYW: labels bars with index number and town name -->
                                
                                <text x="{$xspacer * $town-occurrence-count + 20}" y="{$yspacer * $town-sequence + 5}" text-anchor="right">
                                    <xsl:value-of select="$town-occurrence-count"/></text>
                                <!--KYW: places count at right end of bars -->
                                
                            </xsl:for-each-group>
                            
                            <line x1="0" y1="0" x2="0" y2="1774" stroke="#000000" stroke-width="5"/>
                            <line x1="0" y1="0" x2="1740" y2="0" stroke="#000000" stroke-width="5"/>
                            <circle cx="0" cy="0" r="2.5" fill="#000000"/>
                            <!-- KYW: draws reference lines, addresses  -->
                            
                        </g>
                    </svg>
                    <p>This graph takes the location elements that have an attribute value of 'town' and plots them by frequency throughout the entire Gallipoli Diaries.</p>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>