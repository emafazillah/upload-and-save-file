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
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload</title>  
    </head>  
    <body>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://127.8.221.130:3306/testcase2"
                           user="admint4R1mdb"  password="MZu2kwNM3kqW"/>  
        <%!
            public static ArrayList readExcelFile(String fileName) {
                /**
                 * --Define a ArrayList --Holds ArrayList Of Cells
                 */
                ArrayList cellArrayLisstHolder = new ArrayList();
                try {
                    /**
                     * Creating Input Stream*
                     */
                    FileInputStream myInput = new FileInputStream(fileName);
                    /**
                     * Create a POIFSFileSystem object*
                     */
                    POIFSFileSystem myFileSystem = new POIFSFileSystem(myInput);
                    /**
                     * Create a workbook using the File System*
                     */
                    HSSFWorkbook myWorkBook = new HSSFWorkbook(myFileSystem);
                    /**
                     * Get the first sheet from workbook*
                     */
                    HSSFSheet mySheet = myWorkBook.getSheetAt(0);
                    /**
                     * We now need something to iterate through the cells.*
                     */
                    Iterator rowIter = mySheet.rowIterator();
                    while (rowIter.hasNext()) {
                        HSSFRow myRow = (HSSFRow) rowIter.next();
                        Iterator cellIter = myRow.cellIterator();
                        ArrayList cellStoreArrayList = new ArrayList();
                        while (cellIter.hasNext()) {
                            HSSFCell myCell = (HSSFCell) cellIter.next();
                            cellStoreArrayList.add(myCell);
                        }
                        cellArrayLisstHolder.add(cellStoreArrayList);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return cellArrayLisstHolder;
            }         
        %>  
        <%
            try {
                
                //String savefile = "C:\\testcasefile\\" + request.getParameter("filename");
                String fileName = (String)request.getAttribute("fn");
                
                //Read an Excel File and Store in a ArrayList  
                ArrayList dataHolder = readExcelFile(fileName);
                ArrayList cellStoreArrayList = null;

                //For inserting into database
                for (int i = 1; i < dataHolder.size(); i++) {%>

        <sql:update dataSource="${snapshot}" var="result">
            INSERT INTO testcasetxn2(tested_function,function_input,function_expected_output,weightage3,weightage2,weightage1,weightage,function_status) VALUES (?,?,?,?,?,?,?,?);            
            <%
                        cellStoreArrayList = (ArrayList) dataHolder.get(i);
                        try {%>
            <sql:param value="<%=((HSSFCell) cellStoreArrayList.get(1)).toString()%>" />
            <%} catch (Exception e1) {%>
            <sql:param value="" />
            <%
                        }
                        try {%>
            <sql:param value="<%=((HSSFCell) cellStoreArrayList.get(2)).toString()%>" />
            <%} catch (Exception e2) {%>
            <sql:param value="" />
            <%
                        }
                        try {%>
            <sql:param value="<%=((HSSFCell) cellStoreArrayList.get(3)).toString()%>" />
            <%} catch (Exception e3) {%>
            <sql:param value="" />
            <%
                        }
                        try {%>
            <sql:param value="<%=((HSSFCell) cellStoreArrayList.get(4)).toString()%>" />
            <%} catch (Exception e4) {%>
            <sql:param value="" />
            <%
                        }
                        try {%>
            <sql:param value="<%=((HSSFCell) cellStoreArrayList.get(5)).toString()%>" />
            <%} catch (Exception e5) {%>
            <sql:param value="" />
            <%
                        }
                        try {%>
            <sql:param value="<%=((HSSFCell) cellStoreArrayList.get(6)).toString()%>" />
            <%} catch (Exception e6) {%>
            <sql:param value="" />
            <%
                        }
                        try {%>
            <sql:param value="<%=((HSSFCell) cellStoreArrayList.get(7)).toString()%>" />
            <%} catch (Exception e7) {%>
            <sql:param value="0" />
            <%
                        }
                        try {%>
            <sql:param value="<%=((HSSFCell) cellStoreArrayList.get(8)).toString()%>" />
            <%} catch (Exception e8) {%>
            <sql:param value="" />
            <%
                        }%>                    
        </sql:update>

        <%}

            } catch (Exception ex) {
                System.out.println("error====" + ex.toString());
                response.sendRedirect("http://testcase2-emafazillahphp.rhcloud.com/upload.html");
            }

            response.sendRedirect("http://testcase2-emafazillahphp.rhcloud.com/TestCaseGf2.html");
        %>
    </body>  
</html> 