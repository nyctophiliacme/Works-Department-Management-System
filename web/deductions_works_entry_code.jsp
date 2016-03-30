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
        String wo_no = request.getParameter("wo_no");
        Connection dbc = null;
        Class.forName("com.mysql.jdbc.Driver");
        dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
        if (dbc != null) {
            System.out.println("Connection successful");
        }
        ResultSet ded = listresult.db_result.get_ded_master(dbc);
    %>
    <form name="deductions_works_entry" action="deductions_works_entry_code2.jsp" method="post" onsubmit="return(validate());">
        <table>
            <input type="hidden" name="wo_no" value="<%=wo_no%>">
            <% while (ded.next()) {
            String t = ded.getString("state");
            if (t.equals("inactive")) {
                continue;
            }%>
            <tr>
                <td>
                    <input type="hidden" value="<%=ded.getString("label")%>" name="label"><%=ded.getString("label")%></td>
                    <%    ResultSet d = listresult.db_result.sel_ded_works2(dbc, ded.getString("label"), wo_no); %>

                <td><input type="text" <%if (d.next()) {
                            System.out.println(d.getFloat("value"));%> value="<%=d.getFloat("value")%>" <% } else {%> value="0" <% }%> name="<%=ded.getString("label")%>"></td>

            </tr>
            <%}%>
            <tr>
                <td><input type="submit" value="Submit" style="width: 70px"><td/>
            <tr/>
        </table> 
    </form>
</html> 
