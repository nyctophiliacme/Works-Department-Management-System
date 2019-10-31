/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listresult;

import java.io.*;
import java.sql.*;

/**
 * @author Pransh Tiwari
 */
public class db_result {

    public static ResultSet get_Emp(Connection dbc) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        try {
            sql = "select emp_no,emp_name from employee order by emp_name,emp_no";
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from employee:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet get_works_enquiry(Connection dbc) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        try {
            sql = "select we_no,title from works_enquiry order by title,we_no";
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from works_enquiry:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet get_vendor(Connection dbc) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        try {
            sql = "select vendor_id,vendor_name from vendor_master order by vendor_name,vendor_id";
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from vendor:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet get_works_order(Connection dbc) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        try {
            sql = "select wo_no,title from works_order order by title,wo_no";
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from works_order:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet get_bills(Connection dbc) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        try {
            sql = "select b.bills_id,b.bills_no,w.title from bills b,works_order w where w.wo_no=b.wo_no order by w.title,b.bills_no";
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from bills:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet get_ra_bill(Connection dbc) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        try {
            sql = "select r.ra_bill_id,r.ra_bill_no,w.title from ra_bill r,bills b,works_order w where w.wo_no=b.wo_no and r.bills_id=b.bills_id order by w.title,r.ra_bill_no";
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from ra_bill:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet get_ded_master(Connection dbc) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        try {
            sql = "select * from deductions_master order by label";
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from deductions_master:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet get_bank(Connection dbc) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        try {
            sql = "select wo_no,vendor_id,expiry_date from bank_guarantee where wo_no!=\"\" order by wo_no";
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from get_bank_guarantee:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_bank(Connection dbc, String x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("WorkOrder No : " + x);
        try {
            sql = "select * from bank_guarantee where wo_no like '" + x + "'";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel Bank Guarantee:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_works_enquiry(Connection dbc, String x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("WorkEnquiry No : " + x);
        try {
            sql = "select * from works_enquiry w,employee e where we_no like '" + x + "' and e.emp_no=w.emp_no";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel Work Enquiry:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_works_order(Connection dbc, String x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("WorkOrder No : " + x);
        try {
            sql = "select * from works_order w,employee e where wo_no like '" + x + "' and e.emp_no=w.emp_no";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel Work Order:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_vendor(Connection dbc, int x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("Vendor Id : " + x);
        try {
            sql = "select * from vendor_master where vendor_id = '" + x + "'";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel Vendor Master:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_ded_master(Connection dbc, String x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("Label: " + x);
        try {
            sql = "select * from deductions_master where label like '" + x + "'";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel ded master:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet get_ded_works(Connection dbc) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        try {
            sql = "select * from deductions_works d,works_order w where w.wo_no=d.wo_no order by d.wo_no,d.label";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from get ded works:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_ded_works(Connection dbc, int x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("Deduction Works Id : " + x);
        try {
            sql = "select * from deductions_works where ded_works_id = '" + x + "'";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel Deductions Works Id:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_ded_works2(Connection dbc, String x, String y) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("Deduction Works label: " + x);
        System.out.println("Deduction Works wo_no: " + y);
        try {
            sql = "select value from deductions_works where label like  '" + x + "'and wo_no like '" + y + "'";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
            System.out.println(pst);
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel Deductions Works Id:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_bill1(Connection dbc, String x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("WorkOrder No : " + x);
        try {
            sql = "select * from bills where wo_no like '" + x + "'";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel bills1:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_bill2(Connection dbc, int x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("Bills Id : " + x);
        try {
            sql = "select * from bills where bills_id = '" + x + "'";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel bills2:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_count(Connection dbc, String x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("WorkOrder No : " + x);
        try {
            sql = "select count(*) from bills where wo_no like '" + x + "'";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel count:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_ded_works3(Connection dbc, String x, String y) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("Deduction Works label: " + x);
        try {
            sql = "select value from deductions_works where value!=0 and label like  '" + x + "'and wo_no like '" + y + "'";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
            System.out.println(pst);
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel Deductions Works Id:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_ra1(Connection dbc, String x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("WorkOrder No : " + x);
        try {
            sql = "select * from bills b,ra_bill r where b.wo_no like '" + x + "' and b.bills_id=r.bills_id order by r.ra_bill_no";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel ra1:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_ra2(Connection dbc, int x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("RA Bill Id : " + x);
        try {
            sql = "select * from ra_bill where ra_bill_id = '" + x + "'";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel ra_bill2:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_pay1(Connection dbc, String x) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        System.out.println("WorkOrder No : " + x);
        try {
            sql = "select p.pay_order_no,p.pay_order_id from pay_order p,ra_bill r,bills b where p.ra_bill_id=r.ra_bill_id and r.bills_id=b.bills_id and b.wo_no like '" + x + "' order by p.pay_order_no,p.pay_order_id";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel pay1:" + sqlMessage);
        }
        return rs;
    }

    public static ResultSet sel_pay2(Connection dbc) {
        ResultSet rs = null;
        String sql;
        PreparedStatement pst;
        try {
            sql = "select pay_order_id from pay_order order by pay_order_id desc limit 1";
            System.out.println(sql);
            pst = dbc.prepareStatement(sql);
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            String sqlMessage = e.getMessage();
            System.err.println("Message from sel pay2:" + sqlMessage);
        }
        return rs;
    }
}
