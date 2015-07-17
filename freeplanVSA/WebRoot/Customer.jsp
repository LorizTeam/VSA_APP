<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'Customer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<link rel="stylesheet" href="flat-ui/dist/css/vendor/bootstrap.css">
	<link rel="stylesheet" href="flat-ui/dist/css/flat-ui.css">
	<link rel="stylesheet" href="bootstrap/css/dashboard.css">
	
    <script type="text/javascript" src="flat-ui/dist/js/vendor/jquery.min.js"></script>	
	<script type="text/javascript" src="flat-ui/dist/js/flat-ui.js"></script>
	
  </head>
  
  <body>
    <nav class="navbar navbar-default navbar-fixed-top">
				  <div class="container">
				    <div class="navbar-header">
				      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-01">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
				      <a class="navbar-brand" href="index.html">SMICT</a>
				    </div>
				  	<div class="collapse navbar-collapse navbar-right" id="navbar-collapse-01">
					    <ul class="nav navbar-nav">
					      <li><a href="gallery.html">Gallery</a></li>
					      <li><a href="#blueprint">Blueprint</a></li>
					      <li><a href="#about">About</a></li>
					      <li><a href="#contact">Contact Us</a></li>
					      <li><a href="#" data-toggle="modal" data-target="#modalregis">Register</a></li>
					      <li><a href="#" data-toggle="modal" data-target="#modalsignin">Sign in</a></li>
					    </ul>
				    </div>				    
				  </div>

				</nav>
				<aside class="container-fluid">
					<div class="row">
						<div class="col-sm-3 col-md-2 sidebar">
							<ul class="nav nav-sidebar">
								<li><a href="#">โครงการ</a></li>
					            <li><a href="#">Detail</a></li>
								<li><a href="Customer.jsp">Customer</a></li>
								<li><a href="#">Department</a></li>
					            <li><a href="Employee.jsp">Employee</a></li>
					            <li><a href="#">Material</a></li>

					        </ul>

						</div>
					</div>
				</aside>
						<div class="visible-lg hidden-md hidden-xs hidden-sm" style="margin-top: 0.5%;"></div>
						<div class="visible-md hidden-xs hidden-lg hidden-sm" style="margin-top: 3%;"></div>
						<div class="visible-sm hidden-md hidden-lg hidden-xs" style="margin-top: 3%;"></div>
						<div class="visible-xm hidden-md hidden-lg hidden-sm" style="margin-top: 4%;"></div>
						
						
						<div class="container-fuild">
							<div class="row">
								<div class="thumbnail col-lg-10" style="margin-left: 12em; padding-left: 2em;">
								<center>
								<div class="form-inline">
								<form class="form-group" action="">
									<label>ชื่อ</label> 
									<input type="text" id="customerName" name="customerName" placeholder="name"/> 
									<label>E-mail</label> 
									<input type="email" id="customerEmail" name="customerEmail" placeholder="email"> 
									<input class="btn btn-danger" type="submit" id="Search" name="search" value="Search" />
								</form>
								</div>
								<hr>
								
								<div class="table-responsive">
								<table class="table table-hover">
									<tr>
										<th><center>ลำดับ</center></th>
										<th><center>ชื่อ</center></th>
										<th><center>นามสกุล</center></th>
										<th><center>เบอร์โทรศัพท์</center></th>
										<th><center>วันเดือนปีเกิด</center></th>
										<th><center>บ้านเลขที่</center></th>
										<th><center>หมู่</center></th>
										<th><center>หมู่บ้าน</center></th>
										<th><center>ถนน</center></th>
										<th><center>ตำบล</center></th>
										<th><center>อำเภอ</center></th>
										<th><center>จังหวัด</center></th>
										<th><center>รหัสไปรษณีย์</center></th>
									</tr>
									<tr>
										<td id="CustomerID"><center></center></td>
										<td id="CustomerName"><center></center></td>
										<td id="CustomerSurname"><center></center></td>
										<td id="CustomerTel"><center></center></td>
										<td id="CustomerDOB"><center></center></td>
										<td id="CustomerHouseNo"><center></center></td>
										<td id="CustomerVillageNo"><center></center></td>
										<td id="CustomerVillage"><center></center></td>
										<td id="CustomerLane"><center></center></td>
										<td id="CustomerSubDistrict"><center></center></td>
										<td id="CustomerDistrict"><center></center></td>
										<td id="CustomerProvince"><center></center></td>
										<td id="CustomerPostCode"><center></center></td>
									</tr>
								</table>
								</div>	
								</div>
								</center>
							</div>
						</div>
						
						
						
						
						
						
						
						
						
  </body>
</html>
