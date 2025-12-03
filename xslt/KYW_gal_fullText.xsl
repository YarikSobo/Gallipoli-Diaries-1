<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="galText" select="document('../xml/gallipoli_all_chapters.xml')"/>
    
    <xsl:template match="$galText">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/KYW_gal_fullText-output.html">
            <html>
                <head>
                    <title>Gallipoli Full Text</title>
                    <link type="text/css" href="style.css" rel="stylesheet" />
                    <link type="text/css" href="dropdown_menu.css" rel="stylesheet" />
                    <script type="text/javascript" src="gallipoli.js">/**/</script>
                    <!-- KYW: javascript link -->
                </head>
                
                <body>
                    <h1 style="text-align:center">Gallipoli Diaries Full Text</h1>
                    <hr/>
                    <nav>
                        <div><a href="index.html">Home</a></div>   
                        <div><a href="about.html">Project Info</a></div>
                        <div><a href="Summary.html">Context</a></div>
                        <div><a href="KYW_gal_fullText-output.html">Full Text</a></div>
                        <div class="dropdown"><a href="#">Graphs and Data</a>
                            <div class="dropdown-content">
                                <a href="KitchenerGraphPage.html">Kitchener Mentions</a>
                                <a href="personGraph.html">Character Count</a>
                                <a href="coastGraph.html">Coastlines</a>
                                <a href="unitGraph.html">Units</a>
                                <a href="countryGraph.html">Countries</a>
                                <a href="shipGraph.html">Ships</a>
                            </div>
                        </div>
                    </nav>
                    <hr/>
                    <!-- KYW: nav bar copied from other pages -->
                    
                    <fieldset>
                        <legend>Click to Highlight:</legend>
                        <input type="checkbox" id="personToggle"/>
                        <span>Persons</span>
                        <input type="checkbox" id="locationToggle"/>
                        <span>Locations</span>
                        <input type="checkbox" id="unitToggle"/>
                        <span>Units</span>
                    </fieldset>
                    <!-- KYW: clickable buttons -->
                    
                    <h2>Table of Contents:</h2>
                    <ul><xsl:apply-templates select="//chapter" mode="toc"/></ul>
                    <xsl:apply-templates select="//chapter"/>
                    <!-- KYW: creates TOC and outputs text -->
                    
                    <xsl:for-each select="//title">
                        <h1 style="text-align:center"><xsl:apply-templates/></h1>
                    </xsl:for-each>
                    <!-- KYW: puts title at top -->
                    
                </body>
            </html>
            
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="chapter" mode="toc">
        <li><a href="#{@n}"><xsl:value-of select="string-join((@n, @heading), '. ')"/></a></li>
    </xsl:template>
    <!-- KYW: creates entries for table with links -->
    
    <xsl:template match="chapter">
        <h2 id="{@n}">Chapter <xsl:value-of select="@n"/>: <xsl:value-of select="@heading"/> </h2>
        <p><a href="#">Back to top!</a></p>
    <!-- KYW: places return links below heading -->
        <xsl:apply-templates/>
    </xsl:template>
    <!-- KYW: creates headings for chapters, connect to links -->
    
    <xsl:template match="//p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    <!-- KYW: keeps formatting for <p> tags -->
   
    <xsl:template match="//p/person">
        <span class="person"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="//p/location">
        <span class="location"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="//p/unit">
        <span class="unit"><xsl:apply-templates/></span>
    </xsl:template>
    <!-- KYW: adds span elements to allow interfacing w/ JS -->
    
</xsl:stylesheet>