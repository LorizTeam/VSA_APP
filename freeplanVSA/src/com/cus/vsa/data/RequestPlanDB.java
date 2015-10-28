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

public class RequestPlanDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	Statement pStmt1 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public boolean CheckProject(String customerID) throws Exception {
		
		boolean chkCustomer = false;
		conn = agent.getConnectMYSql();
	 	
	 	String sqlStmt = "SELECT customer_id " +
		"FROM projecthd WHERE customer_id = '"+customerID+"' ";
	 	
	 	pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlStmt);	
		
		while (rs.next()) {
			chkCustomer = true;
		}
		
		rs.close();
		pStmt.close();
		
		return chkCustomer;
		}
	public void AddProjectHD(String projectName, String employeeID, String customerID, String createDate, String projectType, String projectStatus, String projectAddress)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String projectID = "";
		String sqlStmt = "SELECT project_id FROM projecthd ";
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlStmt);		
		while (rs.next()) {
			projectID	= rs.getString("project_id");
			projectID 	= String.valueOf(Integer.parseInt(projectID) + 1);
			 
			if (projectID.length() == 1) {
				    projectID = "00000" + projectID; 
			} else if (projectID.length() == 2) {
					projectID = "0000" + projectID; 
			} else if (projectID.length() == 3) {
					projectID = "000" + projectID; 
			} else if (projectID.length() == 4) {
					projectID = "00" + projectID; 
			} else if (projectID.length() == 5) {
					projectID = "0" + projectID; 
			}
		}
		
		sqlStmt = "INSERT IGNORE INTO projecthd(project_id, project_name, employee_id, customer_id, create_date, project_type, project_status, project_address) " +
		"VALUES ('"+projectID+"', '"+projectName+"', '"+employeeID+"', '"+customerID+"', '"+createDate+"', '"+projectType+"', '"+projectStatus+"', '"+projectAddress+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void insertNotification(String name, String email, String messageHD, String messageDT, String dateTime, String statusRead, String statusType)  
	throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO notifications(name, email, messagehd, messagedt, datetime, status_read, status_type) " +
				"VALUES ('"+name+"', '"+email+"', '"+messageHD+"', '"+messageDT+"', '"+dateTime+"', '"+statusRead+"', '"+statusType+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
}
