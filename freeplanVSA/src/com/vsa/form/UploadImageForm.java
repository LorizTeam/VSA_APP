package com.vsa.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

public class UploadImageForm extends ActionForm{
	
	private FormFile fileHD;
	private FormFile file;
	private FormFile file1;
	private FormFile file2;
	private FormFile file3;
	
	private String galleryCode;
	private String galleryName;
	private String imageName;
	private String pathfile;
	private String grStatus;
	
	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		this.file = file;
	}
	
/*	 @Override
	    public ActionErrors validate(ActionMapping mapping,
	    HttpServletRequest request) {
	        ActionErrors errors = new ActionErrors();
	        if(file.getFileSize() == 0)
	             errors.add("uploadedFile", new ActionMessage("errors.file.notselected"));
	        if(errors.isEmpty()){
	            if(!file.getContentType().equalsIgnoreCase("image/jpeg") && !file.getContentType().equalsIgnoreCase("image/jpg")
	            && !file.getContentType().equalsIgnoreCase("image/pjpeg") && !file.getContentType().equalsIgnoreCase("image/png"))
	                errors.add("uploadedFile", new ActionMessage("errors.file.type", file.getFileName(),file.getContentType()));
	            if(file.getFileSize() > 50000)
	                errors.add("uploadedFile", new ActionMessage("errors.file.size",file.getFileName(),file.getFileSize()));
	        }
	        return errors;
	    }
*/
	public UploadImageForm(){};
	public UploadImageForm(String galleryCode, String galleryName, String imageName, String pathfile, String grStatus){
			super();
			this.galleryCode 	= galleryCode;
			this.galleryName 	= galleryName;
			this.imageName 		= imageName;
			this.pathfile 		= pathfile;
			this.grStatus 		= grStatus;
	} 
	 
	public String getGalleryCode() {
		return galleryCode;
	}

	public void setGalleryCode(String galleryCode) {
		this.galleryCode = galleryCode;
	}

	public String getGalleryName() {
		return galleryName;
	}

	public void setGalleryName(String galleryName) {
		this.galleryName = galleryName;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getPathfile() {
		return pathfile;
	}

	public void setPathfile(String pathfile) {
		this.pathfile = pathfile;
	}

	public String getGrStatus() {
		return grStatus;
	}

	public void setGrStatus(String grStatus) {
		this.grStatus = grStatus;
	}

	public FormFile getFile1() {
		return file1;
	}

	public void setFile1(FormFile file1) {
		this.file1 = file1;
	}

	public FormFile getFile2() {
		return file2;
	}

	public void setFile2(FormFile file2) {
		this.file2 = file2;
	}

	public FormFile getFile3() {
		return file3;
	}

	public void setFile3(FormFile file3) {
		this.file3 = file3;
	}

	public FormFile getFileHD() {
		return fileHD;
	}

	public void setFileHD(FormFile fileHD) {
		this.fileHD = fileHD;
	}

}
