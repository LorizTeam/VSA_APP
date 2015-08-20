<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
%>
<% 	
	String alertMassage = "";
	if(request.getAttribute("uploadedFileName") != null){
		alertMassage = (String) request.getAttribute("uploadedFileName");
	}
	
	String menu = "upload";
	request.setAttribute("menu", menu);
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
	<!--Use Custom Style-->
   <script src="metro-ui/build/js/metro.js"></script>
   <!-- DataTables JavaScript -->
		<style>
        html, body {
            height: 100%;
            overflow: hidden;
            width:100%;
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
        width: 95%;
        margin: 0 auto;
    }
    .w{
    	display:block;
    	width:100%;
    	padding:0px!important;
    }
    .frm-import{
    	width:100%;
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
<body class="bg-steels">
<!-- /.menu top -->	
					<jsp:include page="/menu_top.jsp"></jsp:include>
                    <!-- /.menu top --> 
        <!-- /.page-content -->	            
        <div class="page-content">
        <div class="flex-grid "  style="height: 100%;">
        
         <div class="row" style="height: 100%; width:100%;">     
    				<!-- /.menu left -->	
                    <jsp:include page="/menu_left.jsp"></jsp:include>
                    <!-- /.menu left -->
	
	<html:form action="/uploadImage" method="post" enctype="multipart/form-data">
	<div class="row" style="padding-left: 2.5%; margin-top: 10%; width:100%;">
		<label style="font-size: 160%; font-weight: bold;"><%=alertMassage%></label>  &nbsp;<br/>
		<label style="font-size: 160%; font-weight: bold;">Upload Image</label>  &nbsp;
		</div>
		<div class="row">
			<div class="input-control file" data-role="input">
		<input type="file" id="file" name="file" >
		<button class="button"><span class="mif-folder"></span></button>
			</div>
        </div>
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;">
        <input class="button mini-button" type="submit" id="upload" name="upload" value="upload image"/>
        </div>
        	 
        </html:form>
	 	</div>
					
				</div>
			</div>
		 <!-- /.page-content -->
</body>
</html>