/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.cus.vsa.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.cus.vsa.data.CusLoginDB;
import com.cus.vsa.form.CusLoginForm;
import com.vsa.util.DateUtil;

public class CusRegisterAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		CusLoginForm cusLoginForm = (CusLoginForm) form;// TODO Auto-generated method stub
		CusLoginDB cusLoginDB = new CusLoginDB();
	
		String userName = cusLoginForm.getUserName().toLowerCase();
		String passWord = cusLoginForm.getPassWord();
		String conFirmPassword = cusLoginForm.getConFirmPassword();
		String name = new String(cusLoginForm.getName().getBytes("ISO8859_1"), "utf-8");
		String surName = new String(cusLoginForm.getSurName().getBytes("ISO8859_1"), "utf-8");
		String tel = cusLoginForm.getTel();
		String sex = cusLoginForm.getSex();
	
		boolean chkRegister = false;
		
		DateUtil dateUtil = new DateUtil();
		String date = dateUtil.CnvToYYYYMMDD(dateUtil.curDate(), '-');
		
		String forwardText = "success";
		
		if(userName != "" && passWord != "" && conFirmPassword != "" && name != "" && surName != "" && tel != "" && userName != null 
				&& passWord != null && conFirmPassword != null && name != null && surName != null && tel != null) {
			
			if(passWord.equals(conFirmPassword)){
				String nameV = name+" "+surName;
				chkRegister = cusLoginDB.ChkRegister(userName, nameV);
				if(chkRegister==true){
					request.setAttribute("alertMessage", "Password ซ้ำ");
					request.setAttribute("lockScreen", "register");
				}else{
					cusLoginDB.registerNew(userName, passWord, nameV, "cus", date, tel);
					cusLoginDB.AddCustomer(name, surName, tel, userName, date, "", "", "", "", "", "", "", "");
					request.setAttribute("lockScreen", "login");
				}
			}else{
				request.setAttribute("alertMessage", "Password ไม่ตรงกัน ");
				request.setAttribute("lockScreen", "register");
			}
		
		} else {
				request.setAttribute("alertMessage", "กรุณากรอกข้อมูลให้ครบถ้วน ");
				request.setAttribute("lockScreen", "register");
		}
		
		return mapping.findForward(forwardText);
	}
}