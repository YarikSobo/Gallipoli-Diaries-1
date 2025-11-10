<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
version="3.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
<xsl:output method="html" indent="yes"/>
 <!--Never wrapped SVG's into HTML, so hopefully this works-->
 <xsl:template match="/">
 <xsl:result-document href="MF_SVG_Exercise_3.html" method="html" indent="yes">
 <html>
   <head>
      <title>Ian Hamilton Chart</title>
                    
      <body>
      <h2>Number of times Sir Ian Hamilton is Mentioned Each Chapter</h2>
       <p>This is a simple graph displaying the number of times Sir Ian Hamitlon is mentioned in each chapter that was marked up of his journal.</p>
       <svg viewBox="0 0 1500 550">
       <g transform="translate(100,50)">
       <xsl:variable name="xspacer" select="35"/>
       <xsl:variable name="yspacer" select="19"/>
            
           <xsl:for-each select=".//chapter">
               <xsl:variable name="pers-count" select=".//person[@name='Ian Hamilton']=>count()"/>
               <xsl:variable name="entry-number" select="@n"/>
                                
                                
                                
               <line x1="0" x2="{$xspacer * $pers-count}"
               y1="{$yspacer * $entry-number}" y2="{$yspacer * $entry-number}" 
               stroke-width="15" stroke="red"/>
               <text x="-25" y="{$yspacer * $entry-number +5}" text-anchor="right">
                  <xsl:value-of select="$entry-number"/></text>
               <text x="{$xspacer * $pers-count + 15}" y="{$yspacer * $entry-number +4}" 
               text-anchor="right">
               <xsl:value-of select="$pers-count"/></text>
               </xsl:for-each>
         <line x1="0" y1="-8" x2="0" y2="{count(//chapter) * $yspacer}" stroke="black"
         stroke-width="3"/>
           
         <line x1="0" y1="436" x2="1000" y2="436" stroke="black"
               stroke-width="3"/>                    
         <!--This line is mostly for decor as an after-the-fact type of thing-->                   
         <text x="-100" y="220">Chapter #</text>
         <text x="350" y="470"># of times Sir Ian Hamilton Appears</text>
         </g>
         </svg>
                    
    <h2>What you are looking at</h2>
    <p>As stated before, this is a graph depicting each chapter of Sir Ian Hamilton's diary with the number of times he references himself in the diary. A graph like this 
    could be used to show how relevant he, or depending on what tweaks someone makes, any one indivudal is in each chapater of Sir Ian Hamilton's diary is</p>
    </body>
    </head>
                
    </html>
    </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>