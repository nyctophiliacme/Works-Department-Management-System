<%-- 
    Document   : works_enquiry_update_code
    Created on : Jul 1, 2015, 10:54:08 AM
    Author     : Pransh Tiwari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, listresult.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Works Enquiry Update</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <script src="/Works_template/js/CalendarPopup.js"  type="text/javascript" ></script>
        <script LANGUAGE="JavaScript" ID="js1" type="text/javascript">
            var cal1 = new CalendarPopup();
        </script>
    </head>
    <%
        String we_no = request.getParameter("we_no");
        Connection dbc = null;
        Class.forName("com.mysql.jdbc.Driver");
        dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
        if (dbc != null) {
            System.out.println("Connection successful");
        }
        ResultSet wen = listresult.db_result.sel_works_enquiry(dbc, we_no);
        ResultSet emp = listresult.db_result.get_Emp(dbc);

    %>



    <form name="works_enquiry_update_code" action="works_enquiry_update_code2.jsp" method="post" onsubmit="return(validate());">
        <table>

            <% while (wen.next()) {%>

            <input type="hidden" size="40" name="we_no" value="<%=wen.getString("we_no")%>">
            <tr>
                <td>Emp no</td>
                <td><select name="emp_no"">
                        <option value="<%=wen.getInt("w.emp_no")%>"><%=wen.getInt("w.emp_no")%>&nbsp&nbsp<%=wen.getString("e.emp_name")%></option>
                        <% while (emp.next()) {%>
                        <option value="<%=emp.getInt("emp_no")%>"><%=emp.getInt("emp_no")%>&nbsp&nbsp<%=emp.getString("emp_name")%></option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Start Date</td>
                <td><input type="text" readonly disabled name="we_date" value="<%=wen.getDate("w.we_date")%>"></td>     
            </tr>
            <tr>
                <td>Expiry Date</td>
                <td><input type="text" readonly disabled name="we_expiry_date" value="<%=wen.getDate("w.we_expiry_date")%>"></td>
            </tr>
            <tr>
                <td>Extended Expiry Date</td>
                <td><input type=text id ="fromDateId" name="extended_expiry_date" value="<%=wen.getDate("w.extended_expiry_date")%>" size=12>&nbsp
                    <A HREF="#" onClick="cal1.select(document.forms[0].extended_expiry_date, 'anchor1', 'yyyy-MM-dd');
                            return false;" NAME="anchor1" ID="anchor1" >
                        <img src="/Works_template/images/calendar.png" border="0">
                    </A>
                </td>
            </tr>
            <tr>
                <td>Title</td>
                <td><input type="text" readonly disabled value="<%=wen.getString("w.title")%>"></td>  
            </tr>
            <tr>
                <td>Short Description</td>
                <td><textarea name="short_desc" readonly disabled rows="5" cols="36"><%=wen.getString("w.short_desc")%></textarea><td/>
            </tr>
            <tr>
                <td>Head of Account</td>
                <td><input type="text" readonly disabled value="<%=wen.getString("w.head_of_account")%>"></td> 
            </tr>
            <tr>
                <td>Comp no</td>
                <td><input type="text" readonly disabled value="<%=wen.getInt("w.comp_no")%>"></td> 
            </tr>
            <tr>
                <td>Amount</td>
                <td><input type="text" readonly disabled value="<%=wen.getFloat("w.amount")%>"></td> 
            </tr>
            <tr>
                <td>Escalation Amount</td>
                <td><input type="text" name="escalation_amount" value="<%=wen.getFloat("w.escalation_amount")%>"></td> 
            </tr>
            <tr>
                <td>Place</td>
                <td><input type="text" readonly disabled value="<%=wen.getString("w.place")%>"></td> 
            </tr>
            <tr>
                <td>State</td>
                <td>Active<input type="radio" <% if (wen.getString("state").equals("active")) { %> checked <% } %>name="state" value="active">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                    Inactive<input type="radio" <% if (wen.getString("state").equals("inactive")) { %> checked <% }%>name="state" value="inactive"><td/>
            </tr>
            <tr>
                <td>Creation Date</td>
                <td><input type="text" readonly disabled value="<%=wen.getDate("w.creation_date")%>"></td>                   
            </tr>
            <% }%>
            <tr>
                <td><input type="submit" value="Submit" style="width: 70px"><td/>
            <tr/>
        </table>
    </form>

</html> 
