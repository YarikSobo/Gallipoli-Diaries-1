<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:variable name="gallipoli" select="document('../xml/gallipoli_all_chapters.xml')"/>
   
    <xsl:template match="/">
     <html>
     <head><title>Countries in the Gallipoli Diaries</title></head>
     <body>
      <!--Table of Countries mentioned and how many times each country appears-->
     <h1>Countries Mentioned in the Gallipoli Diaries</h1>
     <h2>Table of Countries</h2>
     <table border="1">
     <tr><td><h3>Country</h3></td><td>Frequency</td></tr>
         <xsl:for-each-group select="//location" group-by="@country"> <!--Selects each country in the markup that was tagged with the "location" tag-->
             <xsl:sort select="count(current-group())" order="descending"/> <!--Counts the number of times the countries are mentioned and lists them in descending order of quantity-->
             <tr>
                 <td><xsl:apply-templates/></td>
                 <td><xsl:value-of select="count(current-group())"/></td>
             </tr>
         </xsl:for-each-group>   
      <!--Table of Cities mentioned and how many times each city appears in the markup-->
     </table>
         <h1>Cities Mentioned in the Gallipoli Diaries</h1>
         <h2>Table of Cities</h2>
         <table border="1"> <!--Creates a border visible for the tables-->
             <tr><td><h3>City</h3></td><td>Frequency</td></tr>
             <xsl:for-each-group select="//location" group-by="@city"> 
                 <xsl:sort select="count(current-group())" order="descending"/>
                 <tr>
                     <td><xsl:apply-templates/></td>
                     <td><xsl:value-of select="count(current-group())"/></td>
                 </tr>
             </xsl:for-each-group>    
         </table>
     </body>    
     </html>   
    </xsl:template>
   
</xsl:stylesheet>