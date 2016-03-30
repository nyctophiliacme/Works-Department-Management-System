<%-- 
    Document   : vendor_master_update_code
    Created on : Jul 1, 2015, 10:54:08 AM
    Author     : Pransh Tiwari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, listresult.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vendor Master Update</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    </head>
    <%
        int vendor_id = Integer.parseInt(request.getParameter("vendor_id"));
        Connection dbc = null;
        Class.forName("com.mysql.jdbc.Driver");
        dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
        if (dbc != null) {
            System.out.println("Connection successful");
        }
        ResultSet vd = listresult.db_result.sel_vendor(dbc, vendor_id);
        ResultSet emp = listresult.db_result.get_Emp(dbc);
        while (vd.next()) {
    %>
    <form name="vendor_master_update_code" action="vendor_master_update_code2.jsp" method="post">
        <table>
            <input type="hidden" name="vendor_id" value="<%=vd.getInt("vendor_id")%>">
            <tr>
                <td>Vendor Name</td>
                <td><input type="text" readonly disabled value="<%=vd.getString("vendor_name")%>"><td/>
            </tr>
            <tr>
                <td>Address Line 1</td>
                <td><input type=text name="address_1" value="<%=vd.getString("address_1")%>"><td/>
            </tr>
            <tr>
                <td>Address Line 2</td>
                <td><input type=text name="address_2" value="<%=vd.getString("address_2")%>"><td/>
            </tr>
            <tr>
                <td>Address Line 3</td>
                <td><input type=text name="address_3" value="<%=vd.getString("address_3")%>"><td/>
            </tr>
            <tr>
                <td>Address Line 4</td>
                <td><input type=text name="address_4" value="<%=vd.getString("address_4")%>"><td/>
            </tr>
            <tr>
                <td>Address Line 5</td>
                <td><input type=text name="address_5" value="<%=vd.getString("address_5")%>"><td/>
            </tr>
            <tr>
                <td>Address Line 6</td>
                <td><input type=text name="address_6" value="<%=vd.getString("address_6")%>"><td/>
            </tr>
            <tr>
                <td>PAN no</td>
                <td><input type="number"  readonly disabled value="<%=vd.getString("pan_no")%>"><td/>
            </tr>
            <tr>
                <td>TAN no</td>
                <td><input type="number"  readonly disabled value="<%=vd.getString("tan_no")%>"><td/>
            </tr>
            <tr>
                <td>IFSC code</td>
                <td><input type="text" name="IFSC" value="<%=vd.getString("IFSC")%>"><td/>
            </tr>
            <tr>
                <td>MICR code</td>
                <td><input type="text" name="MICR" value="<%=vd.getString("MICR")%>"><td/>
            </tr>
            <tr>
                <td>Bank Name</td>
                <td><input type="text" name="bank_name" value="<%=vd.getString("bank_name")%>"><td/>
            </tr>
            <tr>
                <td>Branch Name</td>
                <td><input type="text" name="branch_name" value="<%=vd.getString("branch_name")%>"><td/>
            </tr>
            <tr>
                <td>Account No</td>
                <td><input type="number" name="account_no" value="<%=vd.getString("account_no")%>"><td/>
            </tr>
            <tr>
                <td>Contact no 1</td>
                <td><input type="number" name="contact_1" value="<%=vd.getString("contact_1")%>"><td/>
            </tr>
            <tr>
                <td>Contact no 2</td>
                <td><input type="number" name="contact_2" value="<%=vd.getString("contact_2")%>"><td/>
            </tr>
            <tr>
                <td>Fax no</td>
                <td><input type="text" name="fax_no" value="<%=vd.getString("fax_no")%>"><td/>
            </tr>
            <tr>
                <td>email id</td>
                <td><input type="email" name="email_id" value="<%=vd.getString("email_id")%>"><td/>
            </tr>
            <tr>
                <td>State</td>
                <td>Active<input type="radio" <% if (vd.getString("state").equals("active")) { %> checked <% } %> name="state" value="active">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                    Inactive<input type="radio" <% if (vd.getString("state").equals("inactive")) { %> checked <% } %> name="state" value="inactive"><td/>
            </tr>                
            <tr/>
            <td><input type="submit" value="Submit" style="width: 70px; height: 25px"><td/>
            <tr/>
        </table>
    </form>
    <% }%>
</html> 
