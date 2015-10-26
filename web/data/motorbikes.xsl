<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : motorbikes.xsl
    Created on : 22 November 2014, 14:07
    Author     : Graham Murray
    Description:
        Output goes to motorbikes.jsp.
-->

<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:b="http://www.WebDev.nci/tutorial">
    <xsl:output method="html" indent="yes"/>

    
    <xsl:template match="b:vehicles">
        <link type="text/css" rel="stylesheet" href="css/layout.css"/>
        <div id="vec">
            <xsl:for-each select="b:vehicle">
                <xsl:element name="a">  
                    <a id="vehicleAnchor"> 
                        <xsl:attribute name="href">bikeArticle?title=<xsl:value-of select="./parameter"/></xsl:attribute>   
                   
                        <div id="container">
                    
                            <div id="vehicleImageDiv">
                                <img id="vehicleImage">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="./b:image"/>
                                    </xsl:attribute>
                                </img>

                                <p id="title">
                                    <xsl:value-of select="./b:details/b:name"/>
                                </p>
                            </div>
                    
                        </div>
                    </a>
                </xsl:element>
            </xsl:for-each>
        </div>
    </xsl:template>



</xsl:transform>

