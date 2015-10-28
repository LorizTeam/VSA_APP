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
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String forwardText = "success";
		
		DateUtil dateUtil = new DateUtil();
		UploadImageForm uploadImageForm = (UploadImageForm) form;
		ImportImageDB importImageDB = new ImportImageDB();
		
		String galleryCodeG = request.getParameter("galleryCode");
		String imageNameG = request.getParameter("imageName");
		
		String galleryID = uploadImageForm.getGalleryCode();
		
		if(!"".equals(galleryID)&&"".equals(imageNameG)){
		
		String fileName = "", filePath = "", usePath = ""; FormFile file = null;
		filePath =  getServlet().getServletContext().getRealPath("//") +"\\upload";
		usePath = "upload/";
		
		// ------------------------------------------------  file hd
		if(uploadImageForm.getFileHD() != null){
			file = uploadImageForm.getFileHD();
			fileName = file.getFileName();
		
		File folder = new File(filePath);
	    if(!folder.exists()){
	    	folder.mkdir();
	    }
		
	    fileName = file.getFileName();
	    String date = dateUtil.CnvToYYYYMMDD(dateUtil.curDate(), '-');
	    String time = dateUtil.curTime1();
	    String dateTime = date+" "+time;
	    if(!("").equals(fileName)){  
	    	
	    	String[] fname = fileName.split("\\.");
	   // 	fileName = fname[0];
	    //	dateTime = fname[1];
	    	dateTime = dateTime.replace(":", "-");
	    	String imageName = dateTime+"."+fname[1];
	    	
	    	System.out.println("Server path: " +filePath+" - "+imageName);
	        File newFile = new File(filePath, imageName);
              
	        if(!newFile.exists()){
	        	
	          importImageDB.AddImageHD(imageName, galleryID, usePath+imageName, "hd");
	        	
	          FileOutputStream fos = new FileOutputStream(newFile);
	          fos.write(file.getFileData());
	          fos.flush();
	          fos.close();
	        }  
	     }   
	  }
		
		// ------------------------------------------------  file 1
		if(uploadImageForm.getFile() != null){
			file = uploadImageForm.getFile();
			fileName = file.getFileName();
		
		File folder = new File(filePath);
	    if(!folder.exists()){
	    	folder.mkdir();
	    }
		
	    fileName = file.getFileName();
	    String date = dateUtil.CnvToYYYYMMDD(dateUtil.curDate(), '-');
	    String time = dateUtil.curTime1();
	    String dateTime = date+" "+time;
	    if(!("").equals(fileName)){  
	    	
	    	String[] fname = fileName.split("\\.");
	   // 	fileName = fname[0];
	    //	dateTime = fname[1];
	    	dateTime = dateTime.replace(":", "-");
	    	String imageName = dateTime+"."+fname[1];
	    	
	    	System.out.println("Server path: " +filePath+" - "+imageName);
	        File newFile = new File(filePath, imageName);
              
	        if(!newFile.exists()){
	        	
	          importImageDB.AddImage(imageName, galleryID, usePath+imageName, "dt");
	        	
	          FileOutputStream fos = new FileOutputStream(newFile);
	          fos.write(file.getFileData());
	          fos.flush();
	          fos.close();
	        }  
	     }   
	  }
		// ------------------------------------------------  file 2
		if(uploadImageForm.getFile1() != null){
			file = uploadImageForm.getFile1();
			fileName = file.getFileName();
		
		File folder = new File(filePath);
	    if(!folder.exists()){
	    	folder.mkdir();
	    }
		
	    fileName = file.getFileName();
	    String date = dateUtil.CnvToYYYYMMDD(dateUtil.curDate(), '-');
	    String time = dateUtil.curTime1();
	    String dateTime = date+" "+time;
	    if(!("").equals(fileName)){  
	    	
	    	String[] fname = fileName.split("\\.");
	   // 	fileName = fname[0];
	    //	dateTime = fname[1];
	    	dateTime = dateTime.replace(":", "-");
	    	String imageName = dateTime+"."+fname[1];
	    	
	        System.out.println("Server path: " +filePath+" - "+imageName);
	        File newFile = new File(filePath, imageName);
              
	        if(!newFile.exists()){
	        	
	          importImageDB.AddImage(imageName, galleryID, usePath+imageName, "dt");
	        	
	          FileOutputStream fos = new FileOutputStream(newFile);
	          fos.write(file.getFileData());
	          fos.flush();
	          fos.close();
	        }  
	     }   
	  }
		// ------------------------------------------------  file 3
		if(uploadImageForm.getFile2() != null){
			file = uploadImageForm.getFile2();
			fileName = file.getFileName();
		
		File folder = new File(filePath);
	    if(!folder.exists()){
	    	folder.mkdir();
	    }
		
	    fileName = file.getFileName();
	    String date = dateUtil.CnvToYYYYMMDD(dateUtil.curDate(), '-');
	    String time = dateUtil.curTime1();
	    String dateTime = date+" "+time;
	    if(!("").equals(fileName)){  
	    	
	    	String[] fname = fileName.split("\\.");
	   // 	fileName = fname[0];
	    //	dateTime = fname[1];
	    	dateTime = dateTime.replace(":", "-");
	    	String imageName = dateTime+"."+fname[1];
	    	
	    	System.out.println("Server path: " +filePath+" - "+imageName);
	        File newFile = new File(filePath, imageName);
              
	        if(!newFile.exists()){
	        	
	          importImageDB.AddImage(imageName, galleryID, usePath+imageName, "dt");
	        	
	          FileOutputStream fos = new FileOutputStream(newFile);
	          fos.write(file.getFileData());
	          fos.flush();
	          fos.close();
	        }  
	     }   
	  }
		// ------------------------------------------------  file 4
		if(uploadImageForm.getFile3() != null){
			file = uploadImageForm.getFile3();
			fileName = file.getFileName();
		
		File folder = new File(filePath);
	    if(!folder.exists()){
	    	folder.mkdir();
	    }
		
	    fileName = file.getFileName();
	    String date = dateUtil.CnvToYYYYMMDD(dateUtil.curDate(), '-');
	    String time = dateUtil.curTime1();
	    String dateTime = date+" "+time;
	    if(!("").equals(fileName)){  
	    	
	    	String[] fname = fileName.split("\\.");
	   // 	fileName = fname[0];
	    //	dateTime = fname[1];
	    	dateTime = dateTime.replace(":", "-");
	    	String imageName = dateTime+"."+fname[1];
	    	
	    	System.out.println("Server path: " +filePath+" - "+imageName);
	        File newFile = new File(filePath, imageName);
              
	        if(!newFile.exists()){
	        	
	          importImageDB.AddImage(imageName, galleryID, usePath+imageName, "dt");
	        	
	          FileOutputStream fos = new FileOutputStream(newFile);
	          fos.write(file.getFileData());
	          fos.flush();
	          fos.close();
	        }  
	     }   
	  }
	}else{ 
		if(!"".equals(galleryCodeG)&&!"".equals(!"".equals(imageNameG))) {
		String filePath1 =  getServlet().getServletContext().getRealPath("//") +"\\upload\\"+imageNameG+" ";
		File file1 = new File(filePath1);
		file1.delete();
		importImageDB.DeleteImage(imageNameG, galleryCodeG);
		}
		System.out.println("Select Gallery");
	}
		return mapping.findForward(forwardText);
	}
	
}