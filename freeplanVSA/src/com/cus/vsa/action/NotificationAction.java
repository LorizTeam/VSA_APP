/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.cus.vsa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.cus.vsa.data.NotificationDB;
import com.cus.vsa.form.NotificationForm;
import com.vsa.util.DateUtil;
 
public class NotificationAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession sessionCus = request.getSession();
		NotificationDB notificationDB = new NotificationDB(); 
		NotificationForm notificationForm = (NotificationForm) form; 
		
		String name			= new String(notificationForm.getName().getBytes("ISO8859_1"), "utf-8");
		String email 		= notificationForm.getEmail().toLowerCase();
		String messageHD 	= new String(notificationForm.getMessageHD().getBytes("ISO8859_1"), "utf-8");
		String messageDT 	= new String(notificationForm.getMessageDT().getBytes("ISO8859_1"), "utf-8");
		
		DateUtil dateUtil = new DateUtil();
		String dateTime 	= dateUtil.curDateTime();
		
		String forwardText = "";
		String alertMassage = "กรุณากรอกข้อมูลให้ครบ";
		
		if(name != "" && email != "" && messageHD != "" && messageDT != ""){
			notificationDB.insertNotification(name, email, messageHD, messageDT, dateTime, "ur", "a");
		}
		
		if(sessionCus.getAttribute("nameCus") != null){
		  forwardText = "login";
		}else{
		  forwardText = "nologin";
		}
		
		request.setAttribute("alertMassage", alertMassage);
		
		return mapping.findForward(forwardText);
	}
}