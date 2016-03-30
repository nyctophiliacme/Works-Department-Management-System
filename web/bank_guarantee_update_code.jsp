<%-- 
    Document   : bank_guarantee_update_code
    Created on : Jun 30, 2015, 12:30:23 PM
    Author     : Pransh Tiwari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, listresult.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bank Guarantee Update</title>
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
        ResultSet bak = listresult.db_result.sel_bank(dbc, wo_no);
    %>


    <form name="bank_guarantee_update_code" action="bank_guarantee_update_code2.jsp" method="post" onsubmit="return(validate());">
        <table>
            <% while (bak.next()) {%>
            <input type="hidden" name="wo_no" value="<%=bak.getString("wo_no")%>">
            <tr>
                <td>we no</td>
                <td><input type="text" readonly disabled value="<%=bak.getString("we_no")%>"><td/>
            </tr>
            <tr>
                <td>Vendor ID</td>
                <td><input type="text" readonly disabled value="<%=bak.getString("vendor_id")%>"><td/>
            </tr>
            <tr>
                <td>Date of issue</td>
                <td><input type="text" name="date_of_issue" readonly disabled value="<%=bak.getDate("date_of_issue")%>"><td/>
            </tr>
            <tr>
                <td>Expiry Date</td>
                <td><input type="text" name="expiry_date" readonly disabled value="<%=bak.getDate("expiry_date")%>"><td/>
            </tr>
            <tr>
                <td>Extended Expiry Date</td>
                <td><input type=text id ="fromDateId" name="extended_expiry_date" value="<%=bak.getDate("extended_expiry_date")%>" size=12 >&nbsp
                    <A HREF="#" onClick="cal1.select(document.forms[0].extended_expiry_date, 'anchor1', 'yyyy-MM-dd');
                            return false;" NAME="anchor1" ID="anchor1">
                        <img src="/Works_template/images/calendar.png" border="0">
                    </A>
                </td>
            </tr>
            <tr>
                <td>Amount</td>
                <td><input type="text" readonly disabled value="<%=bak.getFloat("amount")%>"><td/>
            </tr>
            <tr>
                <td>Bank Name</td>
                <td><input type="text" readonly disabled value="<%=bak.getString("bank_name")%>"><td/>
            </tr>
            <tr>
                <td>Branch Name</td>
                <td><input type="text" readonly disabled value="<%=bak.getString("branch_name")%>"><td/>
            </tr>
            <tr>
                <td>Account No</td>
                <td><input type="number" readonly disabled value="<%=bak.getString("account_no")%>"><td/>
            </tr>
            <tr>
                <td>IFSC code</td>
                <td><input type="text" readonly disabled value="<%=bak.getString("IFSC")%>"><td/>
            </tr>
            <tr>
                <td>MICR code</td>
                <td><input type="text" readonly disabled value="<%=bak.getString("MICR")%>"><td/>
            </tr>
            <tr>
                <td>Bank Guarantee Code</td>
                <td><input type="text" readonly disabled value="<%=bak.getString("bank_guarantee_code")%>"><td/>
            </tr>
            <% }%>
            <tr>
                <td><input type="submit" value="Submit" style="width: 70px"><td/>
            <tr/>
        </table>
    </form>

</html> 
