package org.gk.assetmgment.servlet;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gk.assetmgment.dto.Billsummary;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

@WebServlet({ "/PaymentConfirm", "/paymentconfirm" })
public class PaymentConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost/test_assetmgnt";
	private String User = "root";
	private String Password = "";
	private String returnmsg = null;
	public java.sql.Connection conn = null;
	public java.sql.PreparedStatement readstm = null;
	public java.sql.PreparedStatement updatestm = null;
	List ls_paymentrecords = new ArrayList<>();
	ResultSet rs =null;
	String tempvar= null;
	Billsummary paymentconf = new Billsummary();	
	private int update_cnt = 0;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ls_paymentrecords.clear();
		populateReturnArray();
		returnmsg = "initial";
		RequestDispatcher dispatch = request.getRequestDispatcher("PaymentSummary.jsp");
		request.getSession().setAttribute("paymentdetails",ls_paymentrecords);
		request.getSession().setAttribute("returnmsg",returnmsg);
		dispatch.forward(request, response);

	} 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		update_cnt = 0;
		ls_paymentrecords.clear();
		
		if (request.getParameterValues("paidstatus") != null){
			update_cnt = updatePayment(request,response);
			returnmsg = "Total Rows Updated : " + update_cnt;				
		}else{
			returnmsg ="No Row selected";
		}
		
		populateReturnArray();
		
		RequestDispatcher dispatch = request.getRequestDispatcher("PaymentSummary.jsp");
		request.getSession().setAttribute("paymentdetails",ls_paymentrecords);
		request.getSession().setAttribute("returnmsg",returnmsg);
		dispatch.forward(request, response);
	}

	public void populateReturnArray(){
		String readyPaymentQuery = "SELECT BILLID, LEASEID, LEASEDEED, TENANTNAME, BILLGENDT,"
				+ "BILLMONTH, LEASEAMT, ELECTRICITY, WATER, MISC1,"
				+ " MISC1COM, MISC2, MISC2COM, MISC3, MISC3COM, "
				+ "FINE, FINECOM, TOTAL, PAIDSTATUS "
				+ "FROM billsummary"
				+ " WHERE PAIDSTATUS <> ? ";
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println("PaymentConfirm: MySql Driver Class Not Found");
			e.printStackTrace();
		}

		try {
			conn= DriverManager.getConnection(url,User,Password);
		} catch (SQLException e) {
			System.out.println("PaymentConfirm: Not able to get MySql Connection");
			e.printStackTrace();
		}

		try {
			readstm = conn.prepareStatement(readyPaymentQuery,Statement.RETURN_GENERATED_KEYS);
			readstm.setString(1, "Y");
		} catch (SQLException e) {
			System.out.println("PaymentConfirm: Prepare Statement Error");
			e.printStackTrace();
		}

		try {
			rs = (ResultSet) readstm.executeQuery();
			while(rs.next()){
				tempvar = rs.getInt(1)+ "," +rs.getInt(2)+ "," + rs.getString(3)+ "," +
						rs.getString(4)+ "," + rs.getDate(5) + "," + rs.getString(6) + "," +
						rs.getDouble(7) + "," + rs.getDouble(8) + "," + rs.getDouble(9)+ ","+
						rs.getDouble(10) + "," +rs.getDouble(12) + ","+ rs.getDouble(14) + "," +
						rs.getDouble(16) + "," + rs.getDouble(18) + "," +rs.getString(19) ; 
				ls_paymentrecords.add(tempvar);

				paymentconf.setBillId(rs.getInt(1));
				paymentconf.setLeaseId(rs.getInt(2));
				paymentconf.setLeaseDeed(rs.getString(3));
				paymentconf.setBillDate(rs.getString(5));	
				paymentconf.setBillMonth(rs.getString(6));
				paymentconf.setLeaseAmt(rs.getDouble(7));
				paymentconf.setElectricityCharge(rs.getDouble(8));
				paymentconf.setWaterCharge(rs.getDouble(9));
				paymentconf.setMiscCharge1(rs.getDouble(10));
				paymentconf.setMiscCharge1comm(rs.getString(11));
				paymentconf.setMiscCharge2(rs.getDouble(12));
				paymentconf.setMiscCharge2comm(rs.getString(13));
				paymentconf.setMiscCharge3(rs.getDouble(14));
				paymentconf.setMiscCharge3comm(rs.getString(15));
				paymentconf.setFineAmt(rs.getDouble(16));
				paymentconf.setFineAmtcomm(rs.getString(17));
				paymentconf.setTotalAmt(rs.getDouble(18));
				paymentconf.setPaidStatus(rs.getString(19));
				paymentconf.setTenantName(rs.getString(4));
			}	
		} catch (SQLException e) {
			System.out.println("PaymentConfirm: MySql Erro while executing query");
			e.printStackTrace();
		}

	}
	public int updatePayment(HttpServletRequest request, HttpServletResponse response){
		int temp_billid = 0;
		int query_updatedcnt=0;
		int method_updatedcnt=0;
		String updatequery =" update billsummary set PAIDSTATUS = ? where BILLID = ?";
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println("PaymentConfirm: MySql Driver Class Not Found");
			e.printStackTrace();
		}

		try {
			conn= DriverManager.getConnection(url,User,Password);
		} catch (SQLException e) {
			System.out.println("PaymentConfirm: Not able to get MySql Connection");
			e.printStackTrace();
		}

		try {
			updatestm = conn.prepareStatement(updatequery);
			updatestm.setString(1, "Y");
		} catch (SQLException e) {
			System.out.println("PaymentUpdate: Prepare Statement Error1");
			e.printStackTrace();
		}

		String [] paystatus = request.getParameterValues("paidstatus");
		
		for (String bill:paystatus){
			temp_billid  = Integer.parseUnsignedInt(bill.trim());
			System.out.println(" bill int : " + temp_billid);
			try {
				updatestm.setInt(2, temp_billid);
			} catch (SQLException e) {
				System.out.println("PaymentUpdate: Prepare Statement Error2");
				e.printStackTrace();
			}
			try {
				query_updatedcnt = updatestm.executeUpdate();
				method_updatedcnt = method_updatedcnt + query_updatedcnt;
			} catch (SQLException e) {
				System.out.println("PaymentUpdate: Update Statement Error");
				e.printStackTrace();
			} 
			System.out.println(bill);
		} 

		return method_updatedcnt;
	}


}
