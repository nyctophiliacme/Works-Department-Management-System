<%-- 
    Document   : pay_order_entry2
    Created on : Jul 1, 2015, 10:53:48 AM
    Author     : Pransh Tiwari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*, java.io.*, listresult.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pay Order Report</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    </head>

    <body>

        <script src="/Works_template/js/CalendarPopup.js"  type="text/javascript" ></script>
        <script LANGUAGE="JavaScript" ID="js1" type="text/javascript">
            var cal1 = new CalendarPopup();
        </script>

        <%
            String wo_no = request.getParameter("wo_no");
            Connection dbc = null;
            Class.forName("com.mysql.jdbc.Driver");
            dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
            if (dbc != null) {
                System.out.println("Connection successful");
            }
            ResultSet pay = listresult.db_result.sel_pay1(dbc, wo_no);
        %>



        <table>
            <tr>
                <td>Pay Order No</td>
                <td><select name="pay_order_id" onchange="showUser2(this.value)">
                        <option value="">SELECT</option>
                        <% while (pay.next()) {%>
                        <option value="<%=pay.getInt("p.pay_order_id")%>"><%=pay.getInt("pay_order_no")%></option>
                        <%}%>
                    </select>
                </td>
            </tr> 

        </table>
        <div id="contentArea2">&nbsp;</div>
</html>
