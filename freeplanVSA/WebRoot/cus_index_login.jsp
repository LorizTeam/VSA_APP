<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%	String statusProj = "";
	if(session.getAttribute("statusProj") != null){
	statusProj = session.getAttribute("statusProj").toString();
	}
 %>
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
		<link rel="stylesheet" href="css/uikit.min.css"/> 
		<link href="home/css/bootstrap.css" rel="stylesheet" type="text/css"
			media="all">
		<link href="home/css/style.css" rel="stylesheet" type="text/css"
			media="all" />
		<link rel="home/css/chocolat.css" type="text/css"
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
    background: transparent url("home/images/banner.jpg") no-repeat scroll 0px -157px / cover;
}

</style>
		<script src="home/js/jquery-1.11.1.min.js">
</script>
		<link rel="stylesheet" href="home/css/flexslider.css" type="text/css"
			media="screen" />
	<!--scrolling-->
<script type="text/javascript" src="home/js/move-top.js"></script>
<script type="text/javascript" src="home/js/easing.js"></script>
 <script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
			});
		});
	</script>
<!--scrolling-->
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
					<span class="menu"><img src="home/images/nav-icon.png" alt="" />
					</span>
					<ul>
						<li>
							<a class="scroll font-menu" href="cus_index.jsp">หน้าแรก</a>
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
							<a class="scroll font-menu" href="#blog">ช่วยเหลือ</a>
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
						<%if(statusProj.equals("01")){ %>
						<h3>
							แบบบ้าน :
							<small>บ้านเดี่ยว 2 ชั้น 
							 <a href="http://192.168.1.24:8080/freeplanVSA/home/cus_overview.jsp">ดู</a>
							</small>
						</h3>
						<%} else if (statusProj.equals("02")) {%>
						<h3>
							สถานะ :
							<small>รอการอนุมัติ
							</small>
						</h3>
						<%} else {%>
						<h3>
							สถานะ :
							<small>
							 ยังไม่มีการขอแบบบ้าน
							</small>
						</h3>
						<%}%>
						
						<a class="btn-login" href="http://192.168.1.24:8080/freeplanVSA/home/cus_profile.jsp">แก้ไขข้อมูลสมาชิก</a>
						<a class="btn-out" href="http://192.168.1.24:8080/freeplanVSA/cus_index.jsp">ออกจากระบบ</a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		

		<%@include file="cus_index_detail.jsp" %>
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
	