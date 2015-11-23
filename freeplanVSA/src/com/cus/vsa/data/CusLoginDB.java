package com.cus.vsa.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cus.vsa.form.CusLoginForm;
import com.vsa.util.DBConnect;

public class CusLoginDB { 
	
	public String encrypt(String x) throws Exception {		
		String storepass = "";		
		try {
			java.security.Security.addProvider(new sun.security.provider.Sun());
			java.security.MessageDigest lMessageDigest = java.security.MessageDigest.getInstance("SHA", "SUN");
			byte[] _result = lMessageDigest.digest(x.getBytes());
			storepass = new sun.misc.BASE64Encoder().encode(_result);
			
		} catch (java.security.NoSuchProviderException nspe) {
			
		}
		return storepass;
	}
	
	public CusLoginForm checkLogin(String userName, String passWord) throws Exception {
		String encrypPass = encrypt(passWord);
		
		DBConnect agent = new DBConnect();
		Connection connDB = null;
	 	connDB = agent.getConnectMYSql();
		ResultSet rs = null;
		CusLoginForm cusLoginForm = new CusLoginForm();
		
		String sql = "SELECT a.username, a.password, a.name, a.type, b.customer_id " +
				     "FROM login_master a inner join customer_master b on(b.customer_email = a.username) " +
				     "WHERE username = '"+userName+"' " +
				     "AND password = '"+encrypPass+"' " ;
		PreparedStatement pstmt = connDB.prepareStatement(sql);

		rs = pstmt.executeQuery();
		if(rs.next()) {
			cusLoginForm.setTrue(true);
			cusLoginForm.setUserName(rs.getString("username"));
			cusLoginForm.setPassWord(rs.getString("password"));
			cusLoginForm.setCustID(rs.getString("customer_id"));
			cusLoginForm.setType(rs.getString("type"));
			cusLoginForm.setName(rs.getString("name"));
		}
		// rs.close();
		
		String statusProj = "";
		
		sql = "SELECT c.project_status " +
	     "FROM login_master a inner join customer_master b on(b.customer_email = a.username) " +
	     "inner join projecthd c on (c.customer_id = b.customer_id) " +
	     "WHERE username = '"+userName+"' " +
	     "AND password = '"+encrypPass+"' " ;
		
		pstmt = connDB.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) { 
			statusProj = rs.getString("project_status");
		if(statusProj==null) statusProj = "";
		cusLoginForm.setStatusProj(statusProj);  
		}
		rs.close();
		pstmt.close();
		
		if(connDB != null) {
			connDB.close();
		}
		
		return cusLoginForm;
	}
	 
	public void registerNew(String username, String password, String name, String type, String date, String tel) throws Exception {
		String encrypPass = encrypt(password);

		DBConnect agent = new DBConnect();
		Connection connDB=null;
		connDB = agent.getConnectMYSql();
		
		String sql = "INSERT INTO login_master(username, password, name, type, date, tel) VALUES (?, ?, ?, ?, ?, ?) ";
		PreparedStatement pstmt = connDB.prepareStatement(sql);
		pstmt.setString(1, username);
		pstmt.setString(2, encrypPass);
		pstmt.setString(3, name);
		pstmt.setString(4, type);
		pstmt.setString(5, date);
		pstmt.setString(6, tel);
		pstmt.executeUpdate();
		
		pstmt.close();
		if(connDB != null) {
			connDB.close();
		}
	}
	public void AddCustomer(String customerName, String customerSurName,  String customerTel, String customerEmail, 
			String customerDOB, String customerHouseNo, String customerVillageNo, String customerVillage, String customerLane, 
			String customerSubDistrict, String customerDistrict, String customerProvince, String customerPostCode)  throws Exception{
		DBConnect agent = new DBConnect();
		Connection conn = null;
		Statement pStmt 	= null;
	 	conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT INTO customer_master(customer_name, customer_surname, customer_tel, customer_email, " +
				"customer_dob, customer_houseno, customer_villageno, customer_village, customer_lane, customer_subdistrict, customer_district, " +
				"customer_province, customer_postcode) " +
		"VALUES ('"+customerName+"', '"+customerSurName+"', '"+customerTel+"', '"+customerEmail+"', '"+customerDOB+"', " +
				"'"+customerHouseNo+"', '"+customerVillageNo+"', '"+customerVillage+"', '"+customerLane+"', '"+customerSubDistrict+"', " +
				"'"+customerDistrict+"', '"+customerProvince+"', '"+customerPostCode+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void updateMember(String name, String userName, String passWord, String type, String hdUsername) throws Exception {
		String encrypPass = encrypt(passWord);

		DBConnect agent = new DBConnect();
		Connection connDB=null;
		connDB = agent.getConnectMYSql();
	 	Statement pStmt 	= null; 
	 	
		String sqlStmt = "UPDATE login_master set name = '"+name+"', username = '"+userName+"', password = '"+encrypPass+"', type = '"+type+"' "+
				"WHERE username= '"+hdUsername+"' ";
		pStmt = connDB.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		
		if(connDB != null) {
			connDB.close();
		}
		
	}
	public boolean ChkRegister(String userName, String name) throws Exception {
		boolean chkPass = false;
		DBConnect agent = new DBConnect();
		Connection connDB=null;
		connDB = agent.getConnectMYSql();
	 	Statement pStmt 	= null; 
	 	ResultSet rs		= null;
	 	
	 	String sqlStmt = "SELECT username " +
		"FROM login_master WHERE username = '"+userName+"' and name = '"+name+"' ";
	 	
	 	pStmt = connDB.createStatement();
		rs = pStmt.executeQuery(sqlStmt);	
		while (rs.next()) {
			chkPass = true;
		}
		
		rs.close();
		pStmt.close();
		connDB.close();
		
		return chkPass;
	}
	public String SelectPassword(String userName) throws Exception {
		String passWord = "";
		 
		DBConnect agent = new DBConnect();
		Connection connDB=null;
		connDB = agent.getConnectMYSql();
	 	Statement pStmt 	= null; 
	 	ResultSet rs		= null;
	 	
	 	String sqlStmt = "SELECT password " +
		"FROM login_master a inner join customer_master b on(b.customer_email = a.username) WHERE username = '"+userName+"' ";
	 	
	 	pStmt = connDB.createStatement();
		rs = pStmt.executeQuery(sqlStmt);	
		while (rs.next()) {
			passWord = rs.getString("password");
		}
		
		rs.close();
		pStmt.close();
		connDB.close();
		
		return passWord;
	}
	public boolean ChkPassword(String userName, String passWord) throws Exception {
		boolean chkPass = false;
		String encrypPass = encrypt(passWord);
		DBConnect agent = new DBConnect();
		Connection connDB=null;
		connDB = agent.getConnectMYSql();
	 	Statement pStmt 	= null; 
	 	ResultSet rs		= null;
	 	
	 	String sqlStmt = "SELECT name, username, password, type " +
		"FROM login_master WHERE username = '"+userName+"' and password = '"+encrypPass+"' ";
	 	
	 	pStmt = connDB.createStatement();
		rs = pStmt.executeQuery(sqlStmt);	
		while (rs.next()) {
			chkPass = true;
		}
		
		rs.close();
		pStmt.close();
		connDB.close();
		
		return chkPass;
	}
	public void ChangePassword(String userName, String passWord) throws Exception {
		String encrypPass = encrypt(passWord);

		DBConnect agent = new DBConnect();
		Connection connDB=null;
		connDB = agent.getConnectMYSql();	
	 	Statement pStmt 	= null; 
	 	
		String sqlStmt = "UPDATE login_master set password = '"+encrypPass+"' "+
				"WHERE username = '"+userName+"' ";
		pStmt = connDB.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		
		if(connDB != null) {
			connDB.close();
		}
		
	}
	public void deleteMenber(String username) throws Exception {

		DBConnect agent = new DBConnect();
		Connection connDB=null;
		connDB = agent.getConnectMYSql();
	 	Statement pStmt 	= null; 
	 	
		String sqlStmt = "DELETE FROM login_master WHERE username = '"+username+"'";
		pStmt = connDB.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		
		if(connDB != null) {
			connDB.close();
		}
		
	}
	public boolean isSaveLogingLog(String username, String dateTime, String ipAddress) throws Exception {
		
		DBConnect agent = new DBConnect();
		Connection connDB=null;
		connDB = agent.getConnectMYSql();
		int status = 0;
		boolean result = false;
		String sql = "INSERT INTO login_log(username, datetime, ip) VALUES (?, ?, ?) ";
		PreparedStatement pstmt = connDB.prepareStatement(sql);
		pstmt.setString(1, username);
		pstmt.setString(2, dateTime);
		pstmt.setString(3, ipAddress);
		status = pstmt.executeUpdate();
		if(status > 0) {
			result = true;
		}
		
		if(connDB != null) {
			connDB.close();
		}
		
		return result;
	}
	public List MemberList(String name, String userName, String type) throws Exception { //27-02-2014
		String passWord = "";
		List memberList = new ArrayList();
		try {
			DBConnect agent = new DBConnect();
			Connection connDB=null;
			connDB = agent.getConnectMYSql();
		 
			Statement pStmt 	= null;
			ResultSet rs		= null;
			
			String sqlStmt = "SELECT name, username, password, type " +
			"FROM login_master WHERE ";
			if (!userName.equals("")) 	sqlStmt = sqlStmt + "username like '%"+userName+"%' AND ";
			if (!name.equals("")) 	sqlStmt = sqlStmt + "name like '%"+name+"%' AND "; 
			if (!type.equals("")) sqlStmt = sqlStmt + "type = '"+type+"' AND ";
			
			sqlStmt = sqlStmt + "type <> '' order by type ";
			//System.out.println(sqlStmt);				
			pStmt = connDB.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				
				if (rs.getString("username") != null) userName = rs.getString("username"); else userName = "";
				if (rs.getString("password") != null) passWord = rs.getString("password"); else passWord = "";
				if (rs.getString("name") != null) name = rs.getString("name"); else name = "";
				if (rs.getString("type") != null) type = rs.getString("type"); else type = "";

				memberList.add(new CusLoginForm(userName, passWord, name, type));
			}
			rs.close();
			pStmt.close();
			connDB.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return memberList;
	}
	public List CustomerList(String userName) throws Exception { //27-02-2014
		String passWord = "", name = "", surName = "", type = "", tel = "", custID = "";
		List customerList = new ArrayList();
		try {
			DBConnect agent = new DBConnect();
			Connection connDB=null;
			connDB = agent.getConnectMYSql();
		 
			Statement pStmt 	= null;
			ResultSet rs		= null;
			
			String sqlStmt = "SELECT a.username, a.password, a.type, a.tel, b.customer_id, b.customer_name, b.customer_surname " +
			"FROM login_master a inner join customer_master b on(b.customer_email = a.username)  " +
			"WHERE type = 'cus' and ";
			if (!userName.equals("")) 	sqlStmt = sqlStmt + "username = '"+userName+"' AND ";
			
			sqlStmt = sqlStmt + "username <> '' order by username ";
			//System.out.println(sqlStmt);				
			pStmt = connDB.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				if (rs.getString("username") != null) userName = rs.getString("username"); else userName = "";
				if (rs.getString("password") != null) passWord = rs.getString("password"); else passWord = "";
				if (rs.getString("customer_name") != null) name = rs.getString("customer_name"); else name = "";
				if (rs.getString("customer_surname") != null) surName = rs.getString("customer_surname"); else surName = "";
				if (rs.getString("tel") != null) tel = rs.getString("tel"); else tel = "";
				if (rs.getString("type") != null) type = rs.getString("type"); else type = "";

				customerList.add(new CusLoginForm(userName, passWord, name, surName, tel, type));
			}
			rs.close();
			pStmt.close();
			connDB.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return customerList;
	}
	public void updateCustomer(String name, String surName, String userName, String tel, String hdUserName) throws Exception {

		DBConnect agent = new DBConnect();
		Connection connDB=null;
		connDB = agent.getConnectMYSql();
	 	Statement pStmt 	= null; 
	 	
		String sqlStmt = "UPDATE customer_master set customer_name = '"+name+"', customer_surname = '"+surName+"', customer_email = '"+userName+"', " +
		"customer_tel = '"+tel+"' "+
		"WHERE customer_email= '"+hdUserName+"' ";
		pStmt = connDB.createStatement();
		pStmt.executeUpdate(sqlStmt);
		
		name = name+" "+surName;
		
		sqlStmt = "UPDATE login_master set name = '"+name+"', username = '"+userName+"', " +
		"tel = '"+tel+"' "+
		"WHERE username= '"+hdUserName+"' ";
		pStmt = connDB.createStatement();
		pStmt.executeUpdate(sqlStmt);
		
		pStmt.close();
		
		if(connDB != null) {
			connDB.close();
		}
		
	}
}
