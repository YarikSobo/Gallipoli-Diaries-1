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
                <title>All Names</title>
                <link rel="stylesheet" type="text/css" href="Charles_css_e.css"/>
                <style>
                    body {
                    font-family: Times New Roman;
                    margin: 2em;
                    }
                    .name {
                    background-color: red;
                    font-weight: bold;
                    color: #00FFFF;
                    padding: 2px 5px;
                    border-radius: 4px;
                    }
                </style>
            </head>
            <body>
                <h1>All Highlighted Names</h1>
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
    
    <!-- Template for name locations -->
    <xsl:template match="person[@name]">
        <span class="name">
            <xsl:value-of select="@name"/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>