<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Modern an Admin Panel Category Flat Bootstarp Resposive Website Template | Register :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!----webfonts--->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!---//webfonts--->  
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
</head>
<body id="login">
  <div class="login-logo">
    <h1><a href="cus_index.jsp">Home Me</a></h1>
  </div>
  <h2 class="form-heading">Register</h2>
  
   
  <html:form action="/cusRegister" styleClass="form-signin app-cam">
      <p>Enter your personal details below</p>
      <input type="text" id="name" name="name" class="form-control1" placeholder="Name" autofocus="" required>
      <input type="text" id="surName" name="surName" class="form-control1" placeholder="Surname" autofocus=""required>
      <input type="text" maxlength="10" id="tel" name="tel" class="form-control1" placeholder="Telephone Number" autofocus=""> 
      <div class="radios">
        <label for="radio-01" class="label_radio">
            <input type="radio" id="sex" name="sex" value="m" checked> Male
        </label>
        <label for="radio-02" class="label_radio">
            <input type="radio" id="sex" name="sex" value="w"> Female
        </label>
	  </div>
	  <p> Enter your account details below</p>
      <input type="text" id="userName" name="userName" class="form-control1" placeholder="Username" autofocus=""required>
      <input type="password" id="passWord" name="passWord" class="form-control1" placeholder="Password"required>
      <input type="password" id="conFirmPassword" name="conFirmPassword" class="form-control1" placeholder="Re-type Password"required>
      <label class="checkbox-custom check-success">
          <input type="checkbox" value="agree this condition" id="checkbox1"> <label for="checkbox1">I agree to the Terms of Service and Privacy Policy</label>
      </label>
      <button class="btn btn-lg btn-success1 btn-block" type="submit">Submit</button>
      <div class="registration">
          Already Registered.
          <a class="" href="cus_login.jsp">
              Login
          </a>
      </div>
      </html:form>
       
   <div class="copy_layout login register">
      <p>Copyright &copy; 2015 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
   </div>
</body>
</html>
