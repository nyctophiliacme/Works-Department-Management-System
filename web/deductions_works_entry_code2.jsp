<%-- 
    Document   : deductions_entry_code2
    Created on : Jun 25, 2015, 3:10:48 PM
    Author     : Pransh Tiwari
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*, java.io.*, java.text.SimpleDateFormat, java.util.Date, listresult.*"%>
<!DOCTYPE html>
<%
    Connection dbc = null;
    Class.forName("com.mysql.jdbc.Driver");
    dbc = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
    if (dbc != null) {
        System.out.println("Connection successful");
    }
    ResultSet wo = listresult.db_result.get_works_order(dbc);
    ResultSet ded = listresult.db_result.get_ded_master(dbc);
%>


<%
    while (ded.next()) {
        String t = ded.getString("state");
        if (t.equals("inactive")) {
            continue;
        }

        String temp = ded.getString("label");

        String wo_no = request.getParameter("wo_no");
        System.out.println("ZZZZZZZZZZZZZZZZZZZ" + wo_no);
        ResultSet d = listresult.db_result.sel_ded_works2(dbc, temp, wo_no);

        String label = temp;
        float value = (float) -1;
        System.out.println(request.getParameter(ded.getString("label")));
        if (request.getParameter(ded.getString("label")) != "") {
            value = Float.parseFloat(request.getParameter(ded.getString("label")));
        }

        System.out.println(wo_no);
        System.out.println(label);
        System.out.println(value);
        if (d.next()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = null;
                PreparedStatement st = null;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
                if (con != null) {
                    System.out.println("Connection successful");
                }
                String sql = "update deductions_works set value=? where wo_no=? and label=?;";
                st = con.prepareStatement(sql);

                st.setFloat(1, value);
                st.setString(2, wo_no);
                st.setString(3, label);

                st.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = null;
                PreparedStatement st = null;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
                if (con != null) {
                    System.out.println("Connection successful");
                }
                String sql = "insert into deductions_works(wo_no,label,value) values(?,?,?);";
                st = con.prepareStatement(sql);
                st.setString(1, wo_no);
                st.setString(2, label);
                st.setFloat(3, value);

                st.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>
<html>
    <head>
        <title>Deductions-Works Relation Entry</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    </head>

    <body>

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
                    <a href="deductions_works_entry.jsp">Click here for entering more data</a>
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