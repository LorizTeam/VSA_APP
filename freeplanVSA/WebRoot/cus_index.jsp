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
<!--Service-->
<div id="service" class="service">
	 <div class="container">
		 <h3>การบริการ</h3>	
		 <div class="service-grids">
		 <div class="icon-grids">
			 <div class="col-md-6 futr-grid futr1">
				 <div class="icon-pic">
						<div class="icon text-center">
						 <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
						 </div>
				  </div>
				 <div class="icon-info">
						 <h4><a href="#">Vestibulum sagittis</a></h4>							
						 <p>Aliquam erat volutpat. Nam egestas dapibus pellentesque. Nunc non luctus neque, non aliquet tortor. Suspendisse in faucibus dolor, commodo malesuada ipsum. Cras vel facilisis mi. In malesuada felis eu volutpat consequat.</p>
				 </div>
				 <div class="clearfix"></div>
			 </div>
			 <div class="col-md-6 futr-grid">
				  <div class="icon-pic">
							<div class="icon text-center">
							<span class="glyphicon glyphicon-thumbs-up glyphicon-briefcase" aria-hidden="true"></span>
						 </div>
				  </div>
				  <div class="icon-info">
						<h4><a href="#">Enter Text Here...</a></h4>						 
						<p>Mauris vestibulum pulvinar urna id ultricies. Etiam volutpat interdum mi in aliquet. Pellentesque vel tincidunt sapien.
		 Suspendisse potenti. Nam sed </p>
				  </div>
				  <div class="clearfix"></div>
			 </div>
			 <div class="clearfix"></div>
		 </div>
		 <div class="icon-grids grids2">
			 <div class="col-md-6 futr-grid futr1">
				 <div class="icon-pic">
						<div class="icon text-center">
						 <span class="glyphicon glyphicon-picture" aria-hidden="true"></span>
						 </div>
				  </div>
				 <div class="icon-info">
						 <h4><a href="#">Vestibulum sagittis</a></h4>							
						 <p>Aliquam erat volutpat. Nam egestas dapibus pellentesque. Nunc non luctus neque, non aliquet tortor. Suspendisse in faucibus dolor, commodo malesuada ipsum. Cras vel facilisis mi. In malesuada felis eu volutpat consequat.</p>
				 </div>
				 <div class="clearfix"></div>
			 </div>
			 <div class="col-md-6 futr-grid">
				  <div class="icon-pic">
							<div class="icon text-center">
							 <span class="glyphicon glyphicon-user glyphicon-dashboard" aria-hidden="true"></span>
						 </div>
				  </div>
				  <div class="icon-info">
						<h4><a href="#">ระบบสมาชิกที่ใช้งานง่าย</a></h4>						 
						<p>ด้วยระบบควบคุมต้นทุน ที่ใช้งานง่าย ช่วยให้ทำงานง่ายขึ้น</p>
				  </div>
				  <div class="clearfix"></div>
			 </div>
			 <div class="clearfix"></div>
		 </div>
		 </div>
	 </div>
</div>
<!--about-->
<div id="about" class="about">	 
	 <div class="about-left"></div>
	 <div class="about-right">
		<h3>เกี่ยวกับ</h3>
		<h4>Vivamus ac mi ut tortor elementum venenatis.</h4>
		<p>Mauris vestibulum pulvinar urna id ultricies. Etiam volutpat interdum mi in aliquet. Pellentesque vel tincidunt sapien.
		 Suspendisse potenti. Nam sed scelerisque est. Vestibulum non leo ligula. Donec aliquet viverra semper. Donec sed est ac sem suscipit vehicula.
		 Mauris nec nunc enim. Etiam aliquet risus et nunc rhoncus facilisis. Maecenas nec blandit ex. Nam nec dolor in nisl elementum malesuada. 
		 Fusce vitae eleifend magna. Curabitur tincidunt tincidunt vulputate.Etiam mollis nibh risus, a faucibus arcu ultricies eu. Morbi 
		 consectetur, metus vel efficitur luctus, nisi nulla vestibulum arcu, at rhoncus ligula ligula non nisl. Cras porttitor vestibulum nulla.</p>		
	 </div>
	 <div class="clearfix"></div>
</div>
<!--gallery -->
		<script src="home/js/jquery.chocolat.js"></script>		
		<!--light-box-files -->
		<script type="text/javascript">
		$(function() {
			$('.moments-bottom a').Chocolat();
		});
		</script> 
<!--gallery js-->
<div id="gallery" class="gallery">
	 <div class="container">
		 <h3>แกลอรี่</h3>
         <div class="gallery-info">
				<div class="col-md-4 galry-grids moments-bottom">
					<a class="b-link-stripe b-animate-go" href="home/images/img15.jpg">
						<img src="home/images/img15.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
							<span class="b-animate b-from-left    b-delay03 ">
								<img class="img-responsive" src="home/images/e.png" alt=""/>
							</span>					
						</div>
					</a>				
				</div>
				<div class="col-md-4 galry-grids moments-bottom">
					<a class="b-link-stripe b-animate-go" href="home/images/img10.jpg">
						<img src="home/images/img10.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
							<span class="b-animate b-from-left b-delay03 ">
								<img class="img-responsive" src="home/images/e.png" alt=""/>
							</span>					
						</div>
					</a>				
				</div>
				<div class="col-md-4 galry-grids moments-bottom">
					<a class="b-link-stripe b-animate-go" href="home/images/img11.jpg">
						<img src="home/images/img11.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
							<span class="b-animate b-from-left    b-delay03 ">
								<img class="img-responsive" src="home/images/e.png" alt=""/>
							</span>					
						</div>
					</a>				
				</div>				
				<div class="col-md-4 galry-grids moments-bottom">
					<a class="b-link-stripe b-animate-go" href="home/images/img12.jpg">
						<img src="home/images/img12.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
							<span class="b-animate b-from-left    b-delay03 ">
								<img class="img-responsive" src="home/images/e.png" alt=""/>
							</span>					
						</div>
					</a>				
				</div>
				<div class="col-md-4 galry-grids moments-bottom">
					<a class="b-link-stripe b-animate-go" href="home/images/img13.jpg">
						<img src="home/images/img13.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
							<span class="b-animate b-from-left    b-delay03 ">
								<img class="img-responsive" src="home/images/e.png" alt=""/>
							</span>					
						</div>
					</a>				
				</div>
				<div class="col-md-4 galry-grids moments-bottom">
					<a class="b-link-stripe b-animate-go" href="home/images/img14.jpg">
						<img src="home/images/img14.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
							<span class="b-animate b-from-left    b-delay03 ">
								<img class="img-responsive" src="home/images/e.png" alt=""/>
							</span>					
						</div>
					</a>				
				</div>
				<div class="col-md-4 galry-grids moments-bottom">
					<a class="b-link-stripe b-animate-go" href="home/images/img9.jpg">
						<img src="home/images/img9.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
							<span class="b-animate b-from-left    b-delay03 ">
								<img class="img-responsive" src="home/images/e.png" alt=""/>
							</span>					
						</div>
					</a>				
				</div>
				<div class="col-md-4 galry-grids moments-bottom">
					<a class="b-link-stripe b-animate-go" href="home/images/img16.jpg">
						<img src="home/images/img16.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
							<span class="b-animate b-from-left    b-delay03 ">
								<img class="img-responsive" src="home/images/e.png" alt=""/>
							</span>					
						</div>
					</a>				
				</div>
				<div class="col-md-4 galry-grids moments-bottom">
					<a class="b-link-stripe b-animate-go" href="home/images/img17.jpg" >
						<img src="home/images/img17.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
							<span class="b-animate b-from-left    b-delay03 ">
								<img class="img-responsive" src="home/images/e.png" alt=""/>
							</span>					
						</div>
					</a>				
				</div>
				<div class="clearfix"> </div>
			</div>
	 </div>
</div>
<!---->
<div id="blog" class="blog">
	 <div class="container">
		 <h3>ข่าวสาร</h3>
		 <div class="blog-grids">
			 <div class="col-md-6 blog-grid">
				 <a href="#"><img src="home/images/b1.jpg" class="img-responsive" alt=""/></a> 
				 <h4><a href="#">Etiam luctus velit ac cursus lobortis.</a></h4>
					<span>Mar 12 | 2015</span>
				 <p>Aenean eget eleifend nulla. Nunc vel nisi mi. Ut faucibus ornare tempus. Donec non mi et sem convallis tincidunt ac in purus. Nullam tincidunt orci elit, vitae vulputate sapien ullamcorper et. Sed ut est purus. Duis consectetur suscipit ullamcorper. Nam dictum nisl odio, eget maximus ante interdum iaculis urna sapien.</p>				 
			 </div>
			 <div class="col-md-6 blog-grid">
				 <a href="#"><img src="home/images/b2.jpg" class="img-responsive" alt=""/> </a> 
				 <h4><a href="#">Etiam luctus velit ac cursus lobortis.</a></h4>
					<span>Mar 12 | 2015</span>
				 <p>Aenean eget eleifend nulla. Nunc vel nisi mi. Ut faucibus ornare tempus. Donec non mi et sem convallis tincidunt ac in purus. Nullam tincidunt orci elit, vitae vulputate sapien ullamcorper et. Sed ut est purus. Duis consectetur suscipit ullamcorper. Nam dictum nisl odio, eget maximus ante interdum iaculis urna sapien.</p>
			 </div>
			 <div class="clearfix"></div>
			 <div class="middleblog-grid blog-grid">
				 <a href="#"><img src="home/images/b3.jpg" class="img-responsive" alt=""/> </a> 
				 <h4><a href="#">Etiam luctus velit ac cursus lobortis.</a></h4>
					<span>Mar 12 | 2015</span>
				 <p>Aenean eget eleifend nulla. Nunc vel nisi mi. Ut faucibus ornare tempus. Donec non mi et sem convallis tincidunt ac in purus. Nullam tincidunt orci elit, vitae vulputate sapien ullamcorper et. Sed ut est purus. Duis consectetur suscipit ullamcorper. Nam dictum nisl odio, eget maximus ante interdum iaculis urna sapien.</p>
				
			 </div>
		 </div>
	 </div>
</div>
<!---->		
<div class="map">
	 <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6632.248000703498!2d151.265683!3d-33.7832959!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12abc7edcbeb07%3A0x5017d681632bfc0!2sManly+Vale+NSW+2093%2C+Australia!5e0!3m2!1sen!2sin!4v1433329298259" style="border:0"></iframe>
</div>
<!---->	
<div id="contact" class="contact">
	 <div class="container">
		 <h3>ติดต่อเรา</h3>
		 <div class="touch-top">
			 <div class="col-md-8 touch-left">
				 <form>
					<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" />
					<input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" />
					<textarea onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}"></textarea>
					<input type="submit" value="SUBMIT">				
				 </form>	
			 </div>
			 <div class="col-md-4 touch-right">
					<div class="touch-right-top">
							<span class="add"> </span>
							<h4>123 MAIN STREET,<label>CITY, COUNTRY</label></h4>
					</div>
					<div class="touch-right-top">
							<span class="mail"> </span>
							<p><a href="mailto:example@email.com">EMAIL@DOMAIN.COM</a></p>
					</div>
					<div class="touch-right-top">
							<span class="num"> </span>
							<p>+0123 456 789</p>
					</div>
			 </div>
				<div class="clearfix"></div>
		  </div>
	 </div>
</div>
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
	