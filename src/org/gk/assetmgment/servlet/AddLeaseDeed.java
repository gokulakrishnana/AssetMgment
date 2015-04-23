package org.gk.assetmgment.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.gk.assetmgment.dto.AssetFree;
import org.gk.assetmgment.dto.LeaseDeedDetails;
import org.omg.PortableServer.ForwardRequest;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class AddLeaseDeed
 */
@WebServlet(
		description = "Lease Deed Add", 
		urlPatterns = { 
				"/AddLeaseDeed", 
				"/addleasedeed"
		})
public class AddLeaseDeed extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost/test_assetmgnt";
    private String User = "root";
    private String Password = "";
    java.sql.Connection conn = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int DeedId=0;
		String leaseNumber 			= request.getParameter("leaseNumber");
		String leaseLandLordName 	= request.getParameter("leaseLandLord");
		String leaseTenant1Name 	= request.getParameter("leaseTenant1");
		String leaseTenant2Name 	= request.getParameter("leaseTenant2");
		String leaseTenant3Name  	= request.getParameter("leaseTenant3");
		String leaseStartDate 		= request.getParameter("leaseStartDate").replaceAll("/", "-");
		String leaseEndDate 		= request.getParameter("leaseEndDate").replaceAll("/", "-");;
		String leaseTerminationDate = request.getParameter("leaseEndDate").replaceAll("/", "-");;
		String stringleaseDeedAmt  = request.getParameter("leaseDeedAmt");
		String assetid[] = request.getParameterValues("assetid");
		float leaseDeedAmt = Float.parseFloat(stringleaseDeedAmt);
		System.out.println("leaseStartDate   : " + leaseStartDate  + ",  leaseEndDate  :  " + leaseEndDate);
		char   leaseStatus 			= 'O';
		if (leaseTerminationDate == null || leaseTerminationDate == ""){
			leaseTerminationDate.concat(leaseEndDate);
		}
		java.util.Date stDate = null;
		java.util.Date endDate = null;
		
		LeaseDeedDetails leaseDetails = new LeaseDeedDetails();

		leaseDetails.setLeaseNumber(leaseNumber);
		leaseDetails.setLeaseLandLordName(leaseLandLordName);
		leaseDetails.setLeaseTenant1Name(leaseTenant1Name);
		leaseDetails.setLeaseTenant2Name(leaseTenant2Name);
		leaseDetails.setLeaseTenant3Name(leaseTenant3Name);
		leaseDetails.setLeaseStartDate(leaseStartDate);
		leaseDetails.setLeaseEndDate(leaseEndDate);
		leaseDetails.setLeaseTerminationDate(leaseTerminationDate);
		leaseDetails.setLeaseStatus("O");
		leaseDetails.setLeaseDeedAmt(leaseDeedAmt);
		

		try{
		    Class.forName(driver);
		    conn = DriverManager.getConnection(url,User,Password);	    

		}catch(SQLException | ClassNotFoundException e){
			
		}
		
		try{
			 getLeaseDeedId(leaseDetails,conn);
			 DeedId = leaseDetails.getDeedId(); 
		}catch(Exception e)
		{
			System.out.println("Error");
		}
	
		/*
		 *  Here we are using the DeedId created and map it to assets choosen
		 */
		AssetFree freeAssetDetails = new AssetFree();
		freeAssetDetails.setAssetid(assetid);
		freeAssetDetails.setDeedId(DeedId);
		int hi = insertDeedAsset(freeAssetDetails, conn);
		
		/*
		 * we are sending back our response
		 */
		request.getSession().setAttribute("leaseDetails", leaseDetails); 
		RequestDispatcher leaseaddsuccess = request.getRequestDispatcher("LeaseAddSuccessPage.jsp");
		leaseaddsuccess.forward(request, response);
	}
	
	public void getLeaseDeedId(LeaseDeedDetails leaseDetails,java.sql.Connection conn) throws  SQLException, ClassNotFoundException{
		
	    ResultSet rs;
	    int DeedId = 0;
	    String Insertquery = "insert into leasedeed (LEASEDEED,STDATE,ENDDATE,TERMDATE,LEASEAMT,TENANT1,TENANT2,TENANT3,OWNER,STATUS)" +
	        "values (?,?,?,?,?,?,?,?,?,?)";
	    // Database connections	    
	    //Preparing statement for inserting
	    
	    if (conn == null) {
	    	conn.close();
	    	System.out.println("Connection not obtained");
	    } else{
	    	System.out.println("Preparing insert statment");
	    }
	    try {
	    java.sql.PreparedStatement prepInsertquery = conn.prepareStatement(Insertquery,Statement.RETURN_GENERATED_KEYS);
	    prepInsertquery.setString(1, leaseDetails.getLeaseNumber());
	    prepInsertquery.setString(2,leaseDetails.getLeaseStartDate());
	    prepInsertquery.setString(3, leaseDetails.getLeaseEndDate());
	    prepInsertquery.setString(4,leaseDetails.getLeaseTerminationDate());
	    prepInsertquery.setFloat (5, leaseDetails.getLeaseDeedAmt());
	    prepInsertquery.setString(6,leaseDetails.getLeaseTenant1Name());
	    prepInsertquery.setString(7,leaseDetails.getLeaseTenant2Name());
	    prepInsertquery.setString(8, leaseDetails.getLeaseTenant3Name());
	    prepInsertquery.setString(9,leaseDetails.getLeaseLandLordName());
	    prepInsertquery.setString(10,leaseDetails.getLeaseStatus());

	    //System.out.println(":::::::prepared::::::::::");
	    DeedId = prepInsertquery.executeUpdate();
	    
	    //System.out.println(":::::::executed::::::::::");
	    rs=prepInsertquery.getGeneratedKeys();
	    
	    //System.out.println(":::::::getting key::::::::::");
	    rs.next();
	    DeedId=rs.getInt(1);
	    
	    System.out.println("Your lease deed id is : "+ DeedId);
	    leaseDetails.setDeedId(DeedId);
	    } catch (SQLException e){
		    conn.rollback();
		    e.printStackTrace();
	    }
	    
	}	
	public int insertDeedAsset(AssetFree freeAssetDetails, java.sql.Connection conn) {
		
		int deedId = freeAssetDetails.getDeedId();
		int assetId = 0;
		int insert_rs =0;
	    String Insertquery = "insert into assetdeedref (DEEDID,ASSETID)" +
		        "values (?,?)";
	    try {
			java.sql.PreparedStatement prepInsertquery = conn.prepareStatement(Insertquery,Statement.RETURN_GENERATED_KEYS);
			prepInsertquery.setInt(1,deedId );
			String assetIds[] = freeAssetDetails.getAssetid();
			for(String assetid:assetIds) {
				assetId = Integer.parseInt(assetid);
				prepInsertquery.setInt(2, assetId);
				insert_rs = prepInsertquery.executeUpdate();
				System.out.println("asset ids selected  : " + assetid);
			}
		} catch (SQLException e) {
			System.out.println("Error while inserting into assetdeedref table for asset : " + assetId);
			e.printStackTrace();
		}

		return 0;
		
	}
}

