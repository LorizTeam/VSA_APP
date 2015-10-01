<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.cus.vsa.form.NotificationForm" %>
<%@ page import="com.cus.vsa.data.NotificationDB" %>
<%@ page import="com.vsa.util.DBConnect" %>
<%@ page import="java.sql.*" %>
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
%>
<% 		 
	String menu = "notification";
	request.setAttribute("menu", menu);
%>


<html lang="en">
  <head>
    <meta charset="UTF-8">
          
    <title>Notification</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="uikit/uikit.min.css"/>
	<script src="uikit/js/jquery.js" type="text/javascript"></script>
	<script src="uikit/js/uikit.min.js" type="text/javascript"></script>
	<script src="uikit/js/components/grid.min.js" type="text/javascript"></script>

	<!--Loading CSS Core-->
		<link rel="stylesheet" href="metro-ui/build/css/metro.css" />
		<link rel="stylesheet" href="metro-ui/build/css/metro-icons.css" /> 
		<link rel="stylesheet" href="css/jquery.dataTables.css" /> 

	<!-- Custom CSS -->
	<link href="bootstrap/css/boot_grid.css" rel='stylesheet' type='text/css' />
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<link href="css/font-awesome.css" rel="stylesheet"> 
	<!--Loading JS-->
	 <!-- date picker -->
    <link rel="stylesheet" href="css/jquery-ui.css"/>
		
		<style>
        html, body {
            height: 100%;
            overflow: hidden;
        }
        .page-content {
            padding-top: 0;
            min-height: 100%;
            height: 100%;
            font-size: 70%;
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
        .widthform{
        	width:100% !important;
        }
   
    	th, td { white-space: nowrap; }
    	div.dataTables_wrapper {
        width: 92%;
        margin-top: 0;
        margin-left: 2%;
        margin-right: auto;
        margin-buttom: auto;
    }
    .w{
    	display:block;
    	width:100%;
    	padding:0px!important;
    }
    .box {
	  border: 1px solid #222;
	  border-radius: 10px;
	  height: 300px;
	  overflow-y: auto;
	  overflow-x: hidden;
	}
	.box-detail {
	  border: 1px solid #222;
	  border-radius: 10px;
	  height: 500px;
	  overflow-y: auto;
	  overflow-x: hidden;
	}
	.text-right{
  text-align: right;
}
    </style>

    <script type="text/javascript">
    
        $(function(){
            $(window).on('resize', function(){
                if ($(this).width() <= 800) {
                    $(".sidebar").addClass('compact');
                } else {
                    $(".sidebar").removeClass('compact');
                }
            });
        });
		function shownorti(message){
		 	$('#showehd').val("");
			$('#showdt').val("");
			$('#showemail').val("");
			
			showhdnorti(message);
			showdtnorti(message);
			shownamenorti(message);
			showemailnorti(message);
			showdatetimenorti(message);		
		}
		
		function showhdnorti(message){
			$.ajax({
                    type: "post",
                    url: "ajax_nortificationshd.jsp", //this is my servlet
                    data: {noNorti:message},
                    async:true,
                    success: function(result){
                    	$('#showhd').html(result);
//                            $('#showemail').append(123456);
//                            $('input[name="showemail1"]').val(123456);
//								alert(result);
                    }
                });
		}
		function showdtnorti(message){
			$.ajax({
                    type: "post",
                    url: "ajax_nortificationsdt.jsp", //this is my servlet
                    data: {noNorti:message},
                    async:true,
                    success: function(result){ 
                    	$('#showdt').html(result);	
//								alert(result);
                    }
                });			
		}
		function shownamenorti(message){
			$.ajax({
                    type: "post",
                    url: "ajax_nortificationsname.jsp", //this is my servlet
                    data: {noNorti:message},
                    async:true,
                    success: function(result){ 
                    	$('#showname').html(result);	
//								alert(result);
                    }
                });			
		}
		function showemailnorti(message){
			$.ajax({
                    type: "post",
                    url: "ajax_nortificationsemail.jsp", //this is my servlet
                    data: {noNorti:message},
                    async:true,
                    success: function(result){ 
                    	$('#showemail').html(result);	
//								alert(result);
                    }
                });			
		}
		function showdatetimenorti(message){
			$.ajax({
                    type: "post",
                    url: "ajax_nortificationsdatetime.jsp", //this is my servlet
                    data: {noNorti:message},
                    async:true,
                    success: function(result){ 
                    	$('#showdatetime').html(result);	
//								alert(result);
                    }
                });			
		}
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
        <div class="flex-grid" style="height: 100%;">
        
         <div class="row" style="height: 100%;">     
                   
                    <!-- /.menu left -->	
                    <jsp:include page="/menu_left.jsp"></jsp:include>
                    <!-- /.menu left -->
			<div class="cell auto-size padding20 bg-white">
			<h3 class="align-center">Notification</h3><br/>
			<ul id="fillnoti" class="uk-subnav uk-subnav-pill ">
					<li class="uk-active" data-uk-filter=""><a href="">ทั้งหมด</a></li>
					<li data-uk-filter="rdb"><a href="">ขอแบบบ้าน อ่านแล้ว</a></li>
					<li data-uk-filter="urb"><a href="">ขอแบบบ้าน ยังไม่ได้อ่าน</a></li>
					<li data-uk-filter="rda"><a href="">ทั่วไป อ่านแล้ว</a></li>
					<li data-uk-filter="ura"><a href="">ทั่วไป ยังไม่ได้อ่าน</a></li>
					<form class="uk-form">

						<select>
							<option selected>เรียงจาก</option>
							<option data-uk-sort="my-category:desc">ใหม่สุด</option>
							<option data-uk-sort="my-category">เก่าสุด</option>
						</select>
					</form>
				</ul>
        	<div class="col-md-4 email-list1 box padding10" >
        	
        		<table class="table hovered" width="100%">
        		<tbody class="uk-grid"
					data-uk-grid="{controls: '#fillnoti',gutter:0.1}">
        		<% List notificationList1 = null;
        		   if (request.getAttribute("notificationList") == null) {
						NotificationDB notificationDB = new NotificationDB();
						notificationList1 = notificationDB.Notification();
						}else{
						notificationList1 = (List) request.getAttribute("notificationList");
						}
	   			if (notificationList1 != null) {
					List notificationList = notificationList1;
					int x = 0;
					for (Iterator iter = notificationList.iterator(); iter.hasNext();) {
					x++;
					NotificationForm notification = (NotificationForm) iter.next(); 
					String no 			= notification.getNo();
					String email 		= notification.getEmail();
					String messageHD 	= notification.getMessageHD();
					String dateTime 	= notification.getDateTime();
					String statusRead 	= notification.getStatusRead();
					String statusType 	= notification.getStatusType(); 
					String all = statusRead+statusType;
				%>
        		<tr data-uk-filter="<%=all%>" data-my-category="<%=dateTime%>">
        			<td data-href='#' onclick="shownorti('<%=no%>')" class="collection-item avatar email-unread clickable-row" width="100%"  >
        			  <hr/>
        				<i class="icon_4">G</i>
                      <div class="avatar_left">
                      	<span class="email-title"><%=email%></span>
                        <p class="truncate grey-text ultra-small"><%=messageHD%></p>
                      </div>
                      <a href="#" class="secondary-content"><span class="blue-text ultra-small"><%=dateTime%></span></a>
                      
                      <div class="clearfix"></div>
                      <hr/>
        			</td>
        		</tr>
        		<% }
        		
        		} %>
        		</tbody>
        		</table>
        </div>
        <div name="email-detail" class="container col-md-7 box-detail padding10" style="margin-left: 1%; width: 65%;">
        <br/><br/>
        	<div class="row">
        		<div class="col-md-6">
	        		<b style="color:#959595;">หัวเรื่อง : </b><span id="showhd"></span>
				</div>
				<div  class="col-md-6 text-right">
			       <span id="showdatetime"></span>
			    </div>
        	</div><br/><br/><br/>
			<div class="row">
				<div class="col-md-4">				
				    <b style="color:#959595;">ผู้ส่ง : </b><span id="showname"></span>		   
				</div>
				
			</div><br/><br/><br/>

			<div class="row">
				<div class="col-md-8">
					<b style="color:#959595;">Email : </b><span id="showemail"></span>
				</div>
			</div><br/><br/><br/>
		    <div  class="row">
		    	<div class="col-md-12" >
		        <b style="color:#959595;">รายละเอียด </b><br/><br/>
			        <div style="border: 1px solid #CECECE;padding:10px;border-radius:4px; line-height: 200%;">
			        	<span  id="showdt"></span>
			        </div>
		        </div>
		    </div>

		   
		</div>
            </div>
       		</div>
			</div>
			</div>
		 <!-- /.page-content -->	
 	<!-- DataTables JavaScript -->
	<script src="js/jquery-1.11.1.min.js"></script>
   <script src="js/jquery.dataTables.min.js"></script>
   <!--Use Custom Style-->
   <script src="metro-ui/build/js/metro.js"></script>
   <!-- DataTables JavaScript -->
    <!-- datet -->
	 <script src="js/jquery-ui.js"></script>
	<script>
	jQuery(document).ready(function($) {
    $(".clickable-row").click(function() {
        window.document.location = $(this).data("href");
    });
});
	
    $(document).ready(function() {
    	$.extend( $.fn.dataTable.defaults, {
		    "searching": true,
		    "ordering": false
		} );
        $('#customer').DataTable({
        	 "scrollX":true,
        	 "scrollY":250,
               "language": {
            "lengthMenu": "Display _MENU_ records per page",
            "zeroRecords": "Nothing found - sorry",
            "info": "Showing page _PAGE_ of _PAGES_",
            "infoEmpty": "No records available",
            "infoFiltered": "(filtered from _MAX_ total records)"
        },
        "lengthMenu": [[10, 25, 50, 100,-1], [10, 25, 50, 100, "All"]]
        
        });
    });
    
    $(function() {
		    $( "#customerDOB" ).datepicker({dateFormat: 'dd/mm/yy',
		    yearRange: "1950:yyyy",changeMonth: true,changeYear: true
		    });
	});
  
    </script>
    		
  </body>
</html>
