package org.gk.assetmgment.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.gk.assetmgment.dto.Assetdetail;
import org.gk.assetmgment.services.Addassetauthservice;
import com.mysql.jdbc.PreparedStatement;
/**
 * Servlet implementation class AssetAddAuth
 */
@WebServlet({ "/AssetAddAuth", "/assetaddauth" })
public class AssetAddAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int rowId;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String assetname 	    = request.getParameter("assetname");
	String assetstreetname 	= request.getParameter("assetstreetname");
	String assetaddln1 		= request.getParameter("assetaddln1");
	String assetaddln2 		= request.getParameter("assetaddln2");
	String assetunitnumber 	= request.getParameter("assetunitnumber");
	String assetdoornum 	= request.getParameter("assetdoornum");
	String assetpincode 	= request.getParameter("assetpincode");
		
		
	Assetdetail assdet = new Assetdetail();
	
	assdet.setAssetname(assetname);
	assdet.setAssetstreetname(assetstreetname);
	assdet.setAssetaddln1(assetaddln1);
	assdet.setAssetaddln2(assetaddln2);
	assdet.setAssetunitnumber(assetunitnumber);
	assdet.setAssetdoornum(assetdoornum);
	assdet.setAssetpincode(assetpincode);
	
	try {
		rowId = getAssetId(assdet);
		assdet.setAssetid(rowId);
		request.getSession().setAttribute("assetdetails", assdet);
		RequestDispatcher dispatch = request.getRequestDispatcher("AssetAddSucessPage.jsp");
		dispatch.forward(request, response);
	}  catch (SQLException e) {
		 e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	}
	
	public int getAssetId( Assetdetail assdet) throws  SQLException, ClassNotFoundException{
	    String driver = "com.mysql.jdbc.Driver";
	    String url = "jdbc:mysql://localhost/test_assetmgnt";
	    String User = "root";
	    String Password = "";
	    ResultSet rs;
	    int rowid = 0;
//************************************************************************************************************************************************	    
/*	    String insertQuery1 =
	    		"INSERT INTO assetdetails (ASSETNAME,ASSETST,ASSETUNIT,ASSETADD1,ASSETADD2,ASSETPINCODE,ASSETDOORNUM) VALUES " + 
	                                                            "( \'MYASSET2\',\'STREET3\',34,\'ASST2ADD1\',\'ASST2ADD2\',600029,\'#34\')"; 
	    String insertQuery2 =
	    		"INSERT INTO assetdetails (ASSETNAME,ASSETST,ASSETUNIT,ASSETADD1,ASSETADD2,ASSETPINCODE,ASSETDOORNUM) VALUES " + 
	                                                            "("                                      +
	                                                            "\'" + assdet.getAssetname() + "\'"                   +
	                                                             ",\'" + assdet.getAssetstreetname() + "\'"              +
	                                                             "," + Integer.parseInt(assdet.getAssetunitnumber()) +
	                                                             ",\'" + assdet.getAssetaddln1()+ "\'"                  +
	                                                             ",\'" + assdet.getAssetaddln2()+ "\'"                  +
	                                                             "," + Integer.parseInt(assdet.getAssetpincode()) + 
	                                                             ",\'" + assdet.getAssetdoornum()+ "\'" + 
	                                                            ")";
	    //-------------Using statment
	    Statement stmt = conn.createStatement();
	    int insertStmtCount = stmt.executeUpdate(insertQuery2);
	    System.out.println("No of Rows inserted is : " + insertStmtCount);
	    stmt.close();
*/
//************************************************************************************************************************************************   
	    String insertPrepQuery =
	    		"insert into assetdetails (ASSETNAME,ASSETST,ASSETUNIT,ASSETADD1,ASSETADD2,ASSETPINCODE,ASSETDOORNUM)" + 
	            " values (?,?,?,?,?,?,?)";
	    Class.forName(driver);
	    Connection conn = DriverManager.getConnection(url,User,Password);

	    //-------------Using Prepared statment 
	    System.out.println(" Preparing statment");
	    try {
		java.sql.PreparedStatement prpStmt = conn.prepareStatement(insertPrepQuery,Statement.RETURN_GENERATED_KEYS);
		prpStmt.setString(1, assdet.getAssetname());
		prpStmt.setString(2, assdet.getAssetstreetname());
		prpStmt.setInt(3,Integer.parseInt(assdet.getAssetunitnumber()));
		prpStmt.setString(4, assdet.getAssetaddln1());
		prpStmt.setString(5, assdet.getAssetaddln2());
		prpStmt.setInt(6,Integer.parseInt(assdet.getAssetpincode()));
		prpStmt.setString(7,assdet.getAssetdoornum());
		System.out.println(" Inserting Values");
		int insertPrpCount =  prpStmt.executeUpdate();
		System.out.println("No of Rows inserted is : " + insertPrpCount);
		rs = prpStmt.getGeneratedKeys();
		rs.next();
		rowid = rs.getInt(1);
		System.out.println("Row id is : " + rowid);
		prpStmt.close();
	    } catch (SQLException e) {
	    conn.rollback();
	    }
	    conn.close();
		return rowid;
	   }
}
