<%-- 
    Document   : billsreport_code
    Created on : Jul 10, 2015, 12:34:21 PM
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
        <title>Generate Bills Report</title>
    </head>
    <% try {
            SimpleDateFormat format;
            Date parsed;
            String bills_datestr = request.getParameter("bills_date");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = null;
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/works", "root", "root");

            format = new SimpleDateFormat("yyyy-MM-dd");
            parsed = format.parse(bills_datestr);
            java.sql.Date bills_date = new java.sql.Date(parsed.getTime());
            System.out.println(bills_date);
            if (con != null) {
                System.out.println("Connection successful");
            }

            File reportFile = new File(application.getRealPath("/report/report4.jasper"));
            Map parameters = new HashMap();
            parameters.put("expDate", bills_date);
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
