<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="search"/>


    <xsl:template match="/"> 
        <script type="text/javascript">
            function getMyRate(jData) {
            if (jData == null) {
            alert("There was a problem parsing search results.");
            return;
            }
            var myval = jData.ResultSet;
            var mydiv = jData.xxMyDiv;
            document.getElementById(mydiv).innerHTML = myval;
            }
        </script>
      
   
        <h2>Vehicle Price Converter</h2> 
        1 GBP = <script type="text/javascript">getExchangeRates('1','GBP','EUR','true')</script> Euro
        1 USD = <script type="text/javascript">getExchangeRates('1','USD','EUR','true')</script> Euro
               

        <xsl:variable name="Upper" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />  
        <xsl:variable name="Lower" select="'abcdefghijklmnopqrstuvwxyz'" />
   
    
        <xsl:if test="count(//vehicle[contains(translate(details/name, $Lower, $Upper),translate($search, $Lower, $Upper))]) = 0">
            <h2>No Results found in our database for vehicle with name: <xsl:value-of select="$search"/></h2>
        </xsl:if>
                    
                     
        <xsl:if test="count(//vehicle[contains(translate(details/name, $Lower, $Upper),translate($search, $Lower, $Upper))]) > 0">  
            <h2>Results for vehicle with name: <xsl:value-of select="$search"/></h2>
            <table id="searchTable" border="3">
                <tr>
                    <th></th>
                    <th>Name</th>
                    <th>Manufacturer</th>
                    <th>Description</th>
                    <th>Engine Size</th>
                    <th>Top Speed</th>
                    <th>BHP</th>
                    <th>0-60</th>
                    <th>Cost</th>
                    <th>MPG</th>
                    <th>Cylinders</th>
        
       
                </tr>
          
                <xsl:for-each select="vehicles/vehicle">  
                    <xsl:if test="contains(translate(details/name, $Lower, $Upper),translate($search, $Lower, $Upper))">
                        <tr>
                            <td>
                                        
                                <img id="vehicleImage">
                                    <xsl:attribute name="src">
                                        <xsl:value-of select="image"/>
                                    </xsl:attribute>
                                </img>
                                       
                            </td>
                            <td>
                                <xsl:value-of select="details/name"/>
                            </td>
                            <td>
                                <xsl:value-of select="details/manufacturer"/>
                            </td>
                            <td id="descrpt">
                                <xsl:value-of select="details/description"/>
                            </td>
                            <td>
                                <xsl:value-of select="specification/engineSize"/>
                            </td>
                            <td>
                                <xsl:value-of select="specification/topSpeed"/>
                            </td>
                            <td>
                                <xsl:value-of select="specification/bhp"/>
                            </td>
                            <td>
                                <xsl:value-of select="specification/zero-sixty"/>
                            </td>
                            <td>
                                <xsl:value-of select="specification/cost"/>
                            </td>
                            <td>
                                <xsl:value-of select="specification/mpg"/>
                            </td>
                            <td>
                                <xsl:value-of select="specification/cylinders"/>
                            </td>
         
                        </tr>
                    </xsl:if>
                </xsl:for-each>
            </table>
        </xsl:if>
    </xsl:template>
</xsl:transform>