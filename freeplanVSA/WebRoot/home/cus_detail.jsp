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
		<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
			media="all">
			
		<link href="css/style.css" rel="stylesheet" type="text/css"
			media="all" />
		<link rel="stylesheet" href="css/chocolat.css" type="text/css"
			media="screen" />
		<link href="css/uikit-accordion/accordion.min.css" rel="stylesheet" type="text/css">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="application/x-javascript">
addEventListener("load", function() {
	setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
	window.scrollTo(0, 1);
}</script>
		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/uikit.min.js"></script>
		<link rel="stylesheet" href="css/flexslider.css" type="text/css"
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
		<!--header-->
		<br/>
		<!--navigation customer-->
		<div class="">
			<nav class="cus_nav  blog-grids">
			<div class=" row middleblog-grid">
				
				<a href="#"><div class="col-md-4 col-sm-4 thumbnail">
						<h4><i class="glyphicon glyphicon-th-large"></i>
							ภาพรวม
						</h4>
					</div> </a>
				<a href="#"><div class="col-md-4 col-sm-4 thumbnail ">
						<h4><i class="glyphicon glyphicon-th-list"></i>
						
							รายละเอียด
						</h4>
					</div>
				
				<a href="#"><div class="col-md-4 col-sm-4 thumbnail ">
						<h4><i class=" glyphicon glyphicon-comment"></i>
							ติดต่อ
						</h4>
					</div>
				</a>
				
			</div>
			</nav>
		</div>
		
		<section class="container">
			<article class="row ">
				<div class="col-md-4">
					<img alt="บ้านเดี่ยว 2 ชั้น" src="../images/1-1.jpg" class="img-responsive ">
				</div>
				<div class="col-md-8  thumbnail">
					<!-- Detail project -->
					
					<h3>รายละเอียด</h3>					
					<blockquote class="row">
						<div class="col-md-4"><h4>ประเภท </h4><h4><small> บ้านเดี่ยว 2 ชั้น</small></h4></div>
						<div class="col-md-4"><h4>ราคาก่อสร้าง โดยประมาณ</h4><h4><small> 1,200,000 บาท</small></h4></div>
						<div class="col-md-4"><h4>เวลาก่อสร้างโดยประมาณ</h4><h4><small> 6 เดือน</small></h4></div>
					</blockquote>
					<!-- Accorion -->
					<blockquote class="row ">
					<h3>บันทึกค่าใช้จ่าย</h3>
					</blockquote >
						<div class="uk-accordion" data-uk-accordion="{showfirst:false}">
						    <h3 class="uk-accordion-title">หลังคา 
						    	<i class="close glyphicon glyphicon-align-justify"></i>
						    </h3>
						    <div class="uk-accordion-content">containt</div>
						
						    <h3 class="uk-accordion-title">ตัวบ้าน
						    	<i class="close glyphicon glyphicon-align-justify"></i>
						    </h3>
						    <div class="uk-accordion-content">containt</div>
						
						    <h3 class="uk-accordion-title">รากฐาน
						    	<i class="close glyphicon glyphicon-align-justify"></i>
						    </h3>
						    <div class="uk-accordion-content">containt</div>
						</div>
					<!-- /Accorion -->
					
				</div>
				<!-- History project -->
		<h3>
			รายการซื้อวัสดุล่าสุด
			<small><a href="#"> - ดูทั้งหมด</a>
			</small>
		</h3>
		<hr />
		<div class="row">

			<div class="col-md-12">
				<table class="table table-bordered table-hover">
					<tr>
						<th>
							ลำดับที่
						</th>
						<th>
							รายการที่ซื้อ
						</th>
						<th>
							จำนวน
						</th>
						<th>
							ราคา
						</th>
						<th>
							วันที่
						</th>

					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>

					</tr>
				</table>
			</div>
		</div>
			</article>
		</section>
		
		
		
		<script src="js/accordion.js"></script>
		
	</body>
</html>
