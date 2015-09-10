	<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<br />
		<!--navigation customer-->
		<div class="">
			<nav class="cus_nav  blog-grids">
			<div class=" row middleblog-grid">

				<a href="cus_overview.jsp"><div class="col-md-4 col-sm-4 thumbnail">
						<h4>
							<i class="glyphicon glyphicon-th-large"></i> ภาพรวม
						</h4>
					</div> </a>
				<a href="cus_detail.jsp"><div
						class="col-md-4 col-sm-4 thumbnail ">
						<h4>
							<i class="glyphicon glyphicon-pencil"></i> บันทึกค่าใช้จ่าย
						</h4>
					</div> <a href="#"><div class="col-md-4 col-sm-4 thumbnail ">
							<h4>
								<i class=" glyphicon glyphicon-comment"></i> ติดต่อ
							</h4>
						</div> </a>
			</div>
			</nav>
		</div>