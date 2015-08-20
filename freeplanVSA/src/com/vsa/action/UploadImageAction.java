package com.vsa.action;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.vsa.data.ImportImageDB;
import com.vsa.form.UploadImageForm;
import com.vsa.util.DateUtil;


public class UploadImageAction extends Action {
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String forwardText = "success";
		
		DateUtil dateUtil = new DateUtil();
		UploadImageForm uploadImageForm = (UploadImageForm) form;
		ImportImageDB importImageDB = new ImportImageDB();
		FormFile file = uploadImageForm.getFile();
		
		String filePath =  getServlet().getServletContext().getRealPath("/") +"upload";
		
		File folder = new File(filePath);
	    if(!folder.exists()){
	    	folder.mkdir();
	    }
		
	    String fileName = file.getFileName();
	    String dateTime = dateUtil.curDateTime();
	    
	    if(!("").equals(fileName)){  
	    	
	    	String[] fname = fileName.split("\\.");
	   // 	fileName = fname[0];
	    //	dateTime = fname[1];
	    	
	    	String imageName = dateTime+"."+fname[1];
	    	
	        System.out.println("Server path:" +filePath);
	        File newFile = new File(filePath, imageName);
              
	        if(!newFile.exists()){
	        	
	          importImageDB.AddImage(imageName, "1", filePath);
	        	
	          FileOutputStream fos = new FileOutputStream(newFile);
	          fos.write(file.getFileData());
	          fos.flush();
	          fos.close();
	        }  
	        
	        request.setAttribute("uploadedFilePath",newFile.getAbsoluteFile());
	        request.setAttribute("uploadedFileName",newFile.getName());
	    }
		
		return mapping.findForward(forwardText);
	}
}