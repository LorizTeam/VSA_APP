package com.vsa.data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import com.vsa.form.MaterialForm;
import com.vsa.util.DBConnect;
import com.vsa.util.DateUtil;

public class MaterialDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public String CountMaterial() 
	throws Exception {
		 
		String no = "";
		try {
		conn = agent.getConnectMYSql();
	 
		 String sqlStmt = "SELECT count(material_code) as countno " +
				     "FROM material_master " +
				     "WHERE material_code <> '' ";
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlStmt);
		while (rs.next()) { 
			if (rs.getString("countno") != null) no = rs.getString("countno"); else no = "-";
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
		return no; 
	}
	public List GetMaterialList(String materialCode, String materialName) 
	throws Exception { //30-05-2014
		List materialList = new ArrayList();
		String amount = "", unit = "";
		DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
		DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT material_code, material_name, amount, unit " +
			"FROM material_master " +
			"WHERE "; 
			if(!materialCode.equals("")) sqlStmt = sqlStmt+ "material_code like '"+materialCode+"%' AND ";
			if(!materialName.equals("")) sqlStmt = sqlStmt+ "material_name like '"+materialName+"%' AND ";
			
			sqlStmt = sqlStmt + "material_code <> '' group by material_code order by material_code";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				materialCode 	= rs.getString("material_code");
				if (rs.getString("material_name") != null) 		materialName = rs.getString("material_name"); else materialName = "";
				amount 			= rs.getString("amount"); 
				unit 			= rs.getString("unit"); 
				
			//	amount 			= df2.format(Float.parseFloat(amount));
				
				materialList.add(new MaterialForm(materialCode, materialName, amount, unit));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return materialList;
	 }
	public List GetMaterialList_A(String grp) 
	throws Exception { //30-05-2014
		List materialList = new ArrayList();
		String materialCode = "", materialName = "", amount = "", unit = "";
		DecimalFormat df1 = new DecimalFormat("#,###,##0.##");
		DecimalFormat df2 = new DecimalFormat("#,###,##0.00");
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT material_code, material_name, amount, unit " +
			"FROM material_master " +
			"WHERE "; 
			if(!grp.equals("")) sqlStmt = sqlStmt+ "grp = '"+grp+"' AND ";
			 
			sqlStmt = sqlStmt + "material_code <> '' group by material_code order by material_code";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				materialCode 	= rs.getString("material_code");
				if (rs.getString("material_name") != null) 		materialName = rs.getString("material_name"); else materialName = "";
				amount 			= rs.getString("amount"); 
				unit 			= rs.getString("unit"); 
				
			//	amount 			= df2.format(Float.parseFloat(amount));
				
				materialList.add(new MaterialForm(materialCode, materialName, amount, unit));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return materialList;
	 }
	public String[] GetGrpList1(int count) 
	throws Exception { //30-05-2014
		String getList[] = new String[count];
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT grp " +
			"FROM material_master " +
			"WHERE ";  
			 
			sqlStmt = sqlStmt + "material_code <> '' and  grp <> '' group by grp";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			int i=0;
			while (rs.next()) { 	 
				getList[i] = rs.getString("grp");
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
	public int GetGrp1() 
	throws Exception { //30-05-2014
		int count = 0;
		 
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT count(grp) as coustgrp " +
			"FROM material_master " +
			"WHERE ";  
			 
			sqlStmt = sqlStmt + "material_code <> '' group by grp";
			
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
}
