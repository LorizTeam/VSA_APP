<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
%>
<html lang="en">
  <head>
    <meta charset"UTF-8">
     
    <title>Customer</title>
    
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

					<!-- /.menu top -->	
					<jsp:include page="/menu_top.jsp"></jsp:include>
                    <!-- /.menu top --> 
                    
        <!-- /.page-content -->	            
        <div class="page-content">
        <div class="flex-grid no-responsive-future" style="height: 100%;">
         <div class="row" style="height: 100%">     
                   
                    <!-- /.menu left -->	
                    <jsp:include page="/menu_left.jsp"></jsp:include>
                    <!-- /.menu left -->
				 
                	<!-----------------------------table---------------------------------->
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
                		<!-----------------------------table---------------------------------->		
	 					
	 					</div>
					</center>
				</div>
			</div>
		 <!-- /.page-content -->	 				
  </body>
</html>
