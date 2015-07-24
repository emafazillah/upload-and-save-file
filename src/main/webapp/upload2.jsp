<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.util.Iterator" %>  
<%@ page import ="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test upload</title>
    </head>
    <body>
        <%
            String USERNAME = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
            String PASSWORD = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
            String DB_NAME = System.getenv("OPENSHIFT_APP_NAME");
            String FORNAME_URL = "com.mysql.jdbc.Driver";
            String URL = "jdbc:" + System.getenv("OPENSHIFT_MYSQL_DB_URL") + DB_NAME;
            String UPLOAD = System.getenv("OPENSHIFT_DATA_DIR");
            String fn = (String)request.getAttribute("fn");            
        %>
        <div>USERNAME: <%=USERNAME%></div>
        <div>PASSWORD: <%=PASSWORD%></div>
        <div>DB_NAME: <%=DB_NAME%></div>
        <div>FORNAME_URL: <%=FORNAME_URL%></div>
        <div>URL: <%=URL%></div>
        <div>UPLOAD: <%=UPLOAD%></div>
        <div>fn: <%=fn%></div>
    </body>
</html>
