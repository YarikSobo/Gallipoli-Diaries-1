<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">

    <!-- KYW: adapted from both solutions for SVG E2 -->

    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:variable name="gal_text" select="document('../xml/gallipoli_all_chapters.xml')"/>
    <xsl:variable name="xspacer" select="20"/>
    <xsl:variable name="yspacer" select="30"/>
    <!-- KYW: global variables-->

    <xsl:template match="$gal_text">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/kitchenerGraph.html">
            <html>
                <head>
                    <title>Mentions of Kitchener by Chapter</title>
                </head>
                <body>
                    <h1>Mentions of Kitchener, by Chapter</h1>
                    <svg viewBox="0 0 2400 1000">
                        <g transform="translate(425,50)">
                            <xsl:for-each select="//chapter">

                                <xsl:variable name="kitchener-count"
                                    select=".//person[@name = 'Herbert Kitchener'] => count()"/>
                                <!-- KYW: counts mentions of Kitchener per chapter -->
                                
                                <xsl:variable name="chapNum" select="position()"/>
                                <!-- KYW: gets chapter number for math that follows -->


                                <line x1="0" x2="{$xspacer * $kitchener-count}"
                                    y1="{$yspacer * $chapNum}" y2="{$yspacer * $chapNum}"
                                    stroke-width="10" stroke="#B7D49B"/>
                                <!-- KYW: horizontal bars for entries -->


                                <text font-size="20" font-weight="bold" x="-10"
                                    y="{$yspacer * $chapNum + 5}" text-anchor="end">
                                    Chapter <xsl:value-of select="$chapNum"/>:
                                </text>
                                <!-- KYW: labels bars with chapter number -->

                                <text font-weight="bold" font-size="25"
                                    x="{$xspacer * $kitchener-count + 20}"
                                    y="{$yspacer * $chapNum + 6}" text-anchor="right">
                                    <xsl:value-of select="$kitchener-count"/>
                                </text>
                                <!--KYW: places count at right end of bars -->

                            </xsl:for-each>

                            <line x1="{$xspacer * 10}" x2="{$xspacer * 10}" y1="0" y2="800"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0"
                                stroke-opacity="15%"/>

                            <line x1="{$xspacer * 20}" x2="{$xspacer * 20}" y1="0" y2="800"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0"
                                stroke-opacity="15%"/>

                            <line x1="{$xspacer * 30}" x2="{$xspacer * 30}" y1="0" y2="800"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0"
                                stroke-opacity="15%"/>

                            <line x1="{$xspacer * 40}" x2="{$xspacer * 40}" y1="0" y2="800"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0"
                                stroke-opacity="15%"/>

                            <line x1="{$xspacer * 50}" x2="{$xspacer * 50}" y1="0" y2="800"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0"
                                stroke-opacity="15%"/>

                            <line x1="{$xspacer * 60}" x2="{$xspacer * 60}" y1="0" y2="800"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0"
                                stroke-opacity="15%"/>

                            <line x1="{$xspacer * 70}" x2="{$xspacer * 70}" y1="0" y2="800"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0"
                                stroke-opacity="15%"/>

                            <line x1="{$xspacer * 80}" x2="{$xspacer * 80}" y1="0" y2="800"
                                stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0"
                                stroke-opacity="15%"/>
                            <!-- KYW: vertical reference lines-->

                            <line x1="0" y1="0" x2="0" y2="800" stroke="#000000" stroke-width="5"/>
                            <line x1="0" y1="0" x2="1740" y2="0" stroke="#000000" stroke-width="5"/>
                            <circle cx="0" cy="0" r="2.5" fill="#000000"/>
                            <!-- KYW: draws reference lines, addresses 'notching' with circle  -->

                        </g>
                    </svg>
                    <p>This graph shows the frequency with which Kitchener is mentioned, by
                        chapter.</p>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
