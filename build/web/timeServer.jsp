<%-- 
    Document   : timeServer.jsp
    Created on : 05-Nov-2014, 18:20:11
    Author     : Graham Murray
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<%
Date date = new Date();
String dateStr = date.toString();
out.println("<p>"+dateStr+"</p>");
%>
