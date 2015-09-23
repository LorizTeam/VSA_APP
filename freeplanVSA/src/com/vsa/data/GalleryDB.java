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
	
	public List GetGalleryImage() 
	throws Exception { //30-05-2014
		List galleryList = new ArrayList();
		String galleryName = "", galleryCode = "";
	 
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT a.galleryid, a.galleryname " +
			"FROM gallery_master a inner join fileimage b on(b.galleryid = a.galleryid) " +
			"WHERE "; 
			 
			sqlStmt = sqlStmt + "a.galleryid <> '' group by a.galleryid order by a.galleryid";
			
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
	public List GetGallery() 
	throws Exception { //30-05-2014
		List galleryList = new ArrayList();
		String galleryName = "", galleryCode = "", description = "", amount = "", timeUse = "";
	 
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT galleryid, galleryname, description, amount, timeuse " +
			"FROM gallery_master " +
			"WHERE "; 
			 
			sqlStmt = sqlStmt + "galleryname <> '' group by galleryid order by galleryid";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				galleryCode 	= rs.getString("galleryid");
				galleryName 	= rs.getString("galleryname"); 
				description 	= rs.getString("description");
				amount 			= rs.getString("amount"); 
				timeUse		 	= rs.getString("timeuse"); 
				
				galleryList.add(new GalleryForm(galleryCode, galleryName, description, amount, timeUse));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return galleryList;
	 }
	public void AddImage(String imageName, String pathfile, String statusImage)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String galleryID = "";
		String sqlStmt = "SELECT max(galleryid) as galleryid " +
		"FROM gallery_master limit 1 ";
		pStmt = conn.createStatement();
		rs = pStmt.executeQuery(sqlStmt);
		while (rs.next()) {
			galleryID 	= rs.getString("galleryid");
		}	
		rs.close();
		pStmt.close();
		
		sqlStmt = "INSERT IGNORE INTO fileimage(imagename, galleryid, pathfile, status) " +
		"VALUES ('"+imageName+"', '"+galleryID+"', '"+pathfile+"', '"+statusImage+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void AddGallery(String galleryName, String description, String amount, String timeUse)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO gallery_master(galleryname, description, amount, timeuse) " +
		"VALUES ('"+galleryName+"', '"+description+"', '"+amount+"', '"+timeUse+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateGallery(String galleryCode, String galleryName, String description, String amount, String timeUse)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE gallery_master set galleryname = '"+galleryName+"', description = '"+description+"', " +
				"amount = '"+amount+"', timeuse = '"+timeUse+"' "+
				"WHERE galleryid = '"+galleryCode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteGallery(String galleryCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE From gallery_master "+
		"WHERE galleryid = '"+galleryCode+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
}
