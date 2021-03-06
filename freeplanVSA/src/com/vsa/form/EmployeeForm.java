/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.vsa.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class EmployeeForm extends ActionForm {
	
	private static final long serialVersionUID = 1L;
	private String employeeID;
	private String employeeName;
	private String employeeSurName;
	private String employeeTel;
	private String employeeEmail;
	private String employeeDept;
	
	public EmployeeForm(){};
	public EmployeeForm (String employeeID, String employeeName, String employeeSurName, String employeeTel,
			String employeeEmail, String employeeDept){
		super();
		this.employeeID 			= employeeID;
		this.employeeName			= employeeName;
		this.employeeSurName 		= employeeSurName;
		this.employeeTel			= employeeTel;
		this.employeeEmail 			= employeeEmail;
		this.employeeDept			= employeeDept;
}
	public void reset() {
	
	}
	
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}
	public String getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(String employeeID) {
		this.employeeID = employeeID;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getEmployeeSurName() {
		return employeeSurName;
	}
	public void setEmployeeSurName(String employeeSurName) {
		this.employeeSurName = employeeSurName;
	}
	public String getEmployeeTel() {
		return employeeTel;
	}
	public void setEmployeeTel(String employeeTel) {
		this.employeeTel = employeeTel;
	}
	public String getEmployeeEmail() {
		return employeeEmail;
	}
	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}
	public String getEmployeeDept() {
		return employeeDept;
	}
	public void setEmployeeDept(String employeeDept) {
		this.employeeDept = employeeDept;
	}
}