package com.vsa.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

public class UploadImageForm extends ActionForm{

	private FormFile file;
	
	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		this.file = file;
	}
	
	 @Override
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

}
