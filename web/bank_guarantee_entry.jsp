<%-- 
    Document   : bank_guarantee_entry
    Created on : Jun 25, 2015, 11:48:40 AM
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
        <title>Bank Guarantee Entry</title>
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
                if (document.bank_guarantee_entry.we_no.value != "" && document.bank_guarantee_entry.wo_no.value != "")
                {
                    alert("Please provide only one value...either we_no or wo_no");
                    return false;
                }
                if (document.bank_guarantee_entry.we_no.value == "" && document.bank_guarantee_entry.wo_no.value == "")
                {
                    alert("Please provide either we_no or wo_no");
                    document.bank_guarantee_entry.we_no.focus();
                    return false;
                }
                if (document.bank_guarantee_entry.vendor_id.value == "")
                {
                    alert("Please provide vendor_id");
                    document.bank_guarantee_entry.vendor_id.focus();
                    return false;
                }
                if ((document.bank_guarantee_entry.date_of_issue.value) >= (document.bank_guarantee_entry.expiry_date.value))
                {
                    alert("Error in dates...\nExpiry date should not be before date of issue");
                    document.bank_guarantee_entry.date_of_issue.focus();
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
            ResultSet we = listresult.db_result.get_works_enquiry(dbc);
            ResultSet ven = listresult.db_result.get_vendor(dbc);
            ResultSet wo = listresult.db_result.get_works_order(dbc);
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
                    <h4>Bank Guarantee Entry Form</h4>
                    <form name="bank_guarantee_entry" action="bank_guarantee_entry_code.jsp" method="post" onsubmit="return(validate());">
                        <table>
                            <tr>
                                <td>we no *</td>
                                <td><select name="we_no"">
                                        <option value="">SELECT</option>
                                        <% while (we.next()) {%>
                                        <option value="<%=we.getString("we_no")%>"><%=we.getString("we_no")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=we.getString("title")%></option>
                                        <%}%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>wo no *</td>
                                <td><select name="wo_no"">
                                        <option value="">SELECT</option>
                                        <% while (wo.next()) {%>
                                        <option value="<%=wo.getString("wo_no")%>"><%=wo.getString("wo_no")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=wo.getString("title")%></option>
                                        <%}%>
                                    </select>
                                </td>
                            </tr>
                            <td>Vendor Name *</td>
                            <td><select name="vendor_id"">
                                    <option value="">SELECT</option>
                                    <% while (ven.next()) {%>
                                    <option value="<%=ven.getInt("vendor_id")%>"><%=ven.getString("vendor_name")%></option>
                                    <%}%>
                                </select>
                            </td>
                            <tr>
                                <td>Date of issue</td>
                                <td><input type=text id ="fromDateId" name="date_of_issue" value="<%=today%>" size=12>&nbsp
                                    <A HREF="#" onClick="cal1.select(document.forms[0].date_of_issue, 'anchor1', 'yyyy-MM-dd');
                                            return false;" NAME="anchor1" ID="anchor1">
                                        <img src="/Works_template/images/calendar.png" border="0">
                                    </A>
                                </td>
                            </tr>
                            <tr>
                                <td>Expiry Date</td>
                                <td><input type=text id ="fromDateId" name="expiry_date" value="<%=today%>" size=12 >&nbsp
                                    <A HREF="#" onClick="cal1.select(document.forms[0].expiry_date, 'anchor1', 'yyyy-MM-dd');
                                            return false;" NAME="anchor1" ID="anchor1">
                                        <img src="/Works_template/images/calendar.png" border="0">
                                    </A>
                                </td>
                            </tr>
                            <tr>
                                <td>Amount</td>
                                <td><input type="text" value="0" name="amount"><td/>
                            </tr>
                            <tr>
                                <td>Bank Name</td>
                                <td><input type="text" name="bank_name"><td/>
                            </tr>
                            <tr>
                                <td>Branch Name</td>
                                <td><input type="text" name="branch_name"><td/>
                            </tr>
                            <tr>
                                <td>Account No</td>
                                <td><input type="number" name="account_no"><td/>
                            </tr>
                            <tr>
                                <td>IFSC code</td>
                                <td><input type="text" name="IFSC"><td/>
                            </tr>
                            <tr>
                                <td>MICR code</td>
                                <td><input type="text" name="MICR"><td/>
                            </tr>
                            <tr>
                                <td>Bank Guarantee Code</td>
                                <td><input type="text" name="bank_guarantee_code"><td/>
                            </tr>
                            <tr>
                                <td><input type="submit" value="Submit" style="width: 70px; height: 25px"><td/>
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
