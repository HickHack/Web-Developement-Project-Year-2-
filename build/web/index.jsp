<%-- 
    Document   : index
    Created on : 19-Nov-2014, 15:14:15
    Author     : graham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Wiki Project</title>
        <link type="text/css" rel="stylesheet" href="css/layout.css">
        <script type="text/javascript" src="javascript/timeAjax.js"></script>
        <script type="text/javascript" src="javascript/nameCookie.js"></script>
        <style type="text/css">
            h2{
                margin:100px 0px 0px 0px;    
            }
            input{
                margin:60px;
            }
        </style>
    </head>
    <body onload="getServerTime('serverTime'),load()">
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
        <h2><center>Welcome to the Project.</center></h2>
        <br/>
        <br/>
    <center><p id="welcome">Here you will find a listing of vehicles.</p></center>
    <div>

        <div id="nameCookie">
            <center>
                <form class="nameForm" id="form" onsubmit="setCookie();" method="post">

                    <input style="margin:0px 15px 0px 0px" type="text" name="username" id="username" placeholder="Enter Your Name!" required/>

                    <input class="nameSubmit" type="submit" value="Remember" class="button"/>
                </form>
            </center>
        </div>

        <form action="motorbikes.jsp">
            <center><input type="Submit" value ="Press to Continue!"></center>
        </form>
    </div>
</body>
</html>
