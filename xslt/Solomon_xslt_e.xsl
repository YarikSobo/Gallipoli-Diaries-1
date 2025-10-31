<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0"
    exclude-result-prefixes="#all">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    
    <!-- Root template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>All Ship Names</title>
                <link rel="stylesheet" type="text/css" href="Solomon_css_e.css"/>
                <style>
                    body {
                    font-family: Georgia, serif;
                    margin: 2em;
                    }
                    .ship {
                    background-color: #fff3cd;
                    font-weight: bold;
                    color: #b45309;
                    padding: 2px 5px;
                    border-radius: 4px;
                    }
                </style>
            </head>
            <body>
                <h1>All Ship Names Highlighted</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template for everything else -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Template for ship locations -->
    <xsl:template match="location[@ship]">
        <span class="ship">
            <xsl:value-of select="@ship"/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>