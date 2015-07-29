<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Flat UI</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	
    <!-- Loading Bootstrap -->
    <link rel="stylesheet" href="flat-ui/dist/css/vendor/bootstrap.css">
    <link rel="stylesheet" href="bootstrap/css/dashboard.css">

    <!-- Loading Flat UI -->
    <link rel="stylesheet" href="flat-ui/dist/css/flat-ui.css">
    <script src="js/jquery-1.11.2.min.js"></script>
    
    <!-- Loading font-awesome -->
    <link href="css/font-awesome.css" rel="stylesheet">

    <link rel="shortcut icon" href="img/favicon.ico">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="dist/js/vendor/html5shiv.js"></script>
      <script src="dist/js/vendor/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <header>
			
		</header>
		
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
				
						<div class="visible-lg hidden-md hidden-xs hidden-sm" style="margin-top: 1%;"></div>
						<div class="visible-md hidden-xs hidden-lg hidden-sm" style="margin-top: 1%;"></div>
						<div class="visible-sm hidden-md hidden-lg hidden-xs" style="margin-top: 3%;"></div>
						<div class="visible-xm hidden-md hidden-lg hidden-sm" style="margin-top: 4%;"></div>
						
				
				
				
				<section>
						<article class="col-md-offset-2 container-fluid">
							<div class="row">
								<div class="thumbnail">
								<form class="form-inline" action="">
								<div class="form-group col-lg-offset-">
								<input type="text" class="form-control" placeholder="Search...">	
								<button type="submit" class="btn btn-danger"><i class="fa fa-search"></i> Search</button>	
								</div>	
								</form>
								<button type="submit" class="btn btn-danger" > Create New Customer</button>
								<hr />
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
						</article>			
				</section>

		

		
		<footer class="col-md-offset-2 container-fluid">
			<div class="row">
				<div class="col-lg-offset-1 col-lg-5">
				<h3 class="footer-title">Site map</h3>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra neque auctor nulla cursus porta. C
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut viverra neque auctor nulla cursus porta. C
					<br /><br />
					<p>
						<a href="#link1">Link 1</a>
						<a href="#link2">Link 2</a>
						<a href="#link3">Link 3</a>
						<a href="#link4">Link 4</a>
						<a href="#link5">Link 5</a>
					</p>
				</div>
			</div>
		</footer>

    <!-- jQuery (necessary for Flat UI's JavaScript plugins) -->
    <script type="text/javascript" src="flat-ui/dist/js/vendor/jquery.min.js"></script>	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="dist/js/vendor/video.js"></script>
	<script type="text/javascript" src="flat-ui/dist/js/flat-ui.js"></script>

  </body>
</html>
