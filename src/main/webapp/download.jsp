<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.util.Iterator" %>  
<%@ page import ="java.util.ArrayList" %>
<!-- Apache POI Libraries  -->
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFCell" %>  
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFRow" %>  
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFSheet" %>  
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>  
<%@ page import ="org.apache.poi.poifs.filesystem.POIFSFileSystem" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <title>Download</title>  
    </head>  
    <body>  
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://127.8.221.130:3306/testcase2"
                           user="admint4R1mdb"  password="MZu2kwNM3kqW"/>
        <%
            
            int index = 3;
            Date date = new Date();
            String filename = "C:\\testcasefile\\" + date.getTime() + ".xls";

            try {

                HSSFWorkbook hwb = new HSSFWorkbook();
                HSSFSheet sheet = hwb.createSheet("input");
                HSSFRow rowhead = sheet.createRow((short) 2);
                rowhead.createCell((short) 0).setCellValue("Test Case ID");
                rowhead.createCell((short) 1).setCellValue("Function being tested");
                rowhead.createCell((short) 2).setCellValue("Input");
                rowhead.createCell((short) 3).setCellValue("Expected output");
                rowhead.createCell((short) 4).setCellValue("Defect");
                rowhead.createCell((short) 5).setCellValue("New functionality");
                rowhead.createCell((short) 6).setCellValue("Change of functionality");
                rowhead.createCell((short) 7).setCellValue("Weightage");
                rowhead.createCell((short) 8).setCellValue("Status");
                
        %>
        <sql:query dataSource="${snapshot}" var="result">
            SELECT * FROM testcasetxn2;
        </sql:query>        
        <c:forEach var="row" items="${result.rows}">
            <c:set var="r1" value="${row.id}"/>
            <c:set var="r2" value="${row.tested_function}"/>
            <c:set var="r3" value="${row.function_input}"/>
            <c:set var="r4" value="${row.function_expected_output}"/>
            <c:set var="r5" value="${row.weightage3}"/>
            <c:set var="r6" value="${row.weightage2}"/>
            <c:set var="r7" value="${row.weightage1}"/>
            <c:set var="r8" value="${row.weightage}"/>
            <c:set var="r9" value="${row.function_status}"/>
            <%
                    HSSFRow row = sheet.createRow((short) index);
                    
                    try{
                        row.createCell((short) 0).setCellValue((String)pageContext.getAttribute("r1"));
                    }catch(Exception e1){
                        row.createCell((short) 0).setCellValue("");
                    }
                    try{
                        row.createCell((short) 1).setCellValue((String)pageContext.getAttribute("r2"));
                    }catch(Exception e2){
                        row.createCell((short) 1).setCellValue("");
                    }
                    try{
                        row.createCell((short) 2).setCellValue((String)pageContext.getAttribute("r3"));
                    }catch(Exception e3){
                        row.createCell((short) 2).setCellValue("");
                    }
                    try{
                        row.createCell((short) 3).setCellValue((String)pageContext.getAttribute("r4"));
                    }catch(Exception e4){
                        row.createCell((short) 3).setCellValue("");
                    }
                    try{
                        row.createCell((short) 4).setCellValue((String)pageContext.getAttribute("r5"));
                    }catch(Exception e5){
                        row.createCell((short) 4).setCellValue("");
                    }
                    try{
                        row.createCell((short) 5).setCellValue((String)pageContext.getAttribute("r6"));
                    }catch(Exception e6){
                        row.createCell((short) 5).setCellValue("");
                    }                    
                    try{
                        row.createCell((short) 6).setCellValue((String)pageContext.getAttribute("r7"));
                    }catch(Exception e7){
                        row.createCell((short) 6).setCellValue("");
                    }
                    try{
                        row.createCell((short) 7).setCellValue((String)pageContext.getAttribute("r8"));
                    }catch(Exception e8){
                        row.createCell((short) 7).setCellValue("0");
                    }
                    try{
                        row.createCell((short) 8).setCellValue((String)pageContext.getAttribute("r9"));
                    }catch(Exception e9){
                        row.createCell((short) 8).setCellValue("");
                    }                    

                    index++;                
            %>
        </c:forEach>            
        <%
                
                FileOutputStream fileOut = new FileOutputStream(filename);
                hwb.write(fileOut);
                fileOut.close();
                
                response.sendRedirect("http://testcase2-emafazillahphp.rhcloud.com/TestCaseGf2.html");

            } catch (Exception ex) {
                response.sendRedirect("http://testcase2-emafazillahphp.rhcloud.com/TestCaseGf2.html");
            }
        %>
    </body>  
</html> 