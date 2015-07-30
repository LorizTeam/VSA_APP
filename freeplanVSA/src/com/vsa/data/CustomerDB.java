package com.vsa.data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.vsa.form.CustomerForm;
import com.vsa.util.DBConnect;
import com.vsa.util.DateUtil;

public class CustomerDB {
	
	DBConnect agent 	= new DBConnect();
	Connection conn		= null;
	Statement pStmt 	= null;
	Statement pStmt1 	= null;
	ResultSet rs		= null;
	DateUtil dateUtil = new DateUtil();
	
	public List GetCustomerList(String customerID, String customerName) 
	throws Exception { //30-05-2014
		List customerList = new ArrayList();
		String customerSurName = "", customerTel = "", customerEmail = "";
		String customerDOB = "", customerHouseNo = "", customerVillageNo = "", customerVillage = "", customerLane = ""; 
		String customerSubDistrict = "", customerDistrict = "", customerProvince = "", customerPostCode = "";
		try {
		
			conn = agent.getConnectMYSql();
			
			String sqlStmt = "SELECT customer_id, customer_name, customer_surname, customer_tel, customer_email, " +
				"customer_dob, customer_houseno, customer_villageno, customer_village, customer_lane, customer_subdistrict, customer_district, " +
				"customer_province, customer_postcode, b.DISTRICT_NAME, c.AMPHUR_NAME, d.PROVINCE_NAME " +
			"FROM customer_master a " +
			"Left JOIN district b on(b.DISTRICT_ID = a.customer_subdistrict) " +
			"Left JOIN amphur c on(c.AMPHUR_ID = a.customer_district) " +
			"Left JOIN province d on(d.PROVINCE_ID = a.customer_province) " +
			"WHERE "; 
			if(!customerID.equals("")) sqlStmt = sqlStmt+ "customer_id like '"+customerID+"%' AND ";
			if(!customerName.equals("")) sqlStmt = sqlStmt+ "customer_name like '"+customerName+"%' AND ";
			
			sqlStmt = sqlStmt + "customer_id <> '' group by customer_id order by customer_id";
			
			//System.out.println(sqlStmt);				
			pStmt = conn.createStatement();
			rs = pStmt.executeQuery(sqlStmt);	
			while (rs.next()) {
				customerID 		= rs.getString("customer_id");
				if (rs.getString("customer_name") != null) 		customerName = rs.getString("customer_name"); else customerName = "";
				if (rs.getString("customer_surname") != null) 	customerSurName = rs.getString("customer_surname"); else customerSurName = "";
				customerTel 		= rs.getString("customer_tel"); 
				customerEmail 		= rs.getString("customer_email"); 
				customerDOB 		= rs.getString("customer_dob");
				customerHouseNo 	= rs.getString("customer_houseno"); 
				customerVillageNo 	= rs.getString("customer_villageno"); 
				customerVillage 	= rs.getString("customer_village");
				customerLane 		= rs.getString("customer_lane"); 
				customerSubDistrict = rs.getString("DISTRICT_NAME"); 
				customerDistrict 	= rs.getString("AMPHUR_NAME");
				customerProvince 	= rs.getString("PROVINCE_NAME"); 
				customerPostCode 	= rs.getString("customer_postcode");
				
				if(customerDOB!=null) customerDOB = dateUtil.CnvToDDMMYYYY(customerDOB);
				
				customerList.add(new CustomerForm(customerID, customerName, customerSurName, customerTel, 
						customerEmail, customerDOB, customerHouseNo, customerVillageNo, customerVillage, 
						customerLane, customerSubDistrict, customerDistrict, customerProvince, customerPostCode));
			}
			rs.close();
			pStmt.close();
			conn.close();
		} catch (SQLException e) {
		    throw new Exception(e.getMessage());
		}
		return customerList;
	 }

	public void AddCustomer(String customerID, String customerName, String customerSurName, String customerTel, String customerEmail, 
			String customerDOB, String customerHouseNo, String customerVillageNo, String customerVillage, String customerLane, 
			String customerSubDistrict, String customerDistrict, String customerProvince, String customerPostCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "INSERT IGNORE INTO customer_master(customer_id, customer_name, customer_surname, customer_tel, customer_email, " +
				"customer_dob, customer_houseno, customer_villageno, customer_village, customer_lane, customer_subdistrict, customer_district, " +
				"customer_province, customer_postcode) " +
		"VALUES ('"+customerID+"', '"+customerName+"', '"+customerSurName+"', '"+customerTel+"', '"+customerEmail+"', '"+customerDOB+"', " +
				"'"+customerHouseNo+"', '"+customerVillageNo+"', '"+customerVillage+"', '"+customerLane+"', '"+customerSubDistrict+"', " +
				"'"+customerDistrict+"', '"+customerProvince+"', '"+customerPostCode+"')";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void UpdateCustomer(String customerID, String customerName, String customerSurName, String customerTel, String customerEmail, 
			String customerDOB, String customerHouseNo, String customerVillageNo, String customerVillage, String customerLane, 
			String customerSubDistrict, String customerDistrict, String customerProvince, String customerPostCode)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "UPDATE customer_master set customer_name = '"+customerName+"', customer_surname = '"+customerSurName+"', " +
				"customer_tel = '"+customerTel+"', customer_email = '"+customerEmail+"', customer_dob '"+customerDOB+"', customer_houseno '"+customerHouseNo+"', " +
				"customer_villageno = '"+customerVillageNo+"', customer_village = '"+customerVillage+"', customer_lane '"+customerLane+"', customer_subdistrict '"+customerSubDistrict+"', " +
				"customer_district = '"+customerDistrict+"', customer_province = '"+customerProvince+"', customer_postcode '"+customerPostCode+"' " +
				"WHERE customer_id = '"+customerID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public void DeleteCustomer(String customerID)  throws Exception{
		conn = agent.getConnectMYSql();
		
		String sqlStmt = "DELETE customer_master "+
		"WHERE customer_id = '"+customerID+"'";
		//System.out.println(sqlStmt);
		pStmt = conn.createStatement();
		pStmt.executeUpdate(sqlStmt);
		pStmt.close();
		conn.close();
	}
	public boolean getCheckMaster(String customerID) throws Exception {
	
	boolean chkCustomer = false;
	conn = agent.getConnectMYSql();
 	
 	String sqlStmt = "SELECT customer_id " +
	"FROM customer_master WHERE customer_id = '"+customerID+"' ";
 	
 	pStmt = conn.createStatement();
	rs = pStmt.executeQuery(sqlStmt);	
	
	while (rs.next()) {
		chkCustomer = true;
	}
	
	rs.close();
	pStmt.close();
	
	return chkCustomer;
	}
}
