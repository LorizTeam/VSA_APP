/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.vsa.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class ProjectForm extends ActionForm {
	
	private static final long serialVersionUID = 1L;
	private String projectID;
	private String projectName;
	private String employeeID;
	private String employeeName;
	private String customerID;
	private String customerName;
	private String materialCode;
	private String materialName;
	private String createDate;
	private String projectType;
	private String galleryName;
	private String projectStatus;
	private String projectAddress;
	private String weight;
	private String amount;
	private String amountTotal;
	private String unit;
	private String structure;
	private String customerEmail;
	
	private String add;
	private String update;
	private String delete;
	private String view;
	
	public ProjectForm(){};
	public ProjectForm (String projectID, String projectName, String employeeID, String employeeName,
			String customerID, String customerName, String createDate, String projectType, String galleryName, 
			String projectStatus, String projectAddress, String customerEmail){
		super();
		this.projectID 				= projectID;
		this.projectName			= projectName;
		this.employeeID 			= employeeID;
		this.employeeName			= employeeName;
		this.customerID 			= customerID;
		this.customerName			= customerName;
		this.createDate 			= createDate;
		this.projectType			= projectType;
		this.galleryName			= galleryName;
		this.projectStatus 			= projectStatus;
		this.projectAddress			= projectAddress;
		this.customerEmail			= customerEmail;
}
	public ProjectForm(String projectID, String projectName, String structure, String materialCode, String materialName,
			String weight, String amount, String amountTotal, String unit){
		super();
		this.projectID 				= projectID;
		this.projectName			= projectName;
		this.structure				= structure;
		this.materialCode 			= materialCode;
		this.materialName			= materialName;
		this.weight 				= weight;
		this.amount					= amount;
		this.amountTotal 			= amountTotal;
		this.unit					= unit;
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
	public String getProjectID() {
		return projectID;
	}
	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
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
	public String getMaterialCode() {
		return materialCode;
	}
	public void setMaterialCode(String materialCode) {
		this.materialCode = materialCode;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getProjectType() {
		return projectType;
	}
	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	public String getProjectStatus() {
		return projectStatus;
	}
	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}
	public String getProjectAddress() {
		return projectAddress;
	}
	public void setProjectAddress(String projectAddress) {
		this.projectAddress = projectAddress;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getAmountTotal() {
		return amountTotal;
	}
	public void setAmountTotal(String amountTotal) {
		this.amountTotal = amountTotal;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getAdd() {
		return add;
	}
	public void setAdd(String add) {
		this.add = add;
	}
	public String getUpdate() {
		return update;
	}
	public void setUpdate(String update) {
		this.update = update;
	}
	public String getDelete() {
		return delete;
	}
	public void setDelete(String delete) {
		this.delete = delete;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	public String getStructure() {
		return structure;
	}
	public void setStructure(String structure) {
		this.structure = structure;
	}
	public String getGalleryName() {
		return galleryName;
	}
	public void setGalleryName(String galleryName) {
		this.galleryName = galleryName;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
}