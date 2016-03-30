<%-- 
    Document   : works_enquiry_entry
    Created on : Jun 25, 2015, 11:03:06 AM
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
        <title>Works Enquiry Entry</title>
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
        <script type="text/javascript">
            //Form validation
            function validate()
            {
                if (document.works_enquiry_entry.we_no.value == "")
                {
                    alert("Please provide we_no");
                    document.works_enquiry_entry.we_no.focus();
                    return false;
                }
                if (document.works_enquiry_entry.emp_no.value == "")
                {
                    alert("Please provide emp_no");
                    document.works_enquiry_entry.emp_no.focus();
                    return false;
                }
                if (document.works_enquiry_entry.title.value == "")
                {
                    alert("Please provide title");
                    document.works_enquiry_entry.title.focus();
                    return false;
                }
                if ((document.works_enquiry_entry.we_date.value) >= (document.works_enquiry_entry.we_expiry_date.value))
                {
                    alert("Error in dates...\nExpiry date should not be before entry date");
                    document.works_enquiry_entry.we_date.focus();
                    return false;
                }
                return true;
            }
        </script>

        <%
            Connection dbc = null;
            Class.forName("com.mysql.jdbc.Driver");
            dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
            if (dbc != null) {
                System.out.println("Connection successful");
            }
            ResultSet emp = listresult.db_result.get_Emp(dbc);
            Calendar cal = Calendar.getInstance();
            java.sql.Date today = new java.sql.Date(cal.getTime().getTime());
        %>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                        <div style="float:right;clear: left"><img src="images/OfficialBARCLogo.jpg" alt="LOGO" width="100" height="100" >
                        </div>   
                        <h1><a href="index.html"><span class="logo_colour">Bhabha Atomic Research Centre</span></a></h1>
                        <h2>Government Of India</h2>
                    </div>
                </div>
                <nav>
                    <ul class="sf-menu" id="nav">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="#">Reports</a>
                            <ul>
                                <li><a href="#">Bank Guarantee Expire</a>
                                    <ul>
                                        <li><a href="billsreport.jsp">From</a></li>
                                        <li><a href="billsReport2.jsp">From - Till</a></li>
                                    </ul>
                                </li>
                                <li><a href="pay_order_report.jsp">Payment Of Bill</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Works</a>
                            <ul>
                                <li><a href="#">Works Enquiry</a>
                                    <ul>
                                        <li><a href="works_enquiry_entry.jsp">Entry</a></li>
                                        <li><a href="works_enquiry_update.jsp">Update</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Works Order</a>
                                    <ul>
                                        <li><a href="works_order_entry.jsp">Entry</a></li>
                                        <li><a href="works_order_update.jsp">Update</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>


                        <li><a href="#">Vendor</a>
                            <ul>
                                <li><a href="#">Vendor Master</a>
                                    <ul>
                                        <li><a href="vendor_master_entry.jsp">Entry</a></li>
                                        <li><a href="vendor_master_update.jsp">Update</a></li>
                                    </ul>
                                </li>
                                <li><a href="vendor_works_relation_entry.jsp">Vendor Works Relation</a></li>
                            </ul>
                        </li>

                        <li><a href="#">Bank Guarantee</a>
                            <ul>
                                <li><a href="bank_guarantee_entry.jsp">Entry</a></li>
                                <li><a href="bank_guarantee_update.jsp">Update</a></li>
                            </ul>
                        </li>


                        <li><a href="#">Deductions</a>
                            <ul>
                                <li><a href="#">Deductions Master</a>
                                    <ul>
                                        <li><a href="deductions_master_entry.jsp">Entry</a></li>
                                        <li><a href="deductions_master_update.jsp">Update</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Deductions Works Relation</a>
                                    <ul>
                                        <li><a href="deductions_works_entry.jsp">Entry</a></li>
                                        <li><a href="deductions_works_update.jsp">Update</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>


                        <li><a href="#">Bills</a>
                            <ul>
                                <li><a href="bills_entry.jsp">Bills Master</a></li>
                                <li><a href="ra_bill_entry.jsp">Running Accounts Bill</a></li>
                                <li><a href="pay_order_entry.jsp">Pay Order</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </header>
            <div id="site_content">
                <div class="gallery">
                    <ul class="images">
                        <li class="show"><img width="950" height="300" src="images/barc.jpg" alt="photo_one" /></li>
                        <li><img width="950" height="300" src="images/AVN_BARC_102707f.jpg" alt="photo_two" /></li>
                        <li><img width="950" height="300" src="images/19TH_BARC_661928f.jpg" alt="photo_three" /></li>
                    </ul>
                </div>
                <div id="sidebar_container">
                    <div class="sidebar">
                        <h3>Quick Links</h3>
                        <h5>For Entering Data</h5>
                        <ul>
                            <li><a href="vendor_master_entry.jsp">Vendor Master</a></li>
                            <li><a href="works_enquiry_entry.jsp">Works Enquiry</a></li>
                            <li><a href="deductions_master_entry.jsp">Deductions Master Entry</a></li>
                            <li><a href="vendor_works_relation_entry.jsp">Vendor Works Relation</a></li>
                            <li><a href="works_order_entry.jsp">Works Order</a></li>
                            <li><a href="bank_guarantee_entry.jsp">Bank Guarantee</a></li>
                            <li><a href="deductions_works_entry.jsp">Deductions Works Relation</a></li>
                            <li><a href="bills_entry.jsp">Bills</a></li>
                            <li><a href="ra_bill_entry.jsp">Running Accounts Bill</a></li>
                            <li><a href="pay_order_entry.jsp">Pay Order</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content">

                    <h4>Works Enquiry Entry Form</h4>
                    <form name="works_enquiry_entry" action="works_enquiry_entry_code.jsp" method="post" onsubmit="return(validate());">
                        <table>
                            <tr>
                                <td>we no *</td>
                                <td><input type="text" name="we_no"><td/>
                            </tr>
                            <tr>
                                <td>Emp no *</td>
                                <td><select name="emp_no"">
                                        <option value="">SELECT</option>
                                        <% while (emp.next()) {%>
                                        <option value="<%=emp.getInt("emp_no")%>"><%=emp.getInt("emp_no")%>&nbsp&nbsp<%=emp.getString("emp_name")%></option>
                                        <%}%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Start Date</td>
                                <td><input type=text id ="fromDateId" name="we_date" value="<%=today%>" size=12 >&nbsp
                                    <A HREF="#" onClick="cal1.select(document.forms[0].we_date, 'anchor1', 'yyyy-MM-dd');
                                            return false;" NAME="anchor1" ID="anchor1">
                                        <img src="/Works_template/images/calendar.png" border="0">
                                    </A>
                                </td>
                            </tr>
                            <tr>
                                <td>Expiry Date</td>
                                <td><input type=text id ="fromDateId" name="we_expiry_date" value="<%=today%>" size=12 >&nbsp
                                    <A HREF="#" onClick="cal1.select(document.forms[0].we_expiry_date, 'anchor1', 'yyyy-MM-dd');
                                            return false;" NAME="anchor1" ID="anchor1">
                                        <img src="/Works_template/images/calendar.png" border="0">
                                    </A>
                                </td>
                            </tr>
                            <tr>
                                <td>Title *</td>
                                <td><input type="text" name="title"><td/>
                            </tr>
                            <tr>
                                <td>Short Description</td>
                                <td><textarea name="short_desc" rows="5" cols="36"></textarea><td/>
                            </tr>
                            <tr>
                                <td>Head of Account</td>
                                <td><input type="text" name="head_of_account"><td/>
                            </tr>
                            <tr>
                                <td>Comp no</td>
                                <td><input type=number name="comp_no"><td/>
                            </tr>
                            <tr>
                                <td>Amount</td>
                                <td><input type="text" value="0" name="amount"><td/>
                            </tr>
                            <tr>
                                <td>Escalation Amount</td>
                                <td><input type="text" value="0" name="escalation_amount"><td/>
                            </tr>
                            <tr>
                                <td>Place</td>
                                <td><input type="text" name="place"><td/>
                            </tr>
                            <tr>
                                <td>State</td>
                                <td>Active<input type="radio" checked name="state" value="active">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                                    Inactive<input type="radio" name="state" value="inactive"><td/>
                            </tr>
                            <tr>
                                <td>Creation Date</td>
                                <td><input type=text id ="fromDateId" name="creation_date" value="<%=today%>" size=12 >&nbsp
                                    <A HREF="#" onClick="cal1.select(document.forms[0].creation_date, 'anchor1', 'yyyy-MM-dd');
                                            return false;" NAME="anchor1" ID="anchor1">
                                        <img src="/Works_template/images/calendar.png" border="0">
                                    </A>
                                </td>
                            </tr>
                            <tr/>
                            <td><input type="submit" value="Submit" style="width: 70px"><td/>
                            <tr/>
                        </table>
                    </form>


                </div>
            </div>
            <footer>
                <p>Copyright &copy; Pransh Tiwari </p>
            </footer>
        </div>
        <p>&nbsp;</p>
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
