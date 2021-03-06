package org.gk.assetmgment.servlet;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.gk.assetmgment.dto.Billsummary;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

@WebServlet({ "/AddBillDetails", "/addbilldetails" })
public class AddBillDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost/test_assetmgnt";
    private String User = "root";
    private String Password = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		java.sql.Connection conn = null;
		PreparedStatement prepstm =null;
		int rc = 0;
		ResultSet rs;
		int genBillId = 0;
		Billsummary BillDetails = new Billsummary();
		RequestDispatcher distpatch = request.getRequestDispatcher("BillSummaryResponse.jsp");
		
		
		BillDetails.setLeaseId(Integer.parseInt(request.getParameter("leaseId")));
		BillDetails.setLeaseDeed(request.getParameter("leaseNumber"));
		BillDetails.setBillMonth(request.getParameter("billingMonth"));
		BillDetails.setLeaseAmt(Double.parseDouble(request.getParameter("leaseAmt")));;
		BillDetails.setElectricityCharge(Double.parseDouble(request.getParameter("elecAmt")));
		BillDetails.setWaterCharge(Double.parseDouble(request.getParameter("waterCharge")));
		BillDetails.setMiscCharge1(Double.parseDouble(request.getParameter("misc1ChargeAmt")));
		BillDetails.setMiscCharge1comm(request.getParameter("misc1ChargeComm"));
		BillDetails.setMiscCharge2(Double.parseDouble(request.getParameter("misc2ChargeAmt")));
		BillDetails.setMiscCharge2comm(request.getParameter("misc2ChargeComm"));		
		BillDetails.setMiscCharge3(Double.parseDouble(request.getParameter("misc3ChargeAmt")));
		BillDetails.setMiscCharge3comm(request.getParameter("misc3ChargeComm"));
		BillDetails.setFineAmt(Double.parseDouble(request.getParameter("fineChargeAmt")));		
		BillDetails.setFineAmtcomm(request.getParameter("fineChargeComm"));
		BillDetails.setBillDate(request.getParameter("billingDate"));
		BillDetails.setPaidStatus(" ");
		BillDetails.setTenantName(request.getParameter("Tenantname"));
		
		//System.out.println("The total amount is  : " + BillDetails.getTotalAmt());

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println("Not abl to find MYSQL Drivers");
			e.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection(url, User, Password);
		} catch (SQLException e) {
			System.out.println("Not abl to get Connected to MYSQL");
			e.printStackTrace();
		}
		String insertquery = "INSERT INTO billsummary"
				+ "( LEASEID, LEASEDEED, BILLGENDT, BILLMONTH, LEASEAMT, "
				+ "ELECTRICITY, WATER, MISC1, MISC1COM, MISC2,"
				+ " MISC2COM, MISC3, MISC3COM, FINE, FINECOM,"
				+ " TOTAL, PAIDSTATUS,TENANTNAME) "
				+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			prepstm = (PreparedStatement) conn.prepareStatement(insertquery,Statement.RETURN_GENERATED_KEYS);
			
			//Populating the sql fields
			prepstm.setInt(1, BillDetails.getLeaseId());
			prepstm.setString(2, BillDetails.getLeaseDeed());
			prepstm.setString(3, BillDetails.getBillDate());  
			prepstm.setString(4, BillDetails.getBillMonth());
			prepstm.setDouble(5, BillDetails.getLeaseAmt());
			prepstm.setDouble(6, BillDetails.getElectricityCharge());
			prepstm.setDouble(7, BillDetails.getWaterCharge());
			prepstm.setDouble(8, BillDetails.getMiscCharge1());
			prepstm.setString(9, BillDetails.getMiscCharge1comm());
			prepstm.setDouble(10, BillDetails.getMiscCharge2());
			prepstm.setString(11,BillDetails.getMiscCharge2comm());
			prepstm.setDouble(12, BillDetails.getMiscCharge3());
			prepstm.setString(13, BillDetails.getMiscCharge3comm());
			prepstm.setDouble(14, BillDetails.getFineAmt());
			prepstm.setString(15, BillDetails.getFineAmtcomm());
			prepstm.setDouble(16,BillDetails.getTotalAmt());
			prepstm.setString(17,BillDetails.getPaidStatus());
			prepstm.setString(18,BillDetails.getTenantName());
		} catch (SQLException e) {
			System.out.println("Not able to prepare insert statement");
			e.printStackTrace();
		}
		
		try {
			rc  = prepstm.executeUpdate();
			System.out.println("Return code of insert is   :" + rc);
			rs = prepstm.getGeneratedKeys();
			rs.next();
			genBillId = rs.getInt(1);
			BillDetails.setBillId(genBillId);
		} catch (SQLException e) {
			System.out.println("Not able to execute insert successfully");
			e.printStackTrace();
		}
		
		if (rc > 0){
			request.getSession().setAttribute("returndetails", BillDetails);
		}else{
			request.getSession().setAttribute("returndetails", "fail");
		}
		distpatch.forward(request, response);
		
	}

}
