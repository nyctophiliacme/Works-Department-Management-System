<%-- 
    Document   : pay_order_report_code
    Created on : Jul 13, 2015, 4:59:25 PM
    Author     : Pransh Tiwari
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*,java.io.*,java.lang.*" %>
<%@ page import="java.text.*,java.sql.*"%>
<%@page import="java.sql.*, java.io.*, java.text.SimpleDateFormat, java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pay Order Report</title>
    </head>
    <% try {
            int pay_order_id = Integer.parseInt(request.getParameter("pay_order_id"));
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = null;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");
            System.out.println(pay_order_id);
            if (con != null) {
                System.out.println("Connection successful");
            }

            File reportFile = new File(application.getRealPath("/report/report1.jasper"));
            Map parameters = new HashMap();
            parameters.put("payOrderId", pay_order_id);
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, con);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();
            outStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</html>
