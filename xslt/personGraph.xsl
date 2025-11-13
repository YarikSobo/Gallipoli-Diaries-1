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
    <xsl:variable name="xspacer" select="10"/>
    <xsl:variable name="yspacer" select="25"/>
    <!-- KYW: global variables-->
    
    <xsl:template match="$gal_text">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/personGraph.html">
            <html>
                <head><title>Persons in the Gallipoli Diaries, by frequency (excl. Kitchener)</title></head>
                <body>
                    <h1>Persons in the Gallipoli Diaries, by frequency (excl. Kitchener)</h1>
                    <svg viewBox="0 0 2000 2000">
                        <g transform="translate(475,10)">
                            <xsl:for-each-group select="//p//person" group-by="@name">
                                
                                <xsl:sort select="count(current-group())" order="descending"/>
                                <xsl:variable name="person-count" select="count(current-group())"/>
                                <xsl:variable name="person-sequence" select="position()"/>
                                
                                   <xsl:if test="(count(current-group())) >= 5 and (count(current-group())) &lt;=200">
                                   <line x1="0" x2="{$xspacer * $person-count}" 
                                    y1="{$yspacer * $person-sequence}" y2="{$yspacer * $person-sequence}"
                                    stroke-width="10" stroke="#B7D49B" />
                                   <!-- KYW: horizontal bars for entries -->
                               
                                   <text font-size="20" font-weight="bold" x="-10" y="{$yspacer * $person-sequence + 5}" text-anchor="end">
                                       <xsl:apply-templates select="string()[1]"/></text>
                                   <!-- KYW: labels bars with index number and town name -->
                                   
                                   <text font-weight="bold" font-size="25" x="{$xspacer * $person-count + 20}" y="{$yspacer * $person-sequence + 5}" text-anchor="right">
                                       <xsl:value-of select="$person-count"/></text>
                                   <!--KYW: places count at right end of bars -->
                               </xsl:if>
                               
                                
                            </xsl:for-each-group>
                            
                            <line x1="0" y1="0" x2="0" y2="1900" stroke="#000000" stroke-width="5"/>
                            <line x1="0" y1="0" x2="1740" y2="0" stroke="#000000" stroke-width="5"/>
                            <circle cx="0" cy="0" r="2.5" fill="#000000"/>
                            <!-- KYW: draws axis lines, addresses 'notching' with circle  -->
                            
                            <line x1="{$xspacer * 10}" x2="{$xspacer * 10}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 20}" x2="{$xspacer * 20}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 30}" x2="{$xspacer * 30}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 40}" x2="{$xspacer * 40}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 50}" x2="{$xspacer * 50}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 60}" x2="{$xspacer * 60}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 70}" x2="{$xspacer * 70}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 80}" x2="{$xspacer * 80}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 90}" x2="{$xspacer * 90}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 100}" x2="{$xspacer * 100}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 110}" x2="{$xspacer * 110}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 120}" x2="{$xspacer * 120}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 130}" x2="{$xspacer * 130}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            
                            <line x1="{$xspacer * 140}" x2="{$xspacer * 140}" 
                                y1="0" y2="1890"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="15%"/>
                            <!-- KYW: vertical reference lines-->
                            
                        </g>
                    </svg>
                    <p>This graph shows the persons mentioned 5 or more times, excluding Kitchener, throughout the entire Gallipoli Diaries.</p>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>