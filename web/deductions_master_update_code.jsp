<%-- 
    Document   : deductions_master_update_code
    Created on : Jul 1, 2015, 10:54:08 AM
    Author     : Pransh Tiwari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, listresult.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Deductions Master Update</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    </head>
    <%
        String label = request.getParameter("label");
        Connection dbc = null;
        Class.forName("com.mysql.jdbc.Driver");
        dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
        if (dbc != null) {
            System.out.println("Connection successful");
        }
        ResultSet ded = listresult.db_result.sel_ded_master(dbc, label);
        while (ded.next()) {
    %>
    <form name="deductions_master_update_code" action="deductions_master_update_code2.jsp" method="post">
        <table>
            <input type="hidden" name="label" value="<%=ded.getString("label")%>">
            <tr>
                <td>State</td>
                <td>Active<input type="radio" <% if (ded.getString("state").equals("active")) { %> checked <% } %> name="state" value="active">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                    Inactive<input type="radio" <% if (ded.getString("state").equals("inactive")) { %> checked <% } %> name="state" value="inactive"><td/>
            </tr>                
            <tr/>
            <td><input type="submit" value="Submit" style="width: 70px; height: 25px"><td/>
            <tr/>
        </table>
    </form>
    <% }%>
</html> 
