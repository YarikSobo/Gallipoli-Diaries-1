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
        <xsl:result-document method="xhtml" indent="yes" href="../docs/unitGraph.html">
            <html>
                <head><title>Gallipoli Diaries Unit Names</title>
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
                    
                    <h1>Units in the Gallipoli Diaries, by frequency</h1>
                    <svg viewBox="0 0 2400 620">
                        <g transform="translate(475,10)">
                            <xsl:for-each-group select="//p//unit" group-by="@unitName">
                                
                                <xsl:sort select="count(current-group())" order="descending"/>
                                <xsl:variable name="unit-occurrence-count" select="count(current-group())"/>
                                <xsl:variable name="unit-sequence" select="position()"/>
                                
                                <line x1="0" x2="{$xspacer * $unit-occurrence-count}" 
                                    y1="{$yspacer * $unit-sequence}" y2="{$yspacer * $unit-sequence}"
                                    stroke-width="10" stroke="#B7D49B"/>
                                <!-- KYW: horizontal bars for entries -->
                                
                                <line x1="{$xspacer * 10}" x2="{$xspacer * 10}" 
                                    y1="0" y2="800"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 20}" x2="{$xspacer * 20}" 
                                    y1="0" y2="800"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 30}" x2="{$xspacer * 30}" 
                                    y1="0" y2="800"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 40}" x2="{$xspacer * 40}" 
                                    y1="0" y2="800"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 50}" x2="{$xspacer * 50}" 
                                    y1="0" y2="800"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 60}" x2="{$xspacer * 60}" 
                                    y1="0" y2="800"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 70}" x2="{$xspacer * 70}" 
                                    y1="0" y2="800"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 80}" x2="{$xspacer * 80}" 
                                    y1="0" y2="800"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                
                                <line x1="{$xspacer * 90}" x2="{$xspacer * 90}" 
                                    y1="0" y2="800"
                                    stroke-width="10" stroke="#000000" stroke-dasharray="0 5 0" stroke-opacity="0.5%"/>
                                <!-- KYW: vertical reference lines-->
                                
                                <text font-size="24" font-weight="bold" x="-10" y="{$yspacer * $unit-sequence + 5}" text-anchor="end">
                                    <xsl:value-of select="$unit-sequence"/><xsl:text>: </xsl:text>
                                    <xsl:apply-templates select=".//@unitName"/></text>
                                <!-- KYW: labels bars with index number and unit name -->
                                
                                <text font-weight="bold" font-size="25" x="{$xspacer * $unit-occurrence-count + 20}" y="{$yspacer * $unit-sequence + 5}" text-anchor="right">
                                    <xsl:value-of select="$unit-occurrence-count"/></text>
                                <!--KYW: units count at right end of bars -->
                                
                            </xsl:for-each-group>
                            
                            <line x1="0" y1="0" x2="0" y2="800" stroke="#000000" stroke-width="5"/>
                            <line x1="0" y1="0" x2="{$xspacer * 95}" y2="0" stroke="#000000" stroke-width="5"/>
                            <circle cx="0" cy="0" r="2.5" fill="#000000"/>
                            <!-- KYW: draws reference lines, addresses 'notching' with circle  -->
                            
                        </g>
                    </svg>
                    <div class="graphtxt"><h2>Summary:</h2>
                        <p>This graph takes the location elements that have an attribute value of 'unit' and
                            plots them by frequency throughout the entire Gallipoli Diaries.</p>
                        <h3>29th Division</h3>
                        <p>29th Division was a British infantry division formed from various colonial units of British army, specifically for the Gallipoli landing operation. 
                            During Gallipoli campaign it was under the command of Major-General Aylmer Hunter-Weston, and was responsible for the original landing at Cape Helles were they came under heavy fire and suffered a lot of casualties. 
                            For courage and effort of its soldiers, the Division got nicknamed "Incomparible Division" </p>
                        
                        <h3>Royal Naval Division</h3>
                        <p>This Division was originally formed as the Royal Naval Division at the outbreak of the war, from Royal Navy and Royal Marine reservists and volunteers,who were not needed for service at sea. 
                            The division fought at Antwerp in 1914 and later at Gallipoli in 1915. It took part in the initial landings and diversionary attacks at Cape Helles and latter served as a support during the push at Suvla Bay.</p>
                        
                        <h3>54th Division</h3>
                        <p>The 54th (East Anglian) Infantry Division  was an infantry division of the British Army that was raised in 1908 following the creation of the Territorial Force.
                            In 1915 it was sent into Mediterranean and took part in the battle of Suvla Bay and following offensive in August 1915   </p>
                        
                        
                        <h3>53rd Division</h3>
                        <p>The 53rd (Welsh) Infantry Division was an infantry division of the British Army that was originally raised in 1908 as the part of the Territorial Force (TF)
                            Later it was transformed into a proper Army unit and saw service during Gallipoli campaign.
                            During Gallipoli it took part in the amphibious invasion at Suvla Bay and took severe casultaies with only 15% of its personel remaining after the end of the campaign.</p>
                        
                        <h3>11th Division</h3>
                        <p>The 11th (Northern) Division, was an infantry division of the British Army formed at the outbreak of the First World War as a part of Lord Kithcener's "New Army" of volunteers. 
                            During Gallipoli it served under the command of Lieutenant-General Edward Fanshawe and took part in action at Suvla Bay where it suffered heavy casualties, with some brigades of the division even losing most of its officers.</p> 
                        
                        <h3>13th Division</h3>
                        <p>The 13th (Western) Division, was another British infantry division that was formed as a part of Lord Kithcener's "New Army".
                            Like many other "New Army" Divisions it was sent into Medditerenian and took part in the initial landing at Anzac Cove.
                            In the few months of the campaign it suffered heavy casualties but still took part in action during the landing at Suvla Bay.
                            Due to its service record it was considered one of the best British military units at Gallipoli.</p>
                        
                        <h3>10th Division</h3>
                        <p>The 10th (Irish) Division, was a British infantry division formed in 1914 as a part of Kitchener's "New Army" and mostly consisted of Irish volunteers.
                            In 1915 it was sent to Gallipoli and took part at landing in Suvla Bay. Additionally some battalions from the Division were sent to Anzac Cove and played a support role in action at Chunuc Bair.</p></div> 
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>