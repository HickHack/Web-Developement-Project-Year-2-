
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>

        <title>Search</title>
        <link rel="stylesheet" type="text/css" href="css/layout.css">
        <script type="text/javascript" src="javascript/timeAjax.js"></script>
        <script type="text/javascript" src="javascript/nameCookie.js"></script>
        <script type="text/javascript" src="javascript/CurrencyConverter.js"></script>

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
                            <p style="font-size:14px"><i>Page Updated:</i></p>
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
                        <li><a href="<%= request.getContextPath()%>">Home</a></li>
                        <li><a href="<%= request.getContextPath()%>/motorbikes.jsp">Motorbikes</a></li>
                        <li><a href="<%= request.getContextPath()%>/cars.jsp">Cars</a></li>
                        <li><a href="<%= request.getContextPath()%>/search.jsp">Search</a></li>
                    </ul>
                </center>
            </div>
        </div>   
    <center><h2>Search Our Vehicles</h2></center><br/>

    <center><form action="<%= request.getContextPath()%>/search.jsp">
            <input type="text" id="search" name="search" placeholder="Enter Your Query" required/><input type="submit" value="search"/>
        </form></center><br/>
    <center>

        <jsp:include page="search" flush="true" /></center>

    <footer>
        <p class="credits">Website Developed by Graham Murray &amp; Niall Curran</p>
    </footer>

</body>
</html>
