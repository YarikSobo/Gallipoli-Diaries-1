<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="gal_text" select="document('../xml/gallipoli_all_chapters.xml')"/>
    <xsl:variable name="xspacer" select="15"/>
    <xsl:variable name="yspacer" select="20"/>
    
    <xsl:template match="$gal_text">
        <xsl:result-document method="xhtml" indent="yes" href="Charles-countrygraph.html">
            <html>
                <head><title>countrys in Gallipoli Diaries in all chapters</title></head>
                <body>
                    <h1>countrys in the Gallipoli Diaries</h1>
                    <svg viewBox="0 0 2100 550">
                        <g transform="translate(400,10)">
                            <xsl:for-each-group select="//p//location" group-by="@country">
                                
                                <xsl:sort select="count(current-group())" order="descending"/>
                                <xsl:variable name="country-occurrence-count" select="count(current-group())"/>
                                <xsl:variable name="country-sequence" select="position()"/>
                                
                                <line x1="0" x2="{$xspacer * $country-occurrence-count}" 
                                    y1="{$yspacer * $country-sequence}" y2="{$yspacer * $country-sequence}"
                                    stroke-width="10" stroke="cyan"/>
                                
                                <text x="-10" y="{$yspacer * $country-sequence + 5}" text-anchor="end">
                                    <xsl:value-of select="$country-sequence"/><xsl:text>: </xsl:text>
                                    <xsl:apply-templates select="string()[1]"/></text>
                                
                                <text x="{$xspacer * $country-occurrence-count + 20}" y="{$yspacer * $country-sequence + 5}" text-anchor="right">
                                    <xsl:value-of select="$country-occurrence-count"/></text>
                                
                            </xsl:for-each-group>
                            
                            <line x1="0" y1="0" x2="0" y2="550" stroke="#000000" stroke-width="5"/>
                            <line x1="0" y1="0" x2="1740" y2="0" stroke="#000000" stroke-width="5"/>
                            <circle cx="0" cy="0" r="2.5" fill="#000000"/>
                            
                            <line x1="0" x2="1650" y1="20" y2="20" stroke-width="10" stroke="cyan"></line> <!-- England -->
                            <line x1="0" x2="1350" y1="40" y2="40" stroke-width="10" stroke="cyan"></line><!-- France -->
                            <line x1="0" x2="1290" y1="60" y2="60" stroke-width="10" stroke="cyan"></line><!-- Egypt -->
                            <line x1="0" x2="915" y1="80" y2="80" stroke-width="10" stroke="cyan"></line><!-- Australia -->
                            <line x1="0" x2="765" y1="100" y2="100" stroke-width="10" stroke="cyan"></line><!-- Turkey -->
                            <line x1="0" x2="405" y1="120" y2="120" stroke-width="10" stroke="cyan"></line><!-- India -->
                            <line x1="0" x2="240" y1="140" y2="140" stroke-width="10" stroke="cyan"></line><!-- Bulgaria -->
                            <line x1="0" x2="225" y1="160" y2="160" stroke-width="10" stroke="cyan"></line><!-- New Zealand -->
                            <line x1="0" x2="120" y1="180" y2="180" stroke-width="10" stroke="cyan"></line><!-- South Africa -->
                            <line x1="0" x2="90" y1="200" y2="200" stroke-width="10" stroke="cyan"></line><!-- Russia -->
                            <line x1="0" x2="90" y1="220" y2="220" stroke-width="10" stroke="cyan"></line><!-- Serbia -->
                            <line x1="0" x2="75" y1="240" y2="240" stroke-width="10" stroke="cyan"></line><!-- Greece -->
                            <line x1="0" x2="75" y1="260" y2="260" stroke-width="10" stroke="cyan"></line><!-- South Africa -->
                            <line x1="0" x2="60" y1="280" y2="280" stroke-width="10" stroke="cyan"></line><!-- German Empire -->
                            <line x1="0" x2="60" y1="300" y2="300" stroke-width="10" stroke="cyan"></line><!-- Irish -->
                            <line x1="0" x2="45" y1="320" y2="320" stroke-width="10" stroke="cyan"></line><!-- Malta -->
                            <line x1="0" x2="30" y1="340" y2="340" stroke-width="10" stroke="cyan"></line><!-- Afghanistan -->
                            <line x1="0" x2="30" y1="360" y2="360" stroke-width="10" stroke="cyan"></line><!-- Roumania -->
                            <line x1="0" x2="30" y1="380" y2="380" stroke-width="10" stroke="cyan"></line><!-- Italy -->
                            <line x1="0" x2="30" y1="400" y2="400" stroke-width="10" stroke="cyan"></line><!-- Japan -->
                            <line x1="0" x2="15" y1="420" y2="420" stroke-width="10" stroke="cyan"></line><!-- Tunis -->
                            <line x1="0" x2="15" y1="440" y2="440" stroke-width="10" stroke="cyan"></line><!-- Russia -->
                            <line x1="0" x2="15" y1="460" y2="460" stroke-width="10" stroke="cyan"></line><!-- Poland -->
                            <line x1="0" x2="15" y1="480" y2="480" stroke-width="10" stroke="cyan"></line><!-- Austrian -->
                            <line x1="0" x2="15" y1="500" y2="500" stroke-width="10" stroke="cyan"></line><!-- Senegalese -->
                            <line x1="0" x2="15" y1="520" y2="520" stroke-width="10" stroke="cyan"></line><!-- Irish -->
                            
                            <line x1="0" y1="0" x2="0" y2="550" stroke="#000000" stroke-width="5"/>
                        </g>
                    </svg>
                    <p>The graph above shows the frequency that each country was mentioned</p>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>