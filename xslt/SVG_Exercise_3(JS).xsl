<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:result-document href="SVG_Exercise_3(JS).html" method="html" indent="yes">
            <html>
                <head>
                    <title>Ship Mentions Bar Chart</title>
                    <style>
                        /* Scrollable container */
                        #svg-container {
                        width: 900px;       
                        height: 500px;      
                        overflow: auto;     /* horizontal + vertical scrollbars */
                        border: 1px solid #ccc;
                        }
                        svg text {
                        font-family: sans-serif;
                        }
                    </style>
                </head>
                <body>
                    <h2>Ship Mentions Bar Chart</h2>
                    <div id="svg-container">
                        <!-- Wider SVG for more scroll room -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="6700" height="500">
                            
                            <!-- Group all ship mentions with normalized names -->
                            <xsl:variable name="groups" as="element()*">
                                <xsl:for-each-group select="//location[@ship]" group-by="
                                    normalize-space(translate(@ship,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ'))
                                    ">
                                    <ship name="{current-grouping-key()}" count="{count(current-group())}"/>
                                </xsl:for-each-group>
                            </xsl:variable>
                            
                            <!-- Maximum count for scaling -->
                            <xsl:variable name="max" select="max($groups/@count)" />
                            
                            <!-- Axes -->
                            <line x1="50" y1="450" x2="7950" y2="450" stroke="black" stroke-width="2"/> <!-- X-axis -->
                            <line x1="50" y1="450" x2="50" y2="50" stroke="black" stroke-width="2"/>    <!-- Y-axis -->
                            
                            <!-- Axis labels -->
                            <text x="4000" y="490" text-anchor="middle" font-size="16">Ship Name</text>
                            <text x="15" y="250" text-anchor="middle" font-size="16" transform="rotate(-90,15,250)">Mentions</text>
                            
                            <!-- Bars: sorted descending by count -->
                            <xsl:for-each select="$groups">
                                <xsl:sort select="@count" data-type="number" order="descending"/>
                                <xsl:variable name="index" select="position()" />
                                <xsl:variable name="barHeight" select="(@count div $max) * 350" />
                                <xsl:variable name="x" select="50 + (($index - 1) * 220) + 10" /> <!-- More spacing -->
                                <xsl:variable name="y" select="450 - $barHeight" />
                                
                                <!-- Draw bar -->
                                <rect x="{$x}" y="{$y}" width="100" height="{$barHeight}" fill="steelblue" stroke="black" stroke-width="1"/>
                                
                                <!-- Ship name -->
                                <text x="{$x + 50}" y="470" text-anchor="middle" font-size="12">
                                    <xsl:value-of select="@name"/>
                                </text>
                                
                                <!-- Count above bar -->
                                <text x="{$x + 50}" y="{$y - 5}" text-anchor="middle" font-size="12">
                                    <xsl:value-of select="@count"/>
                                </text>
                            </xsl:for-each>
                            
                        </svg>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>