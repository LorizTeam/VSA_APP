package com.vsa.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
  
import com.vsa.form.LoginForm;
import com.vsa.util.DBConnect;


public class LoginDB {
	
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
	
	public LoginForm checkLogin(String userName, String passWord) throws Exception {
		String encrypPass = encrypt(passWord);
		
		DBConnect agent = new DBConnect();
		Connection connDB = null;
	 	connDB = agent.getConnectMYSql();
		ResultSet rs = null;
		LoginForm loginForm = new LoginForm();
		
		String sql = "SELECT a.username, a.password, a.name, a.type, b.employee_id " +
				     "FROM login_master a inner join employee_master b on(b.employee_email = a.username) " +
				     "WHERE username = '"+userName+"' " +
				     "AND password ='"+encrypPass+"' " ;
		PreparedStatement pstmt = connDB.prepareStatement(sql);

		rs = pstmt.executeQuery();
		if(rs.next()) {
			loginForm.setTrue(true);
			loginForm.setUserName(rs.getString("username"));
			loginForm.setPassWord(rs.getString("password"));
			loginForm.setName(rs.getString("employee_id"));
			loginForm.setType(rs.getString("type"));
		}
		
		if(connDB != null) {
			connDB.close();
		}
		
		return loginForm;
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

				memberList.add(new LoginForm(userName, passWord, name, type));
			}
			rs.close();
			pStmt.close();
			connDB.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return memberList;
	}
}
