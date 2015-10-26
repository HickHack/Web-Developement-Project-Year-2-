<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/" priority="10">
        <html>
            <head>
                <title>Vehicle Wiki Project - Created by Graham Murray and Niall Curran</title>
                <link rel="stylesheet" href="css/layout.css" type="text/css"/>
                <script type="text/javascript" src="javascript/timeAjax.js"></script>
                <script type="text/javascript" src="javascript/nameCookie.js"></script>
            </head>
            <body onload="getServerTime('serverTime')">
                <div id="navi">
                    <div id="subNavi">
                        <div class="nameCookie">
                            <table>
                                <tr>
                                    <td  style="float:right">    
                                        <p>
                                            <i>
                                                <script language="javascript">
                                                    outputCookie()
                                                </script>
                                            </i>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <table class="lastUpdated">
                            <tr>
                                <td>
                                    <p style="font-size:14px">
                                        <i>Page Updated:</i>
                                    </p>
                                </td>
                                <td>
                                    <div style="font-size:14px" id="serverTime"></div>
                                </td>
                            </tr>
                        </table>
                        <h1 id="welcome"> Vehicle Wiki Project</h1>
                    </div>
        
                    <div id="navi2">
                        <center>
                        <ul>
                            <li>
                                <a href="index.jsp">Home</a>
                            </li>
                            <li>
                                <a href="motorbikes.jsp">Motorbikes</a>
                            </li>
                            <li>
                                <a href="cars.jsp">Cars</a>
                            </li>
                            <li>
                                <a href="search.jsp">Search</a>
                            </li>
                        </ul>
                        </center>
                    </div>
                </div>
                <xsl:apply-templates/>
              
                <footer>
                    <p class="credits">Website Developed by Graham Murray &amp; Niall Curran</p>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
