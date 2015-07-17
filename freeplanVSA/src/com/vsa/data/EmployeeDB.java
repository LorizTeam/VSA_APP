package com.vsa.data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.vsa.form.EmployeeForm;
import com.vsa.util.DBConnect;
import com.vsa.util.DateUtil;

public class EmployeeDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetEmployeeList(String employeeID, String employeeName) 
	throws Exception { //30-05-2014
		List employeeList = new ArrayList();
		String employeeSurName = "", employeeTel = "", employeeEmail = "", employeeDept = "";

		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT employee_id, employee_name, employee_surname, employee_tel, employee_email, dept_id " +
			"FROM customer_master " +
			"WHERE "; 
			if(!employeeID.equals("")) sqlStmt = sqlStmt+ "employee_id like '"+employeeID+"%' AND ";
			if(!employeeName.equals("")) sqlStmt = sqlStmt+ "customer_name like '"+employeeName+"%' AND ";
			
			sqlStmt = sqlStmt + "employee_id <> '' group by employee_id order by employee_id";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				employeeID 		= rs.getString("employee_id");
				if (rs.getString("employee_name") != null) 		employeeName = rs.getString("employee_name"); else employeeName = "";
				if (rs.getString("employee_surname") != null) 	employeeSurName = rs.getString("employee_surname"); else employeeSurName = "";
				employeeTel 		= rs.getString("employee_tel"); 
				employeeEmail 		= rs.getString("employee_email"); 
				employeeDept 		= rs.getString("dept_id");
				
				employeeList.add(new EmployeeForm(employeeID, employeeName, employeeSurName, employeeTel, employeeEmail, employeeDept));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return employeeList;
	 }

	public void AddEmployee(String employeeID, String employeeName, String employeeSurName, String employeeTel, String employeeEmail, String employeeDept)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO employee_master(employee_id, employee_name, employee_surname, employee_tel, employee_email, dept_id) " +
		"VALUES ('"+employeeID+"', '"+employeeName+"', '"+employeeSurName+"', '"+employeeTel+"', '"+employeeEmail+"', '"+employeeDept+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateEmployee(String employeeID, String employeeName, String employeeSurName, String employeeTel, String employeeEmail, String employeeDept)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE employee_master set employee_name = '"+employeeName+"', employee_surname = '"+employeeSurName+"', " +
				"employee_tel = '"+employeeTel+"', employee_email = '"+employeeEmail+"', dept_id '"+employeeDept+"' " +
				"WHERE employee_id = '"+employeeID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteEmployee(String employeeID)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE employee_master "+
		"WHERE employee_id = '"+employeeID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public boolean getCheckMaster(String employeeID) throws Exception {
	
	boolean chkCustomer = false;
	conn = agent.getConnectMYSql();
 	
 	String sqlStmt = "SELECT employee_id " +
	"FROM employee_master WHERE employee_id = '"+employeeID+"' ";
 	
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
