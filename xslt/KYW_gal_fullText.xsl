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
        <xsl:result-document method="xhtml" indent="yes" href="KYW_gal_fullText-output.html">
            <html>
                <head>
                    <title>Gallipoli Full Text</title>
                    <link type="text/css" href="style.css" rel="stylesheet" />
                    <link type="text/css" href="dropdown_menu.css" rel="stylesheet" />
                </head>
                
                <body>
                    <h1 style="text-align:center">Gallipoli Diaries Full-Text Volume I</h1>
                    <hr/>
                    <nav>
                        <div><a href="index-1.html">Home</a></div>   
                        <div><a href="about.html">Project Info</a></div>
                        <div class="dropdown"><a href="#">Full Text</a>
                            <div class="dropdown-content">
                                <a href="full_text_page_I.html">Volume I</a>
                                <a href="full_text_page_II.html">Volume II</a>
                            </div>
                        </div>
                        <div class="dropdown"><a href="#">Graphs and Data</a>
                            <div class="dropdown-content">
                                <a href="KitchenerGraphPage.html">Kitchener Mentions</a>
                                <a href="Character_Graphs.html">Character Count</a>
                            </div>
                        </div>
                    </nav>
                    <hr/>
                    <xsl:for-each select="//chapter">
                        <li><xsl:value-of select="string-join((@n, @heading), '. ')"/></li>
                    </xsl:for-each>
                    
                    <xsl:for-each select="//p">
                        <p><xsl:apply-templates/></p>
                    </xsl:for-each>
                    
                    
                    <xsl:for-each select="//title">
                        <h1 style="text-align:center"><xsl:apply-templates/></h1>
                    </xsl:for-each>
                    
                    
                    
                    
                    
                    
                </body>
            </html>
            
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//p/person">
        <span class="person"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="//p/location[@ship]">
        <span class="ship"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="//p/location[@coast]">
        <span class="coast"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="//p/unit">
        <span class="unit"><xsl:apply-templates/></span>
    </xsl:template>
    
</xsl:stylesheet>