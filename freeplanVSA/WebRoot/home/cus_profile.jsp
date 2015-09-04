<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.cus.vsa.form.*" %>
<%@ page import="com.cus.vsa.data.*" %>
<%@ page import="com.vsa.util.DBConnect" %>
<%
	String userName = "";
	if(session.getAttribute("userName") != null) userName = session.getAttribute("userName").toString();
	
	List customerList = null;
	String name = "", surName = "", tel = "";
	CusLoginDB cusLoginDB = new CusLoginDB();
	customerList = cusLoginDB.CustomerList(userName);
	if (customerList.size() == 1) {
		request.setAttribute("customerList", customerList);
		CusLoginForm custInfo = (CusLoginForm) customerList.get(0);
		name = custInfo.getName();
		surName = custInfo.getSurName();
		tel = custInfo.getTel();
	}

 %> 
 
 
<!DOCTYPE HTML>
<html>
	<head>
		<title>VSA GROUP FREE PLAN :: HOME</title>
		<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
			media="all">
		<link href="css/style.css" rel="stylesheet" type="text/css"
			media="all" />
		<link rel="stylesheet" href="css/chocolat.css" type="text/css"
			media="screen" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="application/x-javascript">
addEventListener("load", function() {
	setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
	window.scrollTo(0, 1);
}</script>
		<script src="js/jquery-1.11.1.min.js">
</script>
		<link rel="stylesheet" href="css/flexslider.css" type="text/css"
			media="screen" />

	</head>
	<body >
		<!--top-header-->
		<div id="home" class="top-header">
			<div class="container">
				<div class="logo">
					<h1>
						<a href="index.jsp">Home Me</a>
					</h1>
				</div>
				<div class="top-menu">
					<span class="menu"><img src="images/nav-icon.png" alt="" />
					</span>
					<ul>
						<li>
							<a class="scroll font-menu" href="../cus_index.jsp">หน้าแรก</a>
						</li>
						<li>
							<a class="scroll font-menu" href="#service">บริการ</a>
						</li>
						<li>
							<a class="scroll font-menu" href="#about">เกี่ยวกับ</a>
						</li>
						<li>
							<a class="scroll font-menu" href="#gallery">แกลอรี่</a>
						</li>
						<li>
							<a class="scroll font-menu" href="#blog">ข่าวสาร</a>
						</li>
						<li>
							<a class="scroll font-menu" href="#contact">ติดต่อ</a>
						</li>
					</ul>
					<!-- script-for-menu -->
					<script>
$("span.menu").click(function() {
	$(".top-menu ul").slideToggle("slow", function() {
	});
});
</script>
					<!-- script-for-menu -->
				</div>
			</div>
		</div>
		
		<!--navigation customer-->
		<div class="edit-profile">
			  
			  <html:form action="/cusEditProfile" styleClass="form-signin app-cam" >
			  <h2 class="form-heading">แก้ไขข้อมูลส่วนตัว</h2>
			      <p>แก้ไขรายละเอียดบุคคล</p>
			      <input type="hidden" id="hdUserName" name="hdUserName" value="<%=userName%>" >
			      <input type="text" id="name" name="name" value="<%=name%>" class="form-control1" placeholder="ชื่อ" >
			      <input type="text" id="surName" name="surName" value="<%=surName%>" class="form-control1" placeholder="นามสกุล">
			      <input type="email" id="userName" name="userName" value="<%=userName%>" class="form-control1" placeholder="อีเมลล์" >
			      <input type="text" id="tel" name="tel" value="<%=tel%>" class="form-control1" placeholder="เบอร์โทรศัพท์" >
			      <select class="form-control" style="background-color: rgb(34, 34, 36); color: rgb(153, 153, 153); height: 45px;">
			      	<option>1</option>
			      	<option>2</option>
			      	<option>3</option> 
			      </select>
				  <p>เปลี่ยนพาสเวิร์ด</p>
			      <input type="password" id="oldPassWord" name="oldPassWord" class="form-control1" placeholder="รหัสผ่านเก่า">
			      <input type="password" id="passWord" name="passWord" class="form-control1" placeholder="รหัสผ่านใหม่">
			      <input type="password" id="conFirmPassword" name="conFirmPassword" class="form-control1" placeholder="รหัสผ่านใหม่ อีกครั้ง">
			   <div class="col-md-6 col-sm-6 col-xs-6 ">
			   		 <button class="btn btn-lg btn-success1 btn-block" type="submit">Save</button>
			   </div>
			   <div class="col-md-6 col-sm-6 col-xs-6 ">
			   		<a href="cus_index_login.jsp" class="btn btn-lg btn-warnning1 btn-block" type="submit">Cancel</a>
			   </div>      
			  </html:form>			
		</div>
		<br><br><br>
	<div class="footer">
	 <div class="container">
		 <p>Copyrights © 2015 Seven All rights reserved | Template by <a href="http://w3layouts.com/">W3layouts</a></p>
		 <div class="social">							
				<a href="#"><i class="facebook"></i></a>
				<a href="#"><i class="twitter"></i></a>
				<a href="#"><i class="dribble"></i></a>	
				<a href="#"><i class="google"></i></a>	
				<a href="#"><i class="youtube"></i></a>	
		 </div>
		 <div class="arrow">
			 <a class="scroll" href="#home"><img src="home/images/top.png" alt=""></a>
		 </div>
	 </div>
</div>
<!---->
	</body>
</html>
