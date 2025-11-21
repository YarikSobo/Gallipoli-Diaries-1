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
    <xsl:variable name="xspacer" select="15"/>
    <xsl:variable name="yspacer" select="30"/>
    <!-- KYW: global variables-->
    
    <xsl:template match="$gal_text">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/coastGraph.html">
            <html>
                <head><title>Gallipoli Diaries Coastal Objects Gallipoli</title></head>
                <body>
                    <h1>Coastal Locations in the Gallipoli Diaries, by frequency</h1>
                    <svg viewBox="0 0 3500 650">
                        <g transform="translate(475,10)">
                            <xsl:for-each-group select="//p//location" group-by="@coast">
                                
                                <xsl:sort select="count(current-group())" order="descending"/>
                                <xsl:variable name="coast-occurrence-count" select="count(current-group())"/>
                                <xsl:variable name="coast-sequence" select="position()"/>
                                
                                <line x1="0" x2="{$xspacer * $coast-occurrence-count}" 
                                    y1="{$yspacer * $coast-sequence}" y2="{$yspacer * $coast-sequence}"
                                    stroke-width="10" stroke="#B7D49B"/>
                                <!-- KYW: horizontal bars for entries -->
                                
                                <line x1="{$xspacer * 10}" x2="{$xspacer * 10}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 20}" x2="{$xspacer * 20}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 30}" x2="{$xspacer * 30}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 40}" x2="{$xspacer * 40}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 50}" x2="{$xspacer * 50}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                <!-- KYW: vertical reference lines-->
                                
                                <text font-size="20" font-weight="bold" x="-10" y="{$yspacer * $coast-sequence + 5}" text-anchor="end">
                                    <xsl:value-of select="$coast-sequence"/><xsl:text>: </xsl:text>
                                    <xsl:apply-templates select=".//@coast"/></text>
                                <!-- KYW: labels bars with index number and coast name -->
                                
                                <text font-weight="bold" font-size="25" x="{$xspacer * $coast-occurrence-count + 20}" y="{$yspacer * $coast-sequence + 5}" text-anchor="right">
                                    <xsl:value-of select="$coast-occurrence-count"/></text>
                                <!--KYW: coastal locations count at right end of bars -->
                                
                            </xsl:for-each-group>
                            
                            <line x1="0" y1="0" x2="0" y2="500" stroke="#000000" stroke-width="5"/>
                            <line x1="0" y1="0" x2="3000" y2="0" stroke="#000000" stroke-width="5"/>
                            <circle cx="0" cy="0" r="2.5" fill="#000000"/>
                            <!-- KYW: draws reference lines, addresses 'notching' with circle  -->
                            
                        </g>
                    </svg>
                    <p>This graph takes the location elements that have an attribute value of 'coast' and plots them by frequency throughout the entire Gallipoli Diaries.</p>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>