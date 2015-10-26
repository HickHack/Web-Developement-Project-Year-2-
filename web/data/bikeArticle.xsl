<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:b="http://www.WebDev.nci/tutorial" version="1.0">
    <xsl:output indent="yes"/>    
   
    <xsl:param name="currentArticle" />
    <xsl:param name="nextArticle" />
    <xsl:param name="prevArticle" />
    
    <xsl:include href="includeHeader.xsl"/>
    
    <xsl:template match="//b:vehicle">
        <xsl:if test="./parameter=$currentArticle">
                
            <style>
                img{
                border-radius:10px;
                border:3px solid black;
                height:300px;
                width:350px;
                box-shadow: -5px -1px 11px 0px rgba(50, 50, 50, 1);
                }
            </style>
            <div id="articleMain">
                <div id="articleParent">
                    <table id="updateImage">
                        <tr>
                            <td class="edit">
                                <xsl:element name="a">
                                    <xsl:attribute name="href">updateBikes?title=<xsl:value-of select="$currentArticle"/>
                                    </xsl:attribute>
                                    <img style="box-shadow:none" class="updateImg" alt="Update" src="images/icons/edit-button-icon.png"/>
                                </xsl:element>
                            </td>
                            <td class="print">
                                <a onClick="window.print()">
                                    <img style="height:50px; width:50px; border:none; box-shadow:none" alt="print" src="images/print.png"/>    
                                </a>
                            </td>
                        </tr>
                    </table>
                           
                    <center>
                        <h1>
                            <xsl:value-of select="./b:details/b:name"/>
                        </h1>
                
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="./b:image"/>
                            </xsl:attribute>
                        </xsl:element>
                        <p id="description"> 
                            <xsl:value-of select="./b:details/b:description"/> 
                        </p>
                                    
                        <p>
                            <b>Specification</b>
                        </p>
                        <table>
                            <tr>
                                <td class="label">Manufacturer</td>
                                <td>
                                    <xsl:value-of select="./b:details/b:manuacturer"/> 
                                </td>
                            </tr>
                            <tr>
                                <td class="label">Engine Size</td>
                                <td>
                                    <xsl:value-of select="./b:specification/b:engineSize"/> 
                                </td>
                            </tr>
                            <tr>
                                <td class="label">Top Speed</td>
                                <td>
                                    <xsl:value-of select="./b:specification/b:topSpeed"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">Horse Power</td>
                                <td>
                                    <xsl:value-of select="./b:specification/b:bhp"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">Zero to Sixty</td>
                                <td>
                                    <xsl:value-of select="./b:specification/b:zero-sixty"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">Cost</td>
                                <td>
                                                &#128;
                                    <xsl:value-of select="./b:specification/b:cost"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">Miles per Gallon</td>
                                <td>
                                    <xsl:value-of select="./b:specification/b:mpg"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">Cylinders</td>
                                <td>
                                    <xsl:value-of select="./b:specification/b:cylinders"/>
                                </td>
                            </tr>
                        </table>
                                   
                        <div class="video">
                            <xsl:element name="p">
                                <xsl:attribute name="id">videoTitle</xsl:attribute>
                                <xsl:value-of select="./b:details/b:name"/> Video
                            </xsl:element>
                                        
                            <xsl:element name="iframe">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="b:video"/>
                                </xsl:attribute>
                                <xsl:attribute name="width">450</xsl:attribute>
                                <xsl:attribute name="height">400</xsl:attribute>
                            </xsl:element>                       
                        </div>
                                
                        <ul>
                            <li class="nextPrev">	  
                                <xsl:element name="a">
                                    <xsl:attribute name="href">bikeArticle?title=<xsl:value-of select="$prevArticle"/>
                                    </xsl:attribute>Previous Article
                                </xsl:element> 
                            </li>             
                            | 
                            <li class="nextPrev">   
                                <xsl:element name="a">
                                    <xsl:attribute name="href">bikeArticle?title=<xsl:value-of select="$nextArticle"/>
                                    </xsl:attribute>Next Article
                                </xsl:element>
                            </li>
                        </ul>               
                    </center>
                </div>
            </div>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="b:vehicle">
        <xsl:apply-templates select="//b:vehicle"/>    
    </xsl:template>
    
</xsl:transform>