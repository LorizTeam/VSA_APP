/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.vsa.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import java.io.IOException;
import java.io.InputStream; 

import jxl.Cell;
import jxl.JXLException;
import jxl.Workbook;

 
import com.vsa.data.ImportExcelDB;
import com.vsa.form.ImportExcelForm;
import com.vsa.util.DateUtil;

import org.apache.commons.codec.net.URLCodec;
/** 

/** 
 * MyEclipse Struts
 * Creation date: 09-30-2009
 * 
 * XDoclet definition:
 * @struts.action path="/import" name="importForm" scope="request" validate="true"
 */
public class ImportExcelAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
		ImportExcelForm importForm = (ImportExcelForm) form;// TODO Auto-generated method stub
		String forwardText = null; 
		HttpSession session = request.getSession();
		String userName = session.getAttribute("name").toString();
		
        FormFile myFile = importForm.getTheFile(); 
        String contentType = myFile.getContentType();
        String fileName = new URLCodec("UTF-8").decode(myFile.getFileName()); 
        String alertMas = "", alertMas1 = "";
     //   String fileName    = myFile.getFileName();
        int fileSize       = myFile.getFileSize();
        System.out.println("contentType: " + contentType);
        System.out.println("File Name: " + fileName);
        System.out.println("File Size: " + fileSize);	
   //     System.out.println("Type: " + new URLCodec("UTF-8").decode(importForm.getType()));
        DateUtil dateUtil = new DateUtil();
        ImportExcelDB importExcelDB = new ImportExcelDB();
        String projectID = importExcelDB.SelectDocno(userName);
        try {
		 InputStream is =  myFile.getInputStream();
	     
		 String[][] fieldHD = new String[2][6];
		 String[] fieldDT = new String[1024];
		 
	     byte[] junk = new byte[1024];
	    
	     int bytesRead = 0;
	     
	     String[] sheetName = null;
	     
	     // the first four lines are request junk
	     //bytesRead = is.read(junk, 0, junk.length);
	     //bytesRead = is.read(junk, 0, junk.length);
	     //bytesRead = is.read(junk, 0, junk.length);
	     //bytesRead = is.read(junk, 0, junk.length);
	     
	     Workbook workbook = Workbook.getWorkbook(is);
	     
	     // Do stuff with the workbook
	     
	     String sheetsName = workbook.getSheetNames()[0];
	     
	     int row = workbook.getSheet(sheetsName).getRows();
	     int column = workbook.getSheet(sheetsName).getColumns();

	     int h=0,g=1;
	     String projectName = "", proCust = "", proDate = "", proType = "", proStatus = "", proAddress = "";
	     
	     while(h<=5) {
	     
	     Cell cell = workbook.getSheet(sheetsName).getCell(g,h);
	     fieldHD[g][h] = cell.getContents();
	    		 
	     h++;g=1;
	     }
	     projectName 	= fieldHD[1][0];
	     proCust 		= fieldHD[1][1];
	     proDate 		= fieldHD[1][2];
	     proType 		= fieldHD[1][3];
	     proStatus 		= fieldHD[1][4];
	     proAddress 	= fieldHD[1][5];
	     
	     importExcelDB.AddProjectHD(projectID, projectName, userName, proCust, dateUtil.CnvToYYYYMMDD(proDate, '-'), proType, proStatus, proAddress);
	     
	     int i = 8;
	     int j = 0;
	     int r = 1;
	     String structure = "", materialCode = "", weight = "", amount = "", amountTotal = "";
	     
	     while(i<row) {
	    	 while(j<column) {
	    		 Cell cell = workbook.getSheet(sheetsName).getCell(j,i);
	    		 fieldDT[j] = cell.getContents();
	    		 j++;
	    	 }
	    	 
	    	 structure 		= fieldDT[0];
	    	 materialCode 	= fieldDT[1];
	    	 weight 		= fieldDT[2];
	    	 amount 		= fieldDT[3];
	    	 amountTotal 	= fieldDT[4];
	  
	    	 weight 		= weight.replace(",", "");
	    	 amount 		= weight.replace(",", "");
	    	 amountTotal 	= weight.replace(",", "");
	    	 
	    	 importExcelDB.AddProjectDT(projectID, structure, materialCode, weight, amount, amountTotal);
		
			 alertMas1 = alertMas;
			 forwardText = "success";
			 request.setAttribute("report", "Import successful !");
	    	 
	    	 i++;
	    	 j=0;
	    	 r++;
	     }
	     if(!alertMas.equals("")){
	     alertMas = "error row ("+alertMas+")";
	     alertMas = alertMas.replace(", )", ")");
	     request.setAttribute("alertMas", alertMas);
	     }
	   } catch (JXLException e) {
		   e.printStackTrace();
	   }
	   return mapping.findForward(forwardText);
	}
}