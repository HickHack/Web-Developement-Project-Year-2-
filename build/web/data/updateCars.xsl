<?xml version="1.0"?>
<xsl:transform  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:v="http://www.WebDev.nci/tutorial" version="1.0">
    
    <xsl:include href="includeHeader.xsl"/>

    <xsl:param name="currentArticle"></xsl:param>
   
        
    <xsl:template match="//v:vehicle" >
        <div id="updateMain">

            <xsl:if test="./parameter=$currentArticle">
                
                    
                <div class="updateMain">
                    <center>
                        <img class="updateImg">
                            <xsl:attribute name="alt">
                                <xsl:value-of select="./v:details/v:name"/>
                            </xsl:attribute>
                            <xsl:attribute name="src">
                                <xsl:value-of select="./v:image"/>
                            </xsl:attribute>
                        </img>        

                        <table width="auto">
                            <tr>
                                <td>
                                    <div>Car Name: </div>
                                </td>
                                <td>
                                    <xsl:value-of select="./v:details/v:name"/>
                                </td>
                            </tr>
                        </table>
                        <br /> 
                        
                        <xsl:element name="form">
                            <xsl:attribute name="action">carArticle</xsl:attribute>
                            <xsl:attribute name="method">post</xsl:attribute> 
                       
                            <xsl:element name="input">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="./parameter"/>
                                </xsl:attribute>
                                <xsl:attribute name="type">hidden</xsl:attribute>
                                <xsl:attribute name="name">title</xsl:attribute>
            
                            </xsl:element>
                    
                            <table>
                                <tr>
                                    <td>Name:</td>
                                    <td>
                                        <xsl:element name="input">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="./v:details/v:name"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="type">text</xsl:attribute>
                                            <xsl:attribute name="size">10</xsl:attribute>
                                            <xsl:attribute name="name">name</xsl:attribute>
                                        </xsl:element>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>Manufacturer:</td>
                                    <td>
                                        <xsl:element name="input">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="./v:details/v:manuacturer"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="type">text</xsl:attribute>
                                            <xsl:attribute name="size">10</xsl:attribute>
                                            <xsl:attribute name="name">manufacturer</xsl:attribute>
                                        </xsl:element>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>Engine Size:</td>
                                    <td>
                                        <xsl:element name="input">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="./v:specification/v:engineSize"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="type">text</xsl:attribute>
                                            <xsl:attribute name="size">10</xsl:attribute>
                                            <xsl:attribute name="name">engineSize</xsl:attribute>
                                        </xsl:element>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>Top Speed:</td>
                                    <td>
                                        <xsl:element name="input">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="./v:specification/v:topSpeed"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="type">text</xsl:attribute>
                                            <xsl:attribute name="size">10</xsl:attribute>
                                            <xsl:attribute name="name">topSpeed</xsl:attribute>
                                        </xsl:element>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>Horse Power:</td>
                                    <td>
                                        <xsl:element name="input">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="./v:specification/v:bhp"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="type">text</xsl:attribute>
                                            <xsl:attribute name="size">10</xsl:attribute>
                                            <xsl:attribute name="name">bhp</xsl:attribute>
                                        </xsl:element>
                                    </td>
                                </tr>
                            </table>
                            <br/>
                            <br/>
                            <input type="submit" value="Update" onclick="alert('Unfortunately we couldnt get the xquery to work but all the code for it is in the carArticle Servlet')"/>
                            <a class="anchor">
                                <xsl:attribute name="href">carArticle?title=<xsl:value-of select="$currentArticle"/></xsl:attribute>
                            
                            <input type="button" value="Cancel"/>    </a>        
                        </xsl:element>
                
                    </center>
                </div>
            </xsl:if>
        </div>
    </xsl:template>
    
    <xsl:template match="v:vehicle">
        <xsl:apply-templates select="//v:vehicle"/>    
    </xsl:template>
   
</xsl:transform>
