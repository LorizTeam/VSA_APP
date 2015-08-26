package com.vsa.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 

import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class logoutAction {
	
	ActionForward execute(ActionMapping mapping, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String forwardText = "success";
		
		HttpSession session = request.getSession();
		session.removeAttribute("userName");
		
		return mapping.findForward(forwardText);
	}

}
