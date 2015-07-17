/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.vsa.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class CustomerForm extends ActionForm {
	
	private static final long serialVersionUID = 1L;
	private String customerID;
	private String customerName;
	private String customerSurName;
	private String customerTel;
	private String customerEmail;
	private String customerDOB;
	private String customerHouseNo;
	private String customerVillageNo;
	private String customerVillage;
	private String customerLane;
	private String customerSubDistrict;
	private String customerDistrict;
	private String customerProvince;
	private String customerPostCode;
	
	public CustomerForm(){};
	public CustomerForm (String customerID, String customerName, String customerSurName, String customerTel,
			String customerEmail, String customerDOB, String customerHouseNo, String customerVillageNo,
			String customerVillage, String customerLane, String customerSubDistrict, String customerDistrict,
			String customerProvince, String customerPostCode){
		super();
		this.customerID 			= customerID;
		this.customerName			= customerName;
		this.customerSurName 		= customerSurName;
		this.customerTel			= customerTel;
		this.customerEmail 			= customerEmail;
		this.customerDOB			= customerDOB;
		this.customerHouseNo 		= customerHouseNo;
		this.customerVillageNo		= customerVillageNo;
		this.customerVillage 		= customerVillage;
		this.customerLane			= customerLane;
		this.customerSubDistrict	= customerSubDistrict;
		this.customerDistrict		= customerDistrict;
		this.customerProvince		= customerProvince;
		this.customerPostCode		= customerPostCode;
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
	public String getCustomerID() {
		return customerID;
	}
	public void setCustomerID(String customerID) {
		this.customerID = customerID;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerSurName() {
		return customerSurName;
	}
	public void setCustomerSurName(String customerSurName) {
		this.customerSurName = customerSurName;
	}
	public String getCustomerTel() {
		return customerTel;
	}
	public void setCustomerTel(String customerTel) {
		this.customerTel = customerTel;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getCustomerDOB() {
		return customerDOB;
	}
	public void setCustomerDOB(String customerDOB) {
		this.customerDOB = customerDOB;
	}
	public String getCustomerHouseNo() {
		return customerHouseNo;
	}
	public void setCustomerHouseNo(String customerHouseNo) {
		this.customerHouseNo = customerHouseNo;
	}
	public String getCustomerVillageNo() {
		return customerVillageNo;
	}
	public void setCustomerVillageNo(String customerVillageNo) {
		this.customerVillageNo = customerVillageNo;
	}
	public String getCustomerVillage() {
		return customerVillage;
	}
	public void setCustomerVillage(String customerVillage) {
		this.customerVillage = customerVillage;
	}
	public String getCustomerLane() {
		return customerLane;
	}
	public void setCustomerLane(String customerLane) {
		this.customerLane = customerLane;
	}
	public String getCustomerSubDistrict() {
		return customerSubDistrict;
	}
	public void setCustomerSubDistrict(String customerSubDistrict) {
		this.customerSubDistrict = customerSubDistrict;
	}
	public String getCustomerDistrict() {
		return customerDistrict;
	}
	public void setCustomerDistrict(String customerDistrict) {
		this.customerDistrict = customerDistrict;
	}
	public String getCustomerProvince() {
		return customerProvince;
	}
	public void setCustomerProvince(String customerProvince) {
		this.customerProvince = customerProvince;
	}
	public String getCustomerPostCode() {
		return customerPostCode;
	}
	public void setCustomerPostCode(String customerPostCode) {
		this.customerPostCode = customerPostCode;
	}
	
}