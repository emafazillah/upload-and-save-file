<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
    <head>
        <title>SELECT Operation</title>
    </head>
    <body>
        <%
            String USERNAME = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
            String PASSWORD = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");
            String DB_NAME = System.getenv("OPENSHIFT_APP_NAME");
            String FORNAME_URL = "com.mysql.jdbc.Driver";
            String URL = "jdbc:"+System.getenv("OPENSHIFT_MYSQL_DB_URL")+ DB_NAME;
            String UPLOAD = System.getenv("OPENSHIFT_DATA_DIR");
        %>
        <div>USERNAME: <%=USERNAME%></div>
        <div>PASSWORD: <%=PASSWORD%></div>
        <div>DB_NAME: <%=DB_NAME%></div>
        <div>FORNAME_URL: <%=FORNAME_URL%></div>
        <div>URL: <%=URL%></div>
        <div>UPLOAD: <%=UPLOAD%></div>

        <!--sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/testcaseapp"
                           user="root"  password="root@123"/-->
        
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://127.8.221.130:3306/testcase2"
                           user="admint4R1mdb"  password="MZu2kwNM3kqW"/>

        <sql:query dataSource="${snapshot}" var="result">
            SELECT * FROM testcasetxn2;
        </sql:query>

        <table border="1" width="100%">
            <tr>
                <th>Test Case ID</th>
                <th>Function being tested</th>
                <th>Input</th>
                <th>Expected output</th>
                <th>Defect</th>
                <th>New functionality</th>
                <th>Change of functionality</th>
                <th>Weightage</th>
                <th>Status</th>
            </tr>
            <c:forEach var="row" items="${result.rows}">
                <tr>
                    <td><c:out value="${row.id}"/></td>
                    <td><c:out value="${row.tested_function}"/></td>
                    <td><c:out value="${row.function_input}"/></td>
                    <td><c:out value="${row.function_expected_output}"/></td>
                    <td><c:out value="${row.weightage3}"/></td>
                    <td><c:out value="${row.weightage2}"/></td>
                    <td><c:out value="${row.weightage1}"/></td>
                    <td><c:out value="${row.weightage}"/></td>
                    <td><c:out value="${row.function_status}"/></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>