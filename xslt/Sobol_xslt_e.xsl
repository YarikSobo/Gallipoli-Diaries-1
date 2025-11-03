<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">

    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
    
    <xsl:variable name="gallipoli" select="document('../xml/gallipoli_all_chapters.xml')"/>
    
    <xsl:template match="$gallipoli">
        <xsl:result-document method="xhtml" indent="yes" href="../docs/Sobol_E_Output.html">
            <html>
                <head><title>Names and Terms in Gallipoli Diaries</title>
               <link rel="stylesheet" type="text/css" href="../docs/Sobol_css_e.css"/>
                </head>
                <body>
                      <!--Tables-->
                    <h1>Names and Terms in Gallipoli Diaries</h1>
                    <h2>Names Table</h2>
                    <table border="1">
                        <!--Table of personal names-->
                        <tr><td><h3>Name</h3></td><td><h3>Mention Frequency</h3></td></tr>
                        <xsl:for-each-group select="//person" group-by="@name">
                            <xsl:sort select="count(current-group())" order="descending"/>
                            <tr>
                                <td><xsl:apply-templates/></td>
                                <td><xsl:value-of select="count(current-group())"/></td>
                            </tr>
                        </xsl:for-each-group>
                    </table>
                    <h2>Unit types</h2>
                    <!--table of units involved in the campaign-->
                    <table border="2">
                        <tr><td><h3>Unit Name</h3></td><td><h3>Unit Type</h3></td><td><h3>Mention Frequency</h3></td></tr>
                        <xsl:for-each-group select="//unit" group-by="@type">
                            <xsl:sort select="count(current-group())" order="descending"/>
                            <tr>
                                <td><xsl:apply-templates/></td>
                                <td><xsl:apply-templates select=".//@type"/></td>
                                <td><xsl:value-of select="count(current-group())"/></td>
                            </tr>
                        </xsl:for-each-group>
                    </table>
                    <h2>Ship Names</h2>
                    <!--table of ships innvolved in the campaign-->
                    <table border="2">
                        <tr><td><h3>Ship Name</h3></td><td><h3>Mention Frequency</h3></td></tr>
                        <xsl:for-each-group select="//location" group-by="@ship">
                            <xsl:sort select="count(current-group())" order="descending"/>
                            <tr>
                                <td><xsl:apply-templates/></td>
                                <td><xsl:value-of select="count(current-group())"/></td>
                            </tr>
                        </xsl:for-each-group>
                    </table>
                    <xsl:for-each select="//title">
                        <h1><xsl:apply-templates/></h1>
                    </xsl:for-each>
                    <xsl:for-each select="//chapter">
                        <ol><xsl:apply-templates/></ol>
                    </xsl:for-each>                    
                    <xsl:for-each select=".//p">
                        <p><xsl:apply-templates/></p>
                    </xsl:for-each>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
                <!--template for person, unit and location tags-->
    <xsl:template match="person">
        <span class="person">
            <xsl:apply-templates/> 
        </span>
    </xsl:template>
    <xsl:template match="unit">
        <span class="unit">
            <xsl:apply-templates/> 
        </span>
    </xsl:template>
    <xsl:template match="location">
        <span class="location">
            <xsl:apply-templates/> 
        </span>
    </xsl:template>

</xsl:stylesheet>