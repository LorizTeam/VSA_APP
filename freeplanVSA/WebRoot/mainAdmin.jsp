<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>VSA</title>
    
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
                    
					 <div class="cell auto-size padding20 bg-white">
					 </div>
						
		</div>
					</center>
				</div>
			</div>
		 <!-- /.page-content -->	
  </body>
</html>
