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
				
				createDate = dateUtil.CnvToDDMMYYYY1(createDate);
				
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
		String projectName = "", materialName = "", amount = "", weight = "", unit = "", amountTotal = "";
		DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
		DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT a.project_id, a.project_name, a.weight, a.amounttotal, " +
					"b.material_code, b.material_name, a.amount, b.unit " +
			"FROM projectdt a " +
			"INNER JOIN material_master b on(b.projectid = a.projectid) " +
			"WHERE "; 
			if(!projectID.equals("")) sqlStmt = sqlStmt+ "project_id like '"+projectID+"%' AND ";
			if(!materialCode.equals("")) sqlStmt = sqlStmt+ "material_code like '"+materialCode+"%' AND ";
			
			sqlStmt = sqlStmt + "material_code <> '' group by material_code order by material_code";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				projectID 		= rs.getString("project_id");
				if (rs.getString("project_name") != null) 	projectName = rs.getString("project_name"); else projectName = "";
				materialCode 	= rs.getString("material_code");
				if (rs.getString("employee_name") != null) 	materialName = rs.getString("employee_name"); else materialName = "";
				amount			= rs.getString("amount");
				weight 			= rs.getString("weight"); 
				unit 			= rs.getString("unit"); 
				amountTotal 	= rs.getString("amounttotal");
				
				weight 			= df2.format(Float.parseFloat(weight)); 
				amount 			= df2.format(Float.parseFloat(amount));
				amountTotal 	= df2.format(Float.parseFloat(amountTotal));
				
				projectDTList.add(new ProjectForm(projectID, projectName, materialCode, materialName, weight, amount, amountTotal, unit));
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
	public void AddProjectDT(String projectID, String materialCode, String weight, String amount, String amountTotal)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO projectdt(project_id, material_code, weight, amount, amounttotal) " +
		"VALUES ('"+projectID+"', '"+materialCode+"', '"+weight+"', '"+amount+"', '"+amountTotal+"')";
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
				"customer_id = '"+customerID+"', create_date = '"+createDate+"', project_type '"+projectType+"', " +
				"project_status = '"+projectStatus+"', project_address = '"+projectAddress+"' " +
				"WHERE project_id = '"+projectID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateProjectDT(String projectID, String materialCode, String weight, String amount, String amountTotal)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE projecthd set weight = '"+weight+"', amount = '"+amount+"', amounttotal = '"+amountTotal+"' " +
				"WHERE project_id = '"+projectID+"' and material_code = '"+materialCode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteProjectHD(String projectID)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE projecthd "+
		"WHERE projecthd = '"+projectID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteProjectDT(String projectID, String materialCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE projectdt "+
		"WHERE projecthd = '"+projectID+"' and material_code = '"+materialCode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
}