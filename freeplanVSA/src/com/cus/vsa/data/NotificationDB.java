package com.cus.vsa.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.vsa.form.CustomerForm;
import com.cus.vsa.form.NotificationForm;
import com.vsa.util.DBConnect;
import com.vsa.util.DateUtil;

public class NotificationDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	Statement pStmt1 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List Notification() 
	throws Exception {
		List notificationList = new ArrayList();
		String no = "", name = "", email = "", messageHD = "", messageDT = "", dateTime = "";
		try {
		conn = agent.getConnectMYSql();
	 
		 String sqlStmt = "SELECT no, name, email, messagehd, messagedt, datetime " +
				     "FROM notifications " +
				     "ORDER BY no desc ";
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlStmt);
		while (rs.next()) {
			no	 = rs.getString("no");
			name = rs.getString("name");
			email = rs.getString("email");
			messageHD = rs.getString("messagehd");
			messageDT = rs.getString("messagedt");
			dateTime = rs.getString("datetime");
			
			dateTime = dateTime.replace(".0", "");
			
			notificationList.add(new NotificationForm(no, name, email, messageHD, messageDT, dateTime));
		}
		
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		} finally {
			try {
				if (rs != null) 	  rs.close();
				if (pStmt != null) pStmt.close();
				if (conn != null)  conn.close();
			} catch (SQLException e) {
				throw new Exception(e.getMessage());
			}
		}
		return notificationList; 
	}
	public void UpdateCustomer(String customerID, String customerName, String customerSurName, String customerTel, String customerEmail, 
			String customerDOB, String customerHouseNo, String customerVillageNo, String customerVillage, String customerLane, 
			String customerSubDistrict, String customerDistrict, String customerProvince, String customerPostCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE customer_master set customer_name = '"+customerName+"', customer_surname = '"+customerSurName+"', " +
				"customer_tel = '"+customerTel+"', customer_email = '"+customerEmail+"', customer_dob = '"+customerDOB+"', customer_houseno = '"+customerHouseNo+"', " +
				"customer_villageno = '"+customerVillageNo+"', customer_village = '"+customerVillage+"', customer_lane = '"+customerLane+"', customer_subdistrict = '"+customerSubDistrict+"', " +
				"customer_district = '"+customerDistrict+"', customer_province = '"+customerProvince+"', customer_postcode = '"+customerPostCode+"' " +
				"WHERE customer_id = '"+customerID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteCustomer(String customerID)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE FROM customer_master "+
		"WHERE customer_id = '"+customerID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public boolean getCheckMaster(String customerID) throws Exception {
	
	boolean chkCustomer = false;
	conn = agent.getConnectMYSql();
 	
 	String sqlStmt = "SELECT customer_id " +
	"FROM customer_master WHERE customer_id = '"+customerID+"' ";
 	
 	pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sqlStmt);	
	
	while (rs.next()) {
		chkCustomer = true;
	}
	
	rs.close();
	pStmt.close();
	
	return chkCustomer;
	}
	// list province
	public List GetProvinceList() 
	throws Exception { //27-02-2014
		List provinceList = new ArrayList();
		String provinceID = "", provinceCode = "", provinceName = "", geoID = "";
		try {
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT PROVINCE_ID, PROVINCE_CODE, PROVINCE_NAME, GEO_ID " +
			"FROM province " +
			"WHERE ";
			 
			sqlStmt = sqlStmt + "PROVINCE_ID <> '' Order By PROVINCE_NAME, PROVINCE_ID";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				provinceID		= rs.getString("PROVINCE_ID");
				provinceCode	= rs.getString("PROVINCE_CODE");
				if (rs.getString("PROVINCE_NAME") != null) provinceName = rs.getString("PROVINCE_NAME"); else provinceName = "";
				geoID			= rs.getString("GEO_ID"); 

				provinceList.add(new CustomerForm(provinceID, provinceCode, provinceName, geoID));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		} finally {
			try {
				if (rs != null) 	  rs.close();
				if (pStmt != null) pStmt.close();
				if (conn != null)  conn.close();
			} catch (SQLException e) {
				throw new Exception(e.getMessage());
			}
		}
		return provinceList;
	}
	
	
	
}
