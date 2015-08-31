<%@ page import="java.sql.*" %> 
<%@ page contentType="text/html; charset=utf-8" %>
    <%

    String id = request.getParameter("id").toString();
    String buffer="<option value='"+""+"'>"+"-- ตำบล --"+"</option>"; 
    String matcode =""; 
    try{
               Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsadb?useUnicode=true&characterEncoding=UTF-8", "root", "1234");
               Statement st=con.createStatement();
               ResultSet rs=st.executeQuery("select distinct DISTRICT_ID, DISTRICT_NAME from district where AMPHUR_ID = '"+id+"' order by AMPHUR_ID");
			 
		 while(rs.next()){
		   buffer=buffer+"<option value='"+rs.getString("DISTRICT_ID")+"'>"+rs.getString("DISTRICT_NAME")+"</option>";
		   }
	//	 buffer=buffer+"</select>";
		 response.getWriter().println(buffer);
	//	 System.out.println(buffer);
		 }
    catch (Exception e) {
    System.out.println(e);
    }
    %>