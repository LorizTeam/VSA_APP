
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!--top-header
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
					
					<script>
					$("span.menu").click(function() {
						$(".top-menu ul").slideToggle("slow", function() {
						});
					});
					</script>
					
				</div>
			</div>
		</div>
		<!--header-->

<!--navigation customer-->
<div class="container-fluid nav-bg">
	<nav class="cus_nav  blog-grids">
	<a href="http://192.168.1.24:8080/freeplanVSA/cus_index_login.jsp">
			<div class="col-md-2 col-sm-2 thumbnail" style="padding: 20px; ">
				<h4>
					<i class=" glyphicon glyphicon-chevron-left"></i> กลับ
				</h4>
			</div> </a>
	<div class=" row middleblog-grid">
		
		<a href="http://192.168.1.24:8080/freeplanVSA/home/cus_overview.jsp">
			<div class="col-md-4 col-sm-4 thumbnail">
				<h4>
					<i class="glyphicon glyphicon-th-large"></i> ภาพรวม
				</h4>
			</div> </a>
		<a href="http://192.168.1.24:8080/freeplanVSA/cus_detail.jsp"><div class="col-md-4 col-sm-4 thumbnail ">
				<h4>
					<i class="glyphicon glyphicon-pencil"></i> บันทึกค่าใช้จ่าย
				</h4>
			</div> <a href="http://192.168.1.24:8080/freeplanVSA/contact.jsp"><div class="col-md-4 col-sm-4 thumbnail ">
					<h4>
						<i class=" glyphicon glyphicon-comment"></i> ติดต่อ
					</h4>
				</div> </a>
	</div>
	</nav>
</div>