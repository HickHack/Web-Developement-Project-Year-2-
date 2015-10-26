<%-- 
    Document   : cars
    Created on : 26-Nov-2014, 17:41:38
    Author     : graham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Wiki Projects</title>
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

        <jsp:include page="cars" flush="true" />
    </body>
</html>
