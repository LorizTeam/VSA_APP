<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.vsa.data.*" %>
<%@ page import="com.cus.vsa.data.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 	
	String menu = "";
	if(request.getAttribute("menu") != ""){ 
		menu = (String)request.getAttribute("menu");
	}
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
	
		<!-----------------------------sidebar---------------------------------->

                <div class="cell size-x200" id="cell-sidebar" style="background-color: #71b1d1; height: 100%">
                    <ul class="sidebar" >
                        <li <%if(menu == "notification"){ %> class="active" <%}%> ><a href="mainNotification.jsp">
                            <span class="mif-notification icon"></span>
                            <span class="title">Notification</span>
							<% NotificationDB notificationDB = new NotificationDB();
							String countNotification = notificationDB.CountNotification();
							%>
                            <span class="counter"><%=countNotification%></span>
                            
                        </a></li>
                        <li  <%if(menu == "project"){ %> class="active" <%}%> ><a href="mainProjectHD.jsp">
                            <span class="mif-apps icon"></span>
                            <span class="title">Project</span>
                            <%	ProjectDB projectDB = new ProjectDB();
                            String countProject = projectDB.CountProject();
							%> 
                            <span class="counter"><%=countProject%></span>
                        </a></li>
                        <li <%if(menu == "importexcel"){ %> class="active" <%}%> ><a href="importExcel.jsp">
                            <span class="mif-vpn-publ icon"></span>
                            <span class="title">Excel Upload File</span>
                            <span class="counter">-</span>
                        </a></li>
                        <li <%if(menu == "customer"){ %> class="active" <%}%> ><a href="mainCustomer.jsp">
                            <span class="mif-drive-eta icon"></span>
                            <span class="title">Customer</span>
                            <%	CustomerDB customerDB = new CustomerDB();
                            String countCustomer = customerDB.CountCustomer();
							%> 
                            <span class="counter"><%=countCustomer%></span>
                            
                        </a></li>
                        <li <%if(menu == "upload"){ %> class="active" <%}%> ><a href="uploadImage.jsp">
                            <span class="mif-cloud icon"></span>
                            <span class="title">Upload Image</span>
                            <span class="counter">-</span>
                        </a></li>
                        <li <%if(menu == "gallery"){ %> class="active" <%}%> ><a href="mainGallery.jsp">
                            <span class="mif-database icon"></span>
                            <span class="title">Gallery</span>
                            <%	GalleryDB galleryDB = new GalleryDB();
                           	 String countGallery = galleryDB.CountGallery();
							%>
							 
                            <span class="counter"><%=countGallery%></span>
                        </a></li>
                        <li <%if(menu == "material"){ %> class="active" <%}%> ><a href="mainMaterial.jsp">
                            <span class="mif-cogs icon"></span>
                            <span class="title">Material</span>
                            <% MaterialDB materialDB = new MaterialDB();
							String countMaterial = materialDB.CountMaterial();
							%>
                            <span class="counter"><%=countMaterial%></span>
                        </a></li>

                    </ul>
                </div>
              
  </body>
</html>
