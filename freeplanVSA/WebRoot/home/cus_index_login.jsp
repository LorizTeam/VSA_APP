<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<!--
Au<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
	<head>
		<title>VSA GROUP FREE PLAN :: HOME</title>
		<link href="http://localhost:8080/freeplanVSA/home/css/bootstrap.css" rel="stylesheet" type="text/css"
			media="all">
		<link href="http://localhost:8080/freeplanVSA/home/css/style.css" rel="stylesheet" type="text/css"
			media="all" />
		<link rel="stylesheet" href="http://localhost:8080/freeplanVSA/home/css/chocolat.css" type="text/css"
			media="screen" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="application/x-javascript">
addEventListener("load", function() {
	setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
	window.scrollTo(0, 1);
}
</script>
<style>

.header {
    background: transparent url("http://localhost:8080/freeplanVSA/home/images/banner.jpg") no-repeat scroll 0px -157px / cover;
}

</style>
		<script src="http://localhost:8080/freeplanVSA/home/js/jquery-1.11.1.min.js">
</script>
		<link rel="stylesheet" href="http://localhost:8080/freeplanVSA/home/css/flexslider.css" type="text/css"
			media="screen" />

	</head>
	<body>
		<!--top-header-->
		<div id="home" class="top-header">
			<div class="container">
				<div class="logo">
					<h1>
						<a href="index.jsp">Home Me</a>
					</h1>
				</div>
				<div class="top-menu">
					<span class="menu"><img src="http://localhost:8080/freeplanVSA/home/images/nav-icon.png" alt="" />
					</span>
					<ul>
						<li>
							<a class="scroll font-menu" href="http://localhost:8080/freeplanVSA/cus_index.jsp">หน้าแรก</a>
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
		<!--header-->
		<div class="header cus_pro">
			<div class="cus_pro-in">
				<div class="container">
					<div class="banner-info ban_cus_pro">
						<img src="http://localhost:8080/freeplanVSA/images/1.png" class="img-profile" />
						<h2>
							Name Customer
						</h2>
						<h3>
							แบบบ้าน :
							<small>บ้านเดี่ยว 2 ชั้น <a href="home/cus_overview.jsp">ดู</a>
							</small>
						</h3>
						<a class="btn-login" href="http://localhost:8080/freeplanVSA/home/cus_profile.jsp">แก้ไขข้อมูลสมาชิก</a>
						<a class="btn-out" href="http://localhost:8080/freeplanVSA/cus_index.jsp">ออกจากระบบ</a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		

		<%@include file="../cus_index_detail.jsp" %>
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
			 <a class="scroll" href="#home"><img src="images/top.png" alt=""></a>
		 </div>
	 </div>
</div>
<!---->
<script type="text/javascript">
		$(document).ready(function() {
				/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
				*/
		$().UItoTop({ easingType: 'easeOutQuart' });
});
</script>
<a href="#to-top" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!----> 


</body>
</html>		
	