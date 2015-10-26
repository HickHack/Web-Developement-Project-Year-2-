<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : home.xsl
    Created on : 22 November 2014, 14:07
    Author     : graham
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:v="http://www.WebDev.nci/tutorial">
    <xsl:output method="html" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <link type="text/css" rel="stylesheet" href="css/layout.css"/>
        <div id="vec">
            <xsl:for-each select="v:vehicles/v:vehicle">
                <xsl:element name="a">  
                    <a id="vehicleAnchor"> 
                        <xsl:attribute name="href">carArticle?title=<xsl:value-of select="./parameter"/></xsl:attribute>   
                   
                        <div id="container">
                    
                            <div id="vehicleImageDiv">
                                <img id="vehicleImage">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="v:image"/>
                                    </xsl:attribute>
                                </img>

                                <p id="title">
                                    <xsl:value-of select="v:details/v:name"/>
                                </p>
                            </div>
                    
                        </div>
                    </a>
                </xsl:element>
            </xsl:for-each>
        </div>
    </xsl:template>

</xsl:stylesheet>