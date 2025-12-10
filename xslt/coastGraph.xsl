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
    <xsl:variable name="xspacer" select="8.5"/>
    <xsl:variable name="yspacer" select="30"/>
    <!-- KYW: global variables-->
    
    <xsl:template match="$gal_text">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/coastGraph.html">
            <html>
                <head><title>Gallipoli Diaries Coastal Objects Gallipoli</title>
                    <link type="text/css" href="style.css" rel="stylesheet" />
                    <link type="text/css" href="dropdown_menu.css" rel="stylesheet" />
                </head>
                <body>
                    <h1 style="text-align:center">Glimpses of Gallipoli: The Hamilton Diaries</h1>    
                    <hr/>
                    <nav>
                        <div><a href="index.html">Home</a></div>   
                        <div><a href="about.html">Project Info</a></div>
                        <div><a href="Summary.html">Context</a></div>
                        <div><a href="KYW_gal_fullText-output.html">Full Text</a></div>
                        <div class="dropdown"><a href="#">Graphs and Data</a>
                            <div class="dropdown-content">
                                <a href="KitchenerGraphPage.html">Kitchener Mentions</a>
                                <a href="personGraph.html">Characters</a>
                                <a href="coastGraph.html">Coastlines</a>
                                <a href="unitGraph.html">Units</a>
                                <a href="countryGraph.html">Countries</a>
                                <a href="shipGraph.html">Ships</a>
                            </div>
                        </div>
                    </nav>
                    <hr/>  
                    <h1>Coastal Locations in the Gallipoli Diaries, by frequency</h1>
                    <svg viewBox="0 0 {$xspacer * 265} {$yspacer * 13}">
                        <g transform="translate(400,10)">
                            <xsl:for-each-group select="//p//location" group-by="@coast">
                                
                                <xsl:sort select="count(current-group())" order="descending"/>
                                <xsl:variable name="coast-occurrence-count" select="count(current-group())"/>
                                <xsl:variable name="coast-sequence" select="position()"/>
                                
                                <line x1="0" x2="{$xspacer * $coast-occurrence-count}" 
                                    y1="{$yspacer * $coast-sequence}" y2="{$yspacer * $coast-sequence}"
                                    stroke-width="15" stroke="#B7D49B"/>
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
                                
                                <line x1="{$xspacer * 60}" x2="{$xspacer * 60}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 70}" x2="{$xspacer * 70}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 80}" x2="{$xspacer * 80}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 90}" x2="{$xspacer * 90}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 100}" x2="{$xspacer * 100}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 110}" x2="{$xspacer * 110}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 120}" x2="{$xspacer * 120}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 130}" x2="{$xspacer * 130}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 140}" x2="{$xspacer * 140}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 150}" x2="{$xspacer * 150}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 160}" x2="{$xspacer * 160}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 170}" x2="{$xspacer * 170}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 180}" x2="{$xspacer * 180}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 190}" x2="{$xspacer * 190}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 200}" x2="{$xspacer * 200}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 210}" x2="{$xspacer * 210}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 220}" x2="{$xspacer * 220}" 
                                    y1="0" y2="500"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                <!-- KYW: vertical reference lines-->
                                
                                <text font-size="24" font-weight="bold" x="-10" y="{$yspacer * $coast-sequence + 5}" text-anchor="end">
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
                    <div class="graphtxt"><h3>Summary:</h3><p>This graph takes the location elements that have an attribute value of 'coast' and
                            plots them by frequency throughout the entire Gallipoli Diaries. The coasts were important during the Gallipoli Campaign especially for the Allied forces for troop landings, ship movements, and geography for attack plans for the naval forces.</p></div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>