<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.vsa.form.MaterialForm" %>
<%@ page import="com.vsa.data.MaterialDB" %>
<%@ page import="com.vsa.util.DBConnect" %>
<%@ page import="java.sql.*" %>
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
%>
<% 	
	String menu = "importexcel";
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
        
        function getMaterial(tmatID, tmatName, tAmount, tUnit) {
				
				document.materialForm.materialCode.value 			= tmatID;
				document.materialForm.materialName.value 		= tmatName;	
				document.materialForm.amount.value 			= tAmount;
				document.materialForm.unit.value 		= tUnit;
	}
	function returnVender(test, tVendCode, tVendName) {
		
		if (opener && !opener.closed){
			if (venderForm.formName.value == 'material') {
			 	window.opener.document.projectForm.materialCode.value = tVendCode;
			 	window.opener.document.projectForm.materialName.value = tVendName;
			} else alert('no form set');
		 	opener.focus();
		} 
		window.close();
		return;			
	}
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
    	<div class="example" data-text="Upload" style="margin : 15% 20% 25%;">		
    	<label style="font-size: 200%;">อัพโหลดไฟล์โครงการ</label>
    	<div style="margin: 9%;">	
		<html:form action="/importExcel" styleClass="bg-white frm-import" method="post" enctype="multipart/form-data" >
		
		<div class="row" style="padding-left: 2.5%; margin-top: 10%; width:100%;">
		
		</div>
		<div class="row">
			<div class="input-control file" data-role="input" style="width:50em;">
    		<input type="file" id="theFile" name="theFile">
    		<button class="button"><span class="mif-folder"></span></button>
			</div>
        </div>
        <div class="row" style=" margin-top: 1%;">
        <input class="button mini-button" type="submit" id="importExcel" name="importExcel" value="IMPORT EXCEL"/>
        </div>
        	 
        </html:form>
        </div>
        </div>	
	 	</div>
					
				</div>
			</div>
		 <!-- /.page-content -->	
    		
  </body>
</html>
