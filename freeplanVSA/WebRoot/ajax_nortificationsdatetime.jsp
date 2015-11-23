<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.vsa.util.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
	String noNorti = request.getParameter("noNorti");
	DBConnect dbcon = new DBConnect();
	ResultSet rs = null;
	String sql = "select datetime from notifications where no = '"+noNorti+"'";
	Connection conn = dbcon.getConnectMYSql();
	Statement stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	
	String date = "";
	String day = "", month = "", year = "", time = "";
	
	while(rs.next()){
%>
<%  date = rs.getString("datetime");
	date = date.replace(".0", "");
	
	year = date.substring(0,4);
	month = date.substring(5, 7);
	day = date.substring(8, 10);
	time = date.substring(11);
	date = day+"/"+month+"/"+year+" "+time;
 %>
 <%=date%>

<%
	}
%>