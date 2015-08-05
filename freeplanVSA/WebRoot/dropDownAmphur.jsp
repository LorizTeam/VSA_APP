<%@ page import="java.sql.*" %> 
<%@ page contentType="text/html; charset=utf-8" %>
    <%

    String name = request.getParameter("name").toString();
    String buffer="<option value='"+""+"'>"+"-- อำเภอ --"+"</option>"; 
    String matcode =""; 
    try{
               Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsadb", "root", "");
               Statement st=con.createStatement();
               ResultSet rs=st.executeQuery("select distinct AMPHUR_ID, AMPHUR_NAME from amphur where PROVINCE_ID = '"+name+"' order by PROVINCE_ID ASC limit 20");

		 while(rs.next()){
		   buffer=buffer+"<option value='"+rs.getString("AMPHUR_ID")+"'>"+rs.getString("AMPHUR_NAME")+"</option>";
		   }
	//	 buffer=buffer+"</select>";
		 response.getWriter().println(buffer);
	//	 System.out.println(buffer);
		 }
    catch (Exception e) {
    System.out.println(e);
    }
    %>