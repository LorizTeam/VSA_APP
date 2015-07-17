package com.vsa.data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.vsa.form.DepartmentForm;
import com.vsa.util.DBConnect;
import com.vsa.util.DateUtil;

public class DepartmentDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetDepartMentList(String departmentID, String departmentName) 
	throws Exception { //30-05-2014
		List departMentList = new ArrayList();

		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT dept_id, dept_name " +
			"FROM department_master " +
			"WHERE "; 
			if(!departmentID.equals("")) sqlStmt = sqlStmt+ "dept_id like '"+departmentID+"%' AND ";
			if(!departmentName.equals("")) sqlStmt = sqlStmt+ "dept_name like '"+departmentName+"%' AND ";
			
			sqlStmt = sqlStmt + "dept_id <> '' group by dept_id order by dept_id";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				departmentID 	= rs.getString("dept_id");
				if (rs.getString("dept_name") != null) 		departmentName = rs.getString("dept_name"); else departmentName = "";
				
				departMentList.add(new DepartmentForm(departmentID, departmentName));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return departMentList;
	 }

	public void AddDepartment(String departmentID, String departmentName)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO department_master(dept_id, dept_name) " +
		"VALUES ('"+departmentID+"', '"+departmentName+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateDepartment(String departmentID, String departmentName)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE department_master set dept_name = '"+departmentName+"' " +
				"WHERE dept_id = '"+departmentID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteDepartment(String departmentID)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE department_master "+
		"WHERE dept_id = '"+departmentID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public boolean getCheckMaster(String departmentID) throws Exception {
	
	boolean chkCustomer = false;
	conn = agent.getConnectMYSql();
 	
 	String sqlStmt = "SELECT dept_id " +
	"FROM department_master WHERE dept_id = '"+departmentID+"' ";
 	
 	pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sqlStmt);	
	
	while (rs.next()) {
		chkCustomer = true;
	}
	
	rs.close();
	pStmt.close();
	
	return chkCustomer;
	}
}
