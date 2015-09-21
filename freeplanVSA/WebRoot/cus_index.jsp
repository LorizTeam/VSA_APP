<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<link href="home/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<link href="home/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="home/css/chocolat.css" type="text/css" media="screen" />
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="home/js/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="home/css/flexslider.css" type="text/css" media="screen" />
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
				<h1><a href="index.jsp">Home Me</a></h1>
		 </div>
		 <div class="top-menu">
			 <span class="menu"><img src="home/images/nav-icon.png" alt=""/></span>
			 <ul>
				<li><a class="scroll font-menu" href="#home">หน้าแรก</a></li>
				<li><a class="scroll font-menu" href="#service">บริการ</a></li>
				<li><a class="scroll font-menu" href="#about">เกี่ยวกับ</a></li>
				<li><a class="scroll font-menu" href="#gallery">แกลอรี่</a></li>
				<li><a class="scroll font-menu" href="#blog">ข่าวสาร</a></li>
				<li><a class="scroll font-menu" href="#contact">ติดต่อ</a></li>
			 </ul>
		     <!-- script-for-menu -->
				 <script>					
							$("span.menu").click(function(){
								$(".top-menu ul").slideToggle("slow" , function(){
								});
							});
				 </script>
		     <!-- script-for-menu -->
		  </div>
	 </div>
</div>	
<!--header-->
<div class="header">
		<div class="container">
			 <div class="banner-info">
				 <h2>สมัครได้แล้ววันนี้</h2>
				 <p>สมัครวันนี้พบกับแบบบ้านหลากหลายแบบ และรับส่วนลดมากมายจาก Partner ต่างๆ  </p>
				 <a href="cus_register.jsp">Register</a> <a class="btn-login" href="cus_login.jsp">เข้าสู่ระบบ</a> 
			 </div>
			 <div class="clearfix"></div>
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
			 <a class="scroll" href="#home"><img src="home/images/top.png" alt=""></a>
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
	