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
				
				amount 			= df2.format(Float.parseFloat(amount));
				
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
