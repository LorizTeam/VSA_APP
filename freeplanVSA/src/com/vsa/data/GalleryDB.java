package com.vsa.data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import com.vsa.form.GalleryForm;
import com.vsa.util.DBConnect;
import com.vsa.util.DateUtil;

public class GalleryDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetGallery() 
	throws Exception { //30-05-2014
		List galleryList = new ArrayList();
		String galleryName = "", galleryCode = "";
	 
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT galleryid, galleryname " +
			"FROM gallery_master " +
			"WHERE "; 
			 
			sqlStmt = sqlStmt + "galleryname <> '' group by galleryid order by galleryid";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				galleryCode 	= rs.getString("galleryid");
				galleryName 	= rs.getString("galleryname"); 
				
				galleryList.add(new GalleryForm(galleryCode, galleryName));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return galleryList;
	 }
	public void AddGallery(String galleryName)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO gallery_master(galleryname) " +
		"VALUES ('"+galleryName+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateMaterial(String galleryCode, String galleryName)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE gallery_master set galleryname = '"+galleryName+"' "+
				"WHERE galleryid = '"+galleryCode+"'";
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
}
