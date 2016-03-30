<%-- 
    Document   : pay_order_entry3
    Created on : Jun 25, 2015, 12:13:23 PM
    Author     : Pransh Tiwari
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat,java.util.GregorianCalendar"%>
<%@page import="java.sql.*, java.io.*, java.util.Date,listresult.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pay Order</title>
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
            int ra_bill_id = Integer.parseInt(request.getParameter("ra_bill_id"));
            Connection dbc = null;
            System.out.println(ra_bill_id);
            Class.forName("com.mysql.jdbc.Driver");
            dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
            if (dbc != null) {
                System.out.println("Connection successful");
            }
            ResultSet ra2 = listresult.db_result.sel_ra2(dbc, ra_bill_id);
            ResultSet emp = listresult.db_result.get_Emp(dbc);
            Calendar cal = Calendar.getInstance();
            java.sql.Date today = new java.sql.Date(cal.getTime().getTime());
        %>

        <form name="pay_order_entry" action="pay_order_entry_code.jsp" method="post">
            <table>
                <% while (ra2.next()) {%>
                <input type="hidden" name="ra_bill_id" size="40" value="<%=ra2.getInt("ra_bill_id")%>">


                <td>Pay Order No</td>
                <td><input type="number" value="<%=ra2.getInt("ra_bill_no")%>" readonly disabled name="pay_order_no"><td/>
                <input type="hidden" name="pay_order_no" value="<%=ra2.getInt("ra_bill_no")%>" size="40" >

                <tr>
                    <td>Amount</td>
                    <td><input type="number" readonly disabled value="<%=ra2.getDouble("amount")%>"><td/>
                <input type="hidden" name="amount" value="<%=ra2.getDouble("amount")%>" size="40" >
                </tr> 
                <tr>
                    <td>Created By</td>
                    <td><select name="created_by"">
                            <option value="">SELECT</option>
                            <% while (emp.next()) {%>
                            <option value="<%=emp.getInt("emp_no")%>"><%=emp.getInt("emp_no")%>&nbsp&nbsp<%=emp.getString("emp_name")%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Creation Date</td>
                    <td><input type=text id ="fromDateId" name="creation_date" readonly disabled value="<%=today%>" size=12 >&nbsp
                        <A HREF="#" onClick="cal1.select(document.forms[0].creation_date, 'anchor1', 'yyyy-MM-dd');
                                return false;" NAME="anchor1" ID="anchor1">
                            <img src="/Works_template/images/calendar.png" border="0">
                        </A>
                    </td>
                <input type=hidden name="creation_date" value="<%=today%>" size=12 >
                </tr>
                <%}%>
                <tr>
                    <td><input type="submit" value="Submit" style="width: 70px"><td/>
                <tr/>
            </table>
        </form>
        <!-- javascript at the bottom for fast page loading -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
        <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
        <script type="text/javascript" src="js/image_fade.js"></script>
        <script type="text/javascript">
                            $(document).ready(function () {
                                $('ul.sf-menu').sooperfish();
                            });
        </script>
    </body>

</html>
