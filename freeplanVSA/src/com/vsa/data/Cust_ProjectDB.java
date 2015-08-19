package com.vsa.data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import com.vsa.form.CustomerProjectForm;
import com.vsa.util.DBConnect;
import com.vsa.util.DateUtil;

public class Cust_ProjectDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetProjectList(String grp, String customerID) 
	throws Exception { //30-05-2014
		List materialList = new ArrayList();
		String projectID = "", materialCode = "", structure = "", materialName = "", amountTotal = "", amountTotalCust = "";
		DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
		DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT a.project_id, a.customer_id, b.material_code, b.structure, b.amounttotal, b.amounttotal_cust, c.material_name " +
			"FROM projecthd a INNER JOIN projectdt b on(b.project_id = a.project_id) INNER JOIN material_master c on(c.material_code = b.material_code) " +
			"WHERE "; 
			if(!grp.equals("")) sqlStmt = sqlStmt+ "b.structure = '"+grp+"' AND ";
			if(!customerID.equals("")) sqlStmt = sqlStmt+ "a.customer_id = '"+customerID+"' AND "; 
			sqlStmt = sqlStmt + "b.material_code <> '' group by b.material_code, b.structure order by b.structure";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) { 
				projectID 		= rs.getString("project_id"); 
				materialCode	= rs.getString("material_code"); 
				if (rs.getString("material_name") != null) 		materialName = rs.getString("material_name"); else materialName = "";
				structure		= rs.getString("structure"); 
				amountTotal 	= rs.getString("amounttotal"); 
				amountTotalCust = rs.getString("amounttotal_cust"); 
				
				amountTotal 		= df2.format(Float.parseFloat(amountTotal));
				amountTotalCust 	= df2.format(Float.parseFloat(amountTotalCust));
				
				materialList.add(new CustomerProjectForm(projectID, materialCode, materialName, structure, amountTotal, amountTotalCust));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return materialList;
	 }
	public String[] GetGrpList(int count, String customerID) 
	throws Exception { //30-05-2014
		String getList[] = new String[count];
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT b.structure, a.customer_id " +
			"FROM projecthd a INNER JOIN projectdt b on(b.project_id = a.project_id) " +
			"WHERE ";  
			if(!customerID.equals("")) sqlStmt = sqlStmt+ "a.customer_id = '"+customerID+"' AND "; 
			sqlStmt = sqlStmt + "material_code <> '' and  structure <> '' group by structure";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			int i=0;
			while (rs.next()) { 	 
				getList[i] = rs.getString("structure");
			i++;
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return getList;
	 }
	public int GetGrp(String customerID) 
	throws Exception { //30-05-2014
		int count = 0;
		 
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT count(DISTINCT b.structure) as coustgrp " +
			"FROM projecthd a INNER JOIN projectdt b on(b.project_id = a.project_id) " +
			"WHERE ";  
			if(!customerID.equals("")) sqlStmt = sqlStmt+ "a.customer_id = '"+customerID+"' AND "; 
			
			sqlStmt = sqlStmt + "a.project_id <> ''";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				count = Integer.parseInt(rs.getString("coustgrp"));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return count;
	 }
	public String GetGrpName(String grpName) 
	throws Exception { //30-05-2014
		 
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT DISTINCT(b.structure) as coustgrp " +
			"FROM projecthd a INNER JOIN projectdt b on(b.project_id = a.project_id) " +
			"WHERE ";  
			if(!grpName.equals("")) sqlStmt = sqlStmt+ "b.structure = '"+grpName+"' AND "; 
			
			sqlStmt = sqlStmt + "a.project_id <> ''";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				grpName = rs.getString("coustgrp");
			} 
			
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return grpName;
	 }
	public void AddMaterial(String materialName, String amount, String unit)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO material_master(material_name, amount, unit) " +
		"VALUES ('"+materialName+"', '"+amount+"', '"+unit+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateMaterial(String materialCode, String materialName, String amount, String unit)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE material_master set material_name = '"+materialName+"', amount = '"+amount+"', " +
				"unit = '"+unit+"' " +
				"WHERE material_code = '"+materialCode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteMaterial(String materialCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From material_master "+
		"WHERE material_code = '"+materialCode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public boolean getCheckMaster(String materialCode) throws Exception {
	
	boolean chkCustomer = false;
	conn = agent.getConnectMYSql();
 	
 	String sqlStmt = "SELECT material_code " +
	"FROM material_master WHERE material_code = '"+materialCode+"' ";
 	
 	pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sqlStmt);	
	
	while (rs.next()) {
		chkCustomer = true;
	}
	
	rs.close();
	pStmt.close();
	
	return chkCustomer;
	}
	public void UpdateAR(String projectID, String structure, String materialCode, String amountTotalCust) 
		throws Exception { //01-12-2011
			try {
				conn = agent.getConnectMYSql();
				
				amountTotalCust = amountTotalCust.replace(",", "");
				
				String sqlStmt = "UPDATE projectdt SET " +
					"amounttotal_cust = '"+amountTotalCust+"' " +
					"WHERE project_id = '"+projectID+"' and structure = '"+structure+"' and material_code = '"+materialCode+"'";
								
				//System.out.println(sqlStmt);
			    pStmt = conn.createStatement();
				pStmt.executeUpdate(sqlStmt);			
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
		}
}
