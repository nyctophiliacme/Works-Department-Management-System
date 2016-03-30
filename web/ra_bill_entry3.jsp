<%-- 
    Document   : ra_bill_entry3
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
        <title>Running Accounts Bill Entry</title>
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
            int bills_id = Integer.parseInt(request.getParameter("bills_id"));
            Connection dbc = null;
            System.out.println("*******" + bills_id);
            Class.forName("com.mysql.jdbc.Driver");
            dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
            if (dbc != null) {
                System.out.println("Connection successful");
            }
            ResultSet bil2 = listresult.db_result.sel_bill2(dbc, bills_id);
            System.out.println("*******" + bills_id);
            ResultSet emp = listresult.db_result.get_Emp(dbc);
            ResultSet ded = listresult.db_result.get_ded_master(dbc);
            Calendar cal = Calendar.getInstance();
            java.sql.Date today = new java.sql.Date(cal.getTime().getTime());
        %>

        <form name="ra_bill_entry" action="ra_bill_entry_code.jsp" method="post">
            <table>
                <% while (bil2.next()) {
                        double amount = bil2.getDouble("amount");
                        double const_amount = bil2.getDouble("amount");
                %>
                <input type="hidden" name="bills_id" size="40" value="<%=bil2.getInt("bills_id")%>">


                <td>RA bill no</td>
                <% ResultSet c = listresult.db_result.sel_count(dbc, bil2.getString("wo_no"));
                        long count;
                        if (c.next()) {
                            count = c.getLong("count(*)");
                        } else {
                            count = 0;
                        }%>
                <td><input type="number" value="<%=count%>" readonly disabled name="ra_bill_no"><td/>
                <input type="hidden" name="ra_bill_no" value="<%=count%>" size="40" >

                <tr>
                    <td>Amount</td>
                    <td><input type="number" readonly disabled value="<%=amount%>"><td/>
                </tr> 
                <% while (ded.next()) {
                        String t = ded.getString("state");
                        if (t.equals("inactive")) {
                            continue;
                        }%>
                <tr>

                    <% ResultSet d = listresult.db_result.sel_ded_works3(dbc, ded.getString("label"), bil2.getString("wo_no"));
                    if (d.next()) {%>

                    <td><%=ded.getString("label")%></td>
                    <td><input type="text" readonly disabled <%double temp = (double) (const_amount * d.getFloat("value")) / 100;%> value="<%=temp%>" <% amount -= temp;%>name="<%=ded.getString("label")%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=d.getFloat("value")%>%</td>
                        <% } %>
                </tr>
                <% }%>
                <tr>
                    <td>Net Amount</td>
                    <td><input type="text" value="<%=amount%>" readonly disabled name="amount"></td>
                <input type="hidden" name="amount" value="<%=amount%>" size="40" >
                </tr>
                <tr>
                    <td>created_by</td>
                    <td><select name="created_by"">
                            <option value="">SELECT</option>
                            <% while (emp.next()) {%>
                            <option value="<%=emp.getString("emp_no")%>"><%=emp.getInt("emp_no")%>&nbsp&nbsp<%=emp.getString("emp_name")%></option>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>creation_date</td>
                    <td><input type=text id ="fromDateId" name="creation_date" value="<%=today%>" size=12 >&nbsp
                        <A HREF="#" onClick="cal1.select(document.forms[0].creation_date, 'anchor1', 'yyyy-MM-dd');
                                return false;" NAME="anchor1" ID="anchor1">
                            <img src="/Works_template/images/calendar.png" border="0">
                        </A>
                    </td>
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
