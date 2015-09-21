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

import com.vsa.form.UploadImageForm;
import com.vsa.util.DBConnect;
import com.vsa.util.DateUtil;

public class ImportImageDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetImageHDList(String galleryCode) 
	throws Exception { //30-05-2014
		List imageList = new ArrayList();
		String galleryName = "", imageName = "", pathfile = "", grStatus = "";
	 
		try {
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT a.galleryid, a.galleryname, b.imagename, b.pathfile, b.status " +
			"FROM gallery_master a inner join fileimage b on(b.galleryid = a.galleryid) " +
			"WHERE status = 'hd' and "; 
			if (!galleryCode.equals("")) 	sqlStmt = sqlStmt + "a.galleryid = '"+galleryCode+"' AND "; 
			sqlStmt = sqlStmt + "a.galleryid <> '' group by a.galleryid, b.imagename order by b.status desc, a.galleryid, b.imagename";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				galleryCode 	= rs.getString("galleryid");
				galleryName 	= rs.getString("galleryname"); 
				imageName 		= rs.getString("imagename");
				pathfile 		= rs.getString("pathfile"); 
				grStatus		= rs.getString("status"); 
				
				imageList.add(new UploadImageForm(galleryCode, galleryName, imageName, pathfile, grStatus));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return imageList;
	 }
	public List GetImageDTList(String galleryCode) 
	throws Exception { //30-05-2014
		List imageList = new ArrayList();
		String galleryName = "", imageName = "", pathfile = "", grStatus = "";
	 
		try {
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT a.galleryid, a.galleryname, b.imagename, b.pathfile, b.status " +
			"FROM gallery_master a inner join fileimage b on(b.galleryid = a.galleryid) " +
			"WHERE status = 'dt' and "; 
			if (!galleryCode.equals("")) 	sqlStmt = sqlStmt + "a.galleryid = '"+galleryCode+"' AND "; 
			sqlStmt = sqlStmt + "a.galleryid <> '' group by a.galleryid, b.imagename order by b.status desc, a.galleryid, b.imagename";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				galleryCode 	= rs.getString("galleryid");
				galleryName 	= rs.getString("galleryname"); 
				imageName 		= rs.getString("imagename");
				pathfile 		= rs.getString("pathfile"); 
				grStatus		= rs.getString("status"); 
				
				imageList.add(new UploadImageForm(galleryCode, galleryName, imageName, pathfile, grStatus));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return imageList;
	 }
	public List GetImageList(String galleryCode) 
	throws Exception { //30-05-2014
		List imageList = new ArrayList();
		String galleryName = "", imageName = "", pathfile = "", grStatus = "";
	 
		try {
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT a.galleryid, a.galleryname, b.imagename, b.pathfile, b.status " +
			"FROM gallery_master a inner join fileimage b on(b.galleryid = a.galleryid) " +
			"WHERE "; 
			if (!galleryCode.equals("")) 	sqlStmt = sqlStmt + "a.galleryid = '"+galleryCode+"' AND "; 
			sqlStmt = sqlStmt + "a.galleryid <> '' group by a.galleryid, b.imagename order by b.status desc, a.galleryid, b.imagename";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				galleryCode 	= rs.getString("galleryid");
				galleryName 	= rs.getString("galleryname"); 
				imageName 		= rs.getString("imagename");
				pathfile 		= rs.getString("pathfile"); 
				grStatus		= rs.getString("status"); 
				
				imageList.add(new UploadImageForm(galleryCode, galleryName, imageName, pathfile, grStatus));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return imageList;
	 }
	
	public void AddImage(String imageName, String galleryID, String pathfile, String statusImage)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO fileimage(imagename, galleryid, pathfile, status) " +
		"VALUES ('"+imageName+"', '"+galleryID+"', '"+pathfile+"', '"+statusImage+"')";
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



