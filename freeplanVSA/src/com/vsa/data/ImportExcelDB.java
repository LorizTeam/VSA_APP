package com.vsa.data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import com.vsa.util.DBConnect;
import com.vsa.util.DateUtil;


public class ImportExcelDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public void AddProjectHD(String projectID, String projectName, String employeeID, String customerID, String createDate, String projectType, String projectStatus, String projectAddress)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO projecthd(project_id, project_name, employee_id, customer_id, create_date, project_type, project_status, project_address) " +
		"VALUES ('"+projectID+"', '"+projectName+"', '"+employeeID+"', '"+customerID+"', '"+createDate+"', '"+projectType+"', '"+projectStatus+"', '"+projectAddress+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void AddProjectDT(String projectID, String structure, String materialCode, String weight, String amount, String amountTotal)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO projectdt(project_id, structure, material_code, weight, amount, amounttotal) " +
		"VALUES ('"+projectID+"', '"+structure+"', '"+materialCode+"', '"+weight+"', '"+amount+"', '"+amountTotal+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public String SelectDocno(String name) throws Exception {
		String docno = "";
	try {
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "SELECT project_id FROM projecthd where employee_id = '"+name+"' ";
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlStmt);		
		while (rs.next()) {
			docno	= rs.getString("project_id");
			docno 	= String.valueOf(Integer.parseInt(docno) + 1);
			 
			if (docno.length() == 1) {
				    docno = "00000" + docno; 
			} else if (docno.length() == 2) {
					docno = "0000" + docno; 
			} else if (docno.length() == 3) {
					docno = "000" + docno; 
			} else if (docno.length() == 4) {
					docno = "00" + docno; 
			} else if (docno.length() == 5) {
					docno = "0" + docno; 
			}
		}
		pStmt.close();
		conn.close();
		} catch (Exception e) {
		throw new Exception(e.getMessage());
	} finally {
		try {
			if (pStmt != null) pStmt.close();
			if (conn != null)  conn.close();
		} catch (SQLException e) {
			throw new Exception(e.getMessage());
		}
	}
	return docno;
}
}



