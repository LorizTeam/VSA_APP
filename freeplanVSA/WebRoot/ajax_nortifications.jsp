<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.vsa.util.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
	String noNorti = request.getParameter("noNorti");
	DBConnect dbcon = new DBConnect();
	ResultSet rs = null;
	String sql = "select * from nortifications where email = '"+noNorti+"'";
	Connection conn = dbcon.getConnectMYSql();
	Statement stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
<%=rs.getString("email") %>
<%
	}
%>