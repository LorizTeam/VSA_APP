package com.vsa.data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import com.vsa.form.ProjectForm;
import com.vsa.util.DBConnect;
import com.vsa.util.DateUtil;

public class ProjectDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetProjectHDList(String projectID, String projectName) 
	throws Exception { //02-07-2015
		List projectHDList = new ArrayList();
		String employeeID = "", employeeName = "", customerID = "", customerName = "", projectType = "", projectStatus = "", projectAddress = "", createDate = "";

		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT project_id, project_name, a.employee_id, a.customer_id, create_date, project_type, project_status, project_address, " +
					"b.employee_name, c.customer_name " +
			"FROM projecthd a " +
			"INNER JOIN employee_master b on(b.employee_id = a.employee_id) " +
			"INNER JOIN customer_master c on(c.customer_id = a.customer_id) " +
			"WHERE "; 
			if(!projectID.equals("")) sqlStmt = sqlStmt+ "project_id like '"+projectID+"%' AND ";
			if(!projectName.equals("")) sqlStmt = sqlStmt+ "project_name like '"+projectName+"%' AND ";
			
			sqlStmt = sqlStmt + "project_id <> '' group by project_id order by project_id";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				projectID 			= rs.getString("project_id");
				if (rs.getString("project_name") != null) 	projectName = rs.getString("project_name"); else projectName = "";
				employeeID 			= rs.getString("employee_id");
				if (rs.getString("employee_name") != null) 	employeeName = rs.getString("employee_name"); else employeeName = "";
				customerID 			= rs.getString("customer_id");
				if (rs.getString("customer_name") != null) 	customerName = rs.getString("customer_name"); else customerName = "";
				createDate			= rs.getString("create_date");
				projectType 		= rs.getString("project_type"); 
				projectStatus 		= rs.getString("project_status"); 
				projectAddress 		= rs.getString("project_address");
				
			//	createDate = dateUtil.CnvToDDMMYYYY1(createDate);
				if(createDate!=null) createDate = dateUtil.CnvToDDMMYYYY(createDate);
				
				projectHDList.add(new ProjectForm(projectID, projectName, employeeID, employeeName, customerID, customerName, createDate, 
						projectType, projectStatus, projectAddress));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return projectHDList;
	 }
	public List GetProjectDTList(String projectID, String materialCode) 
	throws Exception { //30-05-2014
		List projectDTList = new ArrayList();
		String structure = "", projectName = "", materialName = "", amount = "", weight = "", unit = "", amountTotal = "";
		DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
		DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT a.project_id, c.project_name, a.weight, a.amounttotal, a.structure, " +
					"b.material_code, b.material_name, a.amount, b.unit " +
			"FROM projectdt a " +
			"INNER JOIN material_master b on(b.material_code = a.material_code) " +
			"INNER JOIN projecthd c on(c.project_id = a.project_id) " +
			"WHERE "; 
			if(!projectID.equals("")) sqlStmt = sqlStmt+ "a.project_id = '"+projectID+"' AND ";
			if(!materialCode.equals("")) sqlStmt = sqlStmt+ "b.material_code like '"+materialCode+"%' AND ";
			
			sqlStmt = sqlStmt + "a.material_code <> '' group by a.structure, a.material_code order by a.structure, a.material_code";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				projectID 		= rs.getString("project_id");
				if (rs.getString("project_name") != null) 	projectName = rs.getString("project_name"); else projectName = "";
				structure		= rs.getString("structure");
				materialCode 	= rs.getString("material_code");
				if (rs.getString("material_name") != null) 	materialName = rs.getString("material_name"); else materialName = "";
				amount			= rs.getString("amount");
				weight 			= rs.getString("weight"); 
				unit 			= rs.getString("unit"); 
				amountTotal 	= rs.getString("amounttotal");
				
				weight 			= df2.format(Float.parseFloat(weight)); 
				amount 			= df2.format(Float.parseFloat(amount));
				amountTotal 	= df2.format(Float.parseFloat(amountTotal));
				
				projectDTList.add(new ProjectForm(projectID, projectName, structure, materialCode, materialName, weight, amount, amountTotal, unit));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return projectDTList;
	 }
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
		
		String sqlStmt = "INSERT IGNORE INTO projectdt(project_id, structure, material_code, weight, amount, amounttotal, amounttotal_cust) " +
		"VALUES ('"+projectID+"', '"+structure+"', '"+materialCode+"', '"+weight+"', '"+amount+"', '"+amountTotal+"', '0.00')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	
	public void UpdateProjectHD(String projectID, String projectName, String employeeID, String customerID, String createDate, String projectType, 
			String projectStatus, String projectAddress)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE projecthd set project_name = '"+projectName+"', employee_id = '"+employeeID+"', " +
				"customer_id = '"+customerID+"', create_date = '"+createDate+"', project_type = '"+projectType+"', " +
				"project_status = '"+projectStatus+"', project_address = '"+projectAddress+"' " +
				"WHERE project_id = '"+projectID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateProjectDT(String projectID, String structure, String materialCode, String weight, String amount, String amountTotal)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE projectdt set weight = '"+weight+"', amount = '"+amount+"', amounttotal = '"+amountTotal+"' " +
				"WHERE project_id = '"+projectID+"' and structure = '"+structure+"' and material_code = '"+materialCode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteProjectHD(String projectID)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE FROM projecthd "+
		"WHERE project_id = '"+projectID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		
		sqlStmt = "DELETE FROM projectdt "+
		"WHERE project_id = '"+projectID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		
		conn.close();
	}
	public void DeleteProjectDT(String projectID, String structure, String materialCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE FROM projectdt "+
		"WHERE project_id = '"+projectID+"' and structure = '"+structure+"' and material_code = '"+materialCode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public String SelectDocno() throws Exception {
		String docno = "0";
	try {
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "SELECT project_id FROM projecthd ";
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
