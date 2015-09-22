<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.vsa.form.CustomerForm" %>
<%@ page import="com.vsa.data.CustomerDB" %>
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
    <meta charset"UTF-8">
     
    <title>Notification</title>
    
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
            overflow: auto;
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
			<h3 class="align-center">Notification</h3>
        	<div class="col-md-4 email-list1 box padding10">
        		<table class="table hovered" width="100%">
        		<tr>
        			<td id="shownorti" class="collection-item avatar email-unread clickable-row" width="100%" data-href='http://www.google.co.th' target="email-detail">
        			  <hr/>
        				<i class="icon_4">G</i>
                      <div class="avatar_left">
                      	<span class="email-title">nontawatch@windowslive.com</span>
                        <p class="truncate grey-text ultra-small">คำร้องขอแบบแปลนบ้าน(บ้านเดี่ยว)</p>
                      </div>
                      <a href="#" class="secondary-content"><span class="blue-text ultra-small">2:15 pm</span></a>
                      
                      <div class="clearfix"></div>
                      <hr/>
        			</td>
        		</tr>
        		<tr>
        			<td class="collection-item avatar email-unread clickable-row" width="100%" data-href='#'>
        			  <hr/>
        				<i class="icon_4">G</i>
                      <div class="avatar_left">
                      	<span class="email-title">nontawatch@windowslive.com</span>
                        <p class="truncate grey-text ultra-small">คำร้องขอแบบแปลนบ้าน(บ้านเดี่ยว)</p>
                      </div>
                      <a href="#" class="secondary-content"><span class="blue-text ultra-small">2:15 pm</span></a>
                      <div class="clearfix"></div>
                      <hr/>
        			</td>
        		</tr>
        		
        		</table>
               <!--  <ul class="collection">
               		<hr/>
                    <li class="collection-item avatar email-unread">
                      <i class="icon_4">G</i>
                      <div class="avatar_left">
                      	<span class="email-title">Gmail</span>
                        <p class="truncate grey-text ultra-small">Sed ut perspiciatis</p>
                      </div>
                      <a href="#!" class="secondary-content"><span class="blue-text ultra-small">2:15 pm</span></a>
                      <div class="clearfix"></div>
                    </li>
                    <hr/>
                    <li class="collection-item avatar email-unread">
                      <i class="icon_4">G</i>
                      <div class="avatar_left">
                      	<span class="email-title">Gmail</span>
                        <p class="truncate grey-text ultra-small">Sed ut perspiciatis</p>
                      </div>
                      <a href="#!" class="secondary-content"><span class="blue-text ultra-small">2:15 pm</span></a>
                      <div class="clearfix"></div>
                    </li>
                    <hr/>
                    <li class="collection-item avatar email-unread">
                      <i class="icon_4">G</i>
                      <div class="avatar_left">
                      	<span class="email-title">Gmail</span>
                        <p class="truncate grey-text ultra-small">Sed ut perspiciatis</p>
                      </div>
                      <a href="#!" class="secondary-content"><span class="blue-text ultra-small">2:15 pm</span></a>
                      <div class="clearfix"></div>
                    </li>
                    <hr/>
                    <li class="collection-item avatar email-unread">
                      <i class="icon_4">G</i>
                      <div class="avatar_left">
                      	<span class="email-title">Gmail</span>
                        <p class="truncate grey-text ultra-small">Sed ut perspiciatis</p>
                      </div>
                      <a href="#!" class="secondary-content"><span class="blue-text ultra-small">2:15 pm</span></a>
                      <div class="clearfix"></div>
                    </li>
                    <hr/>
                    <li class="collection-item avatar email-unread">
                      <a><i class="icon_4">G</i>
                      <div class="avatar_left">
                      	<span class="email-title">Gmail</span>
                        <p class="truncate grey-text ultra-small">Sed ut perspiciatis</p>
                      </div>
                      <a href="#!" class="secondary-content"><span class="blue-text ultra-small">2:15 pm</span></a>
                      <div class="clearfix"></div></a>
                    </li>
                    <hr/>
                    <li class="collection-item avatar email-unread">
                      <i class="icon_4">G</i>
                      <div class="avatar_left">
                      	<span class="email-title">Gmail</span>
                        <p class="truncate grey-text ultra-small">Sed ut perspiciatis</p>
                      </div>
                      <a href="#!" class="secondary-content"><span class="blue-text ultra-small">2:15 pm</span></a>
                      <div class="clearfix"></div>
                    </li>
                    <hr/>
              </ul>-->
        </div>
        <iframe name="email-detail" class="col-md-7 box-detail padding10" style="margin-left: 1%; width: 65%;" src="http://localhost:8080/freeplanVSA/cus_index.jsp"></iframe>
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
