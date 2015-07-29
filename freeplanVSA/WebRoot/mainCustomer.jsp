<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset"UTF-8">
    
    <title>My JSP 'Customer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<!--Loading CSS Core-->
		<link rel="stylesheet" href="metro-ui/build/css/metro.css" />
		<link rel="stylesheet" href="metro-ui/build/css/metro-icons.css" />
		
		
		<!--Loading JS-->
		
		<script src="metro-ui/js/jquery-2.1.4.min.js"></script>
		<script src="metro-ui/js/jquery.dataTables.min.js"></script>
		<script src="metro-ui/build/js/metro.js"></script>
		
		<!--Use Custom Style-->
		<style>
        html, body {
            height: 100%;
        }
        .page-content {
            padding-top: 0;
            min-height: 100%;
            height: 100%;
        }
        .table .input-control.checkbox {
            line-height: 1;
            min-height: 0;
            height: auto;
        }

        @media screen and (max-width: 800px){
            #cell-sidebar {
                flex-basis: 52px;
            }
        }
    </style>

    <script>
        $(function(){
            $(window).on('resize', function(){
                if ($(this).width() <= 800) {
                    $(".sidebar").addClass('compact');
                } else {
                    $(".sidebar").removeClass('compact');
                }
            });
        });

        function pushMessage(t){
            var mes = 'Info|Implement independently';
            $.Notify({
                caption: mes.split("|")[0],
                content: mes.split("|")[1],
                type: t
            });
        }

        $(function(){
            $('.sidebar').on('click', 'li', function(){
                if (!$(this).hasClass('active')) {
                    $('.sidebar li').removeClass('active');
                    $(this).addClass('active');
                }
            })
        })
    </script>
	</head>
	<body class="bg-steel">
	<div>
		<ul class="m-menu fixed-top" >
    <li><a href="#">หน้าแรก</a></li>
    <li>
        <a href="#" class="dropdown-toggle">ภาพรวม</a>
        <div class="m-menu-container" data-role="dropdown" data-no-close="true">
            <div class="grid no-margin">
                <div class="row cells5">
                    <div class="cell padding10">
                        <img src="images/me.jpg">
                    </div>
                    <div class="cell colspan2">
                        <h2 class="fg-white text-bold text-shadow">Metro UI CSS 3.0</h2>
                        <p class="padding20 no-padding-top no-padding-left no-padding-bottom fg-white">
                            Metro UI CSS a set of styles to create a site with an interface similar to Windows 8.
                        </p>
                        <p class="fg-white text-bold">
                            Sergey Pimenov
                        </p>
                    </div>
                    <div class="cell colspan2">
                        <ul class="unstyled-list">
                            <li><h3 class="text-shadow">Begin with Metro UI CSS</h3></li>
                            <li><a class="fg-white" href="#">Requirements</a></li>
                            <li><a class="fg-white" href="#">Doctype</a></li>
                            <li><a class="fg-white" href="#">JavaScript</a></li>
                            <li><a class="fg-white" href="#">Browsers support</a></li>
                            <li><a class="fg-white" href="#">License</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </li>
    <li>
        <a href="#" class="dropdown-toggle">Download</a>
        <div class="m-menu-container" data-role="dropdown" data-no-close="true">
            <ul class="inline-list">
                <li><a href="#">Windows</a></li>
                <li><a href="#">Office</a></li>
                <li><a href="#">Skype</a></li>
                <li><a href="#">Internet Explorer</a></li>
                <li><a href="#">Visio</a></li>
            </ul>
        </div>
    </li>
    <li>
        <a href="#" class="dropdown-toggle">Devices</a>
        <div class="m-menu-container" data-role="dropdown">
            <ul class="inline-list">
                <li><a href="#">Surface</a></li>
                <li><a href="#">Xbox</a></li>
                <li><a href="#">PC & Tables</a></li>
                <li><a href="#">Phones</a></li>
                <li><a href="#">Accessories</a></li>
            </ul>
        </div>
    </li>
    <li><a href="#">ขอความช่วยเหลือ</a></li>
    <li><a href="#">Store</a></li>
    

    <li class="place-right">
    	
        <a href="#" class="dropdown-toggle"><span class="mif-cog"></span>User Name</a>
        <div class="d-menu padding10 place-right no-margin-top block-shadow" data-role="dropdown">
            <h2 class="text-light">Quick settings</h2>
                <ul class="inline-list">
                    <li><a href="" class="fg-black fg-hover-white">Profile</a></li>
                    <li><a href="" class="fg-black fg-hover-white">Security</a></li>
                    <li><a href="" class="fg-black fg-hover-white">Exit</a></li>
                </ul>
        
        </div>
    </li>
    
</ul>
	</div>
    
		<!---------------------Menu-------------------------------------------->
		
		<!-----------------------------sidebar---------------------------------->
		 <div class="page-content">
        <div class="flex-grid no-responsive-future" style="height: 100%;">
            <div class="row" style="height: 100%">
                <div class="cell size-x200" id="cell-sidebar" style="background-color: #71b1d1; height: 100%">
                    <ul class="sidebar">
                        <li><a href="#">
                            <span class="mif-apps icon"></span>
                            <span class="title">all items</span>
                            <span class="counter">0</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-vpn-publ icon"></span>
                            <span class="title">websites</span>
                            <span class="counter">0</span>
                        </a></li>
                        <li class="active"><a href="#">
                            <span class="mif-drive-eta icon"></span>
                            <span class="title">Virtual machines</span>
                            <span class="counter">2</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-cloud icon"></span>
                            <span class="title">Cloud services</span>
                            <span class="counter">0</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-database icon"></span>
                            <span class="title">SQL Databases</span>
                            <span class="counter">0</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-cogs icon"></span>
                            <span class="title">Automation</span>
                            <span class="counter">0</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-apps icon"></span>
                            <span class="title">all items</span>
                            <span class="counter">0</span>
                        </a></li>
                    </ul>
                </div>
                
                <!-----------------------------sidebar---------------------------------->
								<hr>
								<div class="cell auto-size padding20 bg-white">
                    
                    			<div class="table-responsive">
								<table class="table striped hovered cell-hovered">
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
									
								</div>
								</center>
							</div>
						</div>
						
						
						
						
						
						
						
						
						
  </body>
</html>
