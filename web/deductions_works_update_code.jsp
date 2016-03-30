<%-- 
    Document   : deductions_works_update_code
    Created on : Jul 1, 2015, 10:54:08 AM
    Author     : Pransh Tiwari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, listresult.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Deductions-Works Relation Update</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    </head>
    <%
        int ded_works_id = Integer.parseInt(request.getParameter("ded_works_id"));
        Connection dbc = null;
        Class.forName("com.mysql.jdbc.Driver");
        dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
        if (dbc != null) {
            System.out.println("Connection successful");
        }
        ResultSet ded = listresult.db_result.sel_ded_works(dbc, ded_works_id);
        while (ded.next()) {
    %>
    <form name="deductions_works_update_code" action="deductions_works_update_code2.jsp" method="post" onsubmit="return(validate());">
        <table>
            <input type="hidden" name="ded_works_id" value="<%=ded.getString("ded_works_id")%>">
            <tr>
                <td><%= ded.getString("label")%></td>
                <td><input type="text" name="value" value="<%=ded.getFloat("value")%>"<td/>
            </tr>                
            <tr/>
            <td><input type="submit" value="Submit" style="width: 70px; height: 25px"><td/>
            <tr/>
        </table>
    </form>
    <% }%>
</html> 
