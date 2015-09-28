<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<!--
Au<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
	<head>
		<title>VSA GROUP FREE PLAN :: HOME</title>
		<link href="home/css/bootstrap.css" rel="stylesheet" type="text/css"
			media="all">
		<link href="home/css/bootstrap-theme.min.css" rel="stylesheet"
			type="text/css" media="all">
		<link href="home/css/style.css" rel="stylesheet" type="text/css"
			media="all" />
		<link rel="stylesheet" href="home/css/chocolat.css" type="text/css"
			media="screen" />
		<link href="home/css/uikit-accordion/progress.min.css" rel="stylesheet"
			type="text/css">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="application/x-javascript">
addEventListener("load", function() {
	setTimeout(hideURLbar, 0);
}, false);
function hideURLbar() {
	window.scrollTo(0, 1);
}</script>
		<script src="home/js/jquery-1.11.1.min.js">
</script>

		<script src="home/js/uikit.min.js">
</script>

		<link rel="stylesheet" href="home/css/flexslider.css" type="text/css"
			media="screen" />

	</head>
	<body class="bg-c">
<%@include file="home/topnav.jsp" %>
	<div id="contact" class="contact">
	 <div class="container">
	 		<h3 class="text-center">ติดต่อสอบถาม/แจ้งปัญหาการใช้งาน</h3>
		 <div class="touch-top thumbnail">
		  
			 <div class="col-md-12 touch-left">
			
				<html:form action="/notificationLogin">
					<input type="text" id="messageHD" name="messageHD" required placeholder="ระบุปัญหา"/>
					<textarea id="messageDT" name="messageDT" required placeholder="รายละเอียดของปัญหา"></textarea>
					<input type="submit" value="SUBMIT">				
				</html:form>	
			 </div>
			
				<div class="clearfix"></div>
		  </div>
	 </div>
	 </div>




</body>
</html>		