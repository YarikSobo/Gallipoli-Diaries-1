<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="gal_text" select="document('../xml/gallipoli_all_chapters.xml')"/>
    <xsl:variable name="xspacer" select="30"/>
    <xsl:variable name="yspacer" select="30"/>
    
    <xsl:template match="$gal_text">
        <xsl:result-document method="xhtml" indent="yes" href="Charles-SVG-E3-output.html">
            <html>
                <head><title>Ships in Gallipoli Diaries in all chapters</title></head>
                <body>
                    <h1>ships in the Gallipoli Diaries</h1>
                    <svg viewBox="0 0 2250 1850">
                        <g transform="translate(400,10)">
                            <xsl:for-each-group select="//p//location" group-by="@ship">
                                
                                <xsl:sort select="count(current-group())" order="descending"/>
                                <xsl:variable name="ship-occurrence-count" select="count(current-group())"/>
                                <xsl:variable name="ship-sequence" select="position()"/>
                                
                                <line x1="0" x2="{$xspacer * $ship-occurrence-count}" 
                                    y1="{$yspacer * $ship-sequence}" y2="{$yspacer * $ship-sequence}"
                                    stroke-width="10" stroke="##B7D49B"/>
                                
                                <text x="-10" y="{$yspacer * $ship-sequence + 5}" text-anchor="end">
                                    <xsl:value-of select="$ship-sequence"/><xsl:text>: </xsl:text>
                                    <xsl:apply-templates select=".//@ship"/></text>
                                
                                <text x="{$xspacer * $ship-occurrence-count + 20}" y="{$yspacer * $ship-sequence + 5}" text-anchor="right">
                                    <xsl:value-of select="$ship-occurrence-count"/></text>
                                
                            </xsl:for-each-group>
                            
                            <line x1="0" y1="0" x2="0" y2="1900" stroke="#000000" stroke-width="5"/>
                            <line x1="0" y1="0" x2="1740" y2="0" stroke="#000000" stroke-width="5"/>
                            <circle cx="0" cy="0" r="2.5" fill="#000000"/>
                            
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
                            
                        </g>
                    </svg>
                    <p>The graph above shows the frequency that each ship was mentioned</p>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>