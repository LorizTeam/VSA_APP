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

import com.vsa.data.Cust_ProjectDB;
import com.vsa.form.CustomerProjectForm;
import com.vsa.util.DateUtil;

/** 
 * MyEclipse Struts
 * Creation date: 09-28-2009
 * 
 * XDoclet definition:
 * @struts.action path="/login" name="loginForm" scope="request" validate="true"
 */
public class CustomerProjectAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
	
	 	CustomerProjectForm customerProjectForm = (CustomerProjectForm) form;// TODO Auto-generated method stub
		
		String update 				= customerProjectForm.getUpdate();   
		
		String forwardText = "success";
		
		Cust_ProjectDB cust_ProjectDB = new Cust_ProjectDB();
		String alertMassage			= "";
		
		if(update!=null){
		
		if (request.getParameterValues("projectID")!=null){
			String[] projectID				= request.getParameterValues("projectID");
			String[] structure				= request.getParameterValues("structure");
			String[] materialCode			= request.getParameterValues("materialCode");
			String[] amountTotalCust		= request.getParameterValues("amountTotalCust");
			for(int x=0; x<projectID.length; x++)	{
				cust_ProjectDB.UpdateAR(projectID[x], structure[x], materialCode[x], amountTotalCust[x]);
			}
		}
	}
  request.setAttribute("update", update);
		return mapping.findForward(forwardText);
	}
}