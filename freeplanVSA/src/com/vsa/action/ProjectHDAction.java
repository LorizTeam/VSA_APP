/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.vsa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.vsa.data.ProjectDB;
import com.vsa.form.ProjectForm;
import com.vsa.util.DateUtil;

/** 
 * MyEclipse Struts
 * Creation date: 09-28-2009
 * 
 * XDoclet definition:
 * @struts.action path="/login" name="loginForm" scope="request" validate="true"
 */
public class ProjectHDAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProjectForm projectForm = (ProjectForm) form;// TODO Auto-generated method stub
		ProjectDB projectDB = new ProjectDB();
		String projectID		= projectForm.getProjectID();
		String projectName 		= new String(projectForm.getProjectName().getBytes("ISO8859_1"), "utf-8");
		String employeeID 		= projectForm.getEmployeeID();
		String customerID		= projectForm.getCustomerID();
		String customerName 	= new String(projectForm.getCustomerName().getBytes("ISO8859_1"), "utf-8");
		String createDate		= projectForm.getCreateDate();
		String projectType		= projectForm.getProjectType();
		String projectStatus	= projectForm.getProjectStatus();
		String projectAddress	= new String(projectForm.getProjectAddress().getBytes("ISO8859_1"), "utf-8");
		String customerEmail	= projectForm.getCustomerEmail();
		
		String add 				= projectForm.getAdd();
		String update 			= projectForm.getUpdate();
		String delete 			= projectForm.getDelete();
		String view				= projectForm.getView();
		String alertMassage			= "";
		 
		DateUtil dateUtil = new DateUtil();
		String forwardText = null;
	  
		if(add!=null){
			
		if(!projectID.equals("")&&!employeeID.equals("")&&!customerID.equals("")&&!customerName.equals("")
				&&!createDate.equals("")&&!projectType.equals("")&&!projectStatus.equals("")&&!projectAddress.equals("")){
		
			if(!createDate.equals("")) createDate	= dateUtil.CnvToYYYYMMDD(createDate, '-');	
			projectDB.AddProjectHD(projectID, projectName, employeeID, customerID, createDate, projectType, projectStatus, projectAddress);
		
		List projectHDList = projectDB.GetProjectHDList("", "");
		request.setAttribute("projectHDList", projectHDList);
		
		forwardText = "view";
		}else{
			alertMassage = "กรุณา กรอก ข้อมูลให้ครบถ้วน";
			forwardText = "view";
		}
		}
		if(update!=null){
			if(!projectID.equals("")&&!employeeID.equals("")&&!customerID.equals("")&&!customerName.equals("")
					&&!createDate.equals("")&&!projectType.equals("")&&!projectStatus.equals("")&&!projectAddress.equals("")){
		 
				if(!createDate.equals("")) createDate	= dateUtil.CnvToYYYYMMDD(createDate, '-');	
				projectDB.UpdateProjectHD(projectID, projectName, employeeID, customerID, createDate, projectType, projectStatus, projectAddress);
			
				List projectHDList = projectDB.GetProjectHDList("", "");
				request.setAttribute("projectHDList", projectHDList);
			
			forwardText = "view";
		}else{
			alertMassage = "กรุณา กรอก ข้อมูลให้ครบถ้วน";
			forwardText = "view";
		}	
		}
		if(delete!=null){
			projectDB.DeleteProjectHD(projectID);
			
			List projectHDList = projectDB.GetProjectHDList("", "");
			request.setAttribute("projectHDList", projectHDList);
			
			forwardText = "view";
		}
		
		return mapping.findForward(forwardText);
	}
}