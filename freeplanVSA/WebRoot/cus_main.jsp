<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.vsa.form.CustomerProjectForm" %>
<%@ page import="com.vsa.data.Cust_ProjectDB" %>
<%@ page import="com.vsa.util.DBConnect" %>
<%@ page import="java.sql.*" %>
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
%>
<% 	List matList = null;
	int count = 0; String grp[] = null;  String grpName = "";
	List list = new ArrayList();
	
	Cust_ProjectDB cust_projectDB = new Cust_ProjectDB();
	
	count = cust_projectDB.GetGrp("1");
	grp = cust_projectDB.GetGrpList(count, "1");
	
	for(int f=0; f<count; f++){
	
		matList = cust_projectDB.GetProjectList(grp[f], "1");
		
		list.add(matList); 
	}
	String update = (String)request.getAttribute("update");
	
%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>VSA FREE PLAN</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="bootstrap/css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="bootstrap/css/lines.css" rel='stylesheet' type='text/css' />
<link href="bootstrap/css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="bootstrap/js/jquery.min.js"></script>
<!----webfonts--->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!---//webfonts--->  
<!-- Nav CSS -->
<link href="bootstrap/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="bootstrap/js/metisMenu.min.js"></script>
<script src="bootstrap/js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="bootstrap/js/d3.v3.js"></script>
<script src="bootstrap/js/rickshaw.js"></script>
<script> 
$(document).ready(function(){
	$(window).scrollTo("#flip3");
    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
        $("#panel2").slideUp("slow");
        $("#panel3").slideUp("slow");
    });
    $("#flip2").click(function(){
        $("#panel").slideUp("slow");
        $("#panel2").slideToggle("slow");
        $("#panel3").slideUp("slow");
    });
    $("#flip3").click(function(){
        $("#panel").slideUp("slow");
        $("#panel2").slideUp("slow");
        $("#panel3").slideToggle("slow");
    });
	if ($("#up").val() == 'Update A') {
	$(window).scrollTo("#flip3");
        document.location.hash = "#flip3";
    }
});

</script>

</head>
<body>
<div id="wrapper">
<input type="hidden" id="up" value="Update A">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">VSA GROUP</a>
            </div>
            <!-- /.navbar-header -->
            <ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-comments-o"></i><span class="badge">4</span></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>Messages</strong>
							<div class="progress thin">
							  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
							    <span class="sr-only">40% Complete (success)</span>
							  </div>
							</div>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/1.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
								<span class="label label-info">NEW</span>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/2.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
								<span class="label label-info">NEW</span>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/3.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/4.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/5.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/pic1.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="dropdown-menu-footer text-center">
							<a href="#">View all messages</a>
						</li>	
	        		</ul>
	      		</li>
			    <li class="dropdown">
	        		<a href="#" class="dropdown-toggle avatar" data-toggle="dropdown"><img src="images/1.png"><span class="badge">9</span></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header text-center">
							<strong>Account</strong>
						</li>
						<li class="m_2"><a href="#"><i class="fa fa-bell-o"></i> Updates <span class="label label-info">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-envelope-o"></i> Messages <span class="label label-success">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-tasks"></i> Tasks <span class="label label-danger">42</span></a></li>
						<li><a href="#"><i class="fa fa-comments"></i> Comments <span class="label label-warning">42</span></a></li>
						<li class="dropdown-menu-header text-center">
							<strong>Settings</strong>
						</li>
						<li class="m_2"><a href="#"><i class="fa fa-user"></i> Profile</a></li>
						<li class="m_2"><a href="#"><i class="fa fa-wrench"></i> Settings</a></li>
						<li class="m_2"><a href="#"><i class="fa fa-usd"></i> Payments <span class="label label-default">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-file"></i> Projects <span class="label label-primary">42</span></a></li>
						<li class="divider"></li>
						<li class="m_2"><a href="#"><i class="fa fa-shield"></i> Lock Profile</a></li>
						<li class="m_2"><a href="#"><i class="fa fa-lock"></i> Logout</a></li>	
	        		</ul>
	      		</li>
			</ul>
			<form class="navbar-form navbar-right">
              <input type="text" class="form-control" value="Search..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search...';}">
            </form>
            
        </nav>
        <div id="">
        <div class="graphs">
     	<div class="col_3">
        	<div class="col-md-3 widget widget1">
                <div class="r3_counter_box">
                    <i class="pull-left fa fa-dollar dollar1 icon-rounded"></i>
                    <div class="stats">
                      <h5><strong>1,000,000</strong></h5>
                      <span>ราคารวม</span>
                    </div>
                </div>
        	</div>
        	<div class="col-md-3 widget widget1">
                <div class="r3_counter_box">
                    <i class="pull-left fa fa-dollar icon-rounded" style="background-color: orange;"></i>
                    <div class="stats">
                      <h5><strong>1,000,000</strong></h5>
                      <span>ยอดรวม</span>
                    </div>
                </div>
        	</div>
        	<div class="col-md-3 widget widget1">
        		<div class="r3_counter_box">
                    <i class="pull-left fa fa-users user2 icon-rounded"></i>
                    <div class="stats">
                      <h5><strong>750,152</strong></h5>
                      <span>ผู้เข้าชม</span>
                    </div>
                </div>
        	</div>
        	<div class="col-md-3 widget">
        		<div class="r3_counter_box">
                    <i class="pull-left fa fa-thumbs-up icon-rounded"></i>
                    <div class="stats">
                      <h5><strong>600,000</strong></h5>
                      <span>จำนวน  Like</span>
                    </div>
                </div>
        	 </div>
        	<div class="clearfix"> </div>
      </div>
      <div class="content_bottom">
     	<div class="col-md-3 span_3 widget1" style="width: 27%">
		   <div class="bs-example1">
		    <img class="img-responsive" src="images/1-1.jpg" />
		    <br />
		    <h3>Project ปัจจุบัน : บ้านเดี่ยว 3 ห้องนอน 2 ห้องน้ำ 2 ชั้น</h3>
		   </div>
	    </div>
	    <div class="col-md-4 span_3 widget1" style="width: 35%">
		   <div class="bs-example1">
		   	
		    <table class="table" style="margin-bottom:10%;">
		      <thead>
		        <tr>
		          <th>วัสดุ</th>
		          <th>ราคา/หน่วย</th>
		          <th>น้ำหนัก</th>
		          <th>หน่วย</th>
		          <th>ราคารวม</th>
		        </tr>
		      </thead>
		      <tbody>
		        <tr class="">
		          <th scope="row">ทราย</th>
		          <td>100</td>
		          <td>60</td>
		          <td>TON</td>
		          <td>600,000</td>
		        </tr>
		        <tr class="danger">
		          <th scope="row">ปูน</th>
		          <td>70</td>
		          <td>42</td>
		          <td>KG</td>
		          <td>300,000</td>
		        </tr>
		        <tr class="">
		          <th scope="row">เหล็ก</th>
		          <td>50</td>
		          <td>60</td>
		          <td>KG</td>
		          <td>300,000</td>
		        </tr>
		      </tbody>
		    </table>
		   </div>
	    </div>
	  </div>
    <div class="content_bottom">
     <div class="col-md-4 span_3" style="width: 35%">
		  <div class="bs-example1" data-example-id="contextual-table">
		    <table class="table">
		      <thead>
		        <tr>
		          <th>ราคา</th>
		          <th>น้ำหนัก</th>
		          <th>สถานที่ซื้อ</th>
		          <th>วันที่ซื้อ</th>
		        </tr>
		      </thead>
		      <tbody>
		        <tr class="">
		          <th scope="row"><input type="text" value="10,000" size="7"/></th>
		          <td><input type="text" value="10,000" size="7"/></td>
		          <td><input type="text" value="10,000" size="7"/></td>
		          <td><input type="text" value="10,000" size="7"/></td>
		        </tr>
		        <tr>
		          <th scope="row"><input type="text" value="10,000" size="7"/></th>
		          <td><input type="text" value="10,000" size="7"/></td>
		          <td><input type="text" value="10,000" size="7"/></td>
		          <td><input type="text" value="10,000" size="7"/></td>
		        </tr>
		        <tr class="">
		          <th scope="row"><input type="text" value="10,000" size="7"/></th>
		          <td><input type="text" value="10,000" size="7"/></td>
		          <td><input type="text" value="10,000" size="7"/></td>
		          <td><input type="text" value="10,000" size="7"/></td>
		        </tr>
		      </tbody>
		    </table>
		   </div>
	   </div>
		<div class="clearfix"> </div>
	    </div>
	    <html:form action="/custMain">
	    <%   
         for(int a=0; a<count; a++){
         List materialList = (List)list.get(a);
         grpName = cust_projectDB.GetGrpName(grp[a]);
         %>
	     <div class="content_bottom">
     		<div class="col-md-12 span_3">
     			<div class="panel panel-default">
     				<div class="row" style="padding-left: 2.5%; margin-top: 1%;">
       				 <input class="button mini-button" type="submit" id="update" name="update" value="Update <%=grpName%>" />
        			</div>
					<div class="panel-heading" style="background: #fff;">
						<h4 class="panel-title">
						<a <% if(grpName.equals("A")){%> id="flip" <%} %>
						<%if(grpName.equals("B")){%> id="flip2" <%} %> 
						<% if(grpName.equals("C")){%> id="flip3" <%} %>
						data-toggle="collapse" data-parent="#accordion" 
						<% if(grpName.equals("A")){%> href="#panel" <%} %>
						<% if(grpName.equals("B")){%> href="#panel2" <%} %> 
						<% if(grpName.equals("C")){%> href="#panel3" <%} %>
						style="color:#000;">
							<div class="container">
							<% if(grpName.equals("A")){%>หลังคา<%} if(grpName.equals("B")){%>ตัวบ้าน<%} if(grpName.equals("C")){%>ฐานบ้าน<%} %>
							<span class="pull-right" style="margin-right: -10%;"><i class="fa fa-plus"></i></span>
							</div>	
						</a>
						</h4>
					</div>
					<div <% if(grpName.equals("A")){%> id="panel" <%} %>
						<% if(grpName.equals("B")){%> id="panel2" <%} %> 
						<% if(grpName.equals("C")){%> id="panel3" <%} %> class="panel-collapse collapse in">
						<div class="panel-body">
							<div class="panel-body">
							<div class="table-responsive col-md-8 col-md-offset-4">
								<table class="table table-hover">
								 <thead>
									<tr>
										<th id=""><center>วัสดุ</center></th>
										<th id=""><center>ราคาต้นทุน</center></th>
										<th id=""><center>ราคารวม</center></th>
										<th id="">ราคา</th>
										<th id="">ราคาเทียบ</th>
									</tr>
									</thead>
									<tbody>
									<%	
				                		int x = 0, j=0; String[] calAmount = new String[count]; String calAmotxt = "0";
				                		String[] calAmountCust = new String[count]; String calCustAmotxt = "0"; 
										for (Iterator iter = materialList.iterator(); iter.hasNext();) {
										x++;
										CustomerProjectForm custp = (CustomerProjectForm) iter.next();
				                	 	String cal = custp.getAmountTotal(); String calCus = custp.getAmountTotalCust();
				                	 	cal = cal.replace(",", ""); calCus = calCus.replace(",", ""); 
				                	 //	String progress = Float.toString(Float.parseFloat(cal)-30000);
				                	 	String progress = Float.toString((Float.parseFloat(calCus)*100)/Float.parseFloat(cal));
				                	 	calAmount[j] = custp.getAmountTotal();  calAmountCust[j] = custp.getAmountTotalCust();
				                	 	calAmount[j] = calAmount[j].replace(",", ""); calAmountCust[j] = calAmountCust[j].replace(",", "");
				                	 	calAmotxt = Float.toString(Float.parseFloat(calAmount[j])+Float.parseFloat(calAmotxt));
				                	 	calCustAmotxt = Float.toString(Float.parseFloat(calAmountCust[j])+Float.parseFloat(calCustAmotxt));
				               
				                	%>
									<tr <%if(Float.parseFloat(calAmount[j])>Float.parseFloat(calAmountCust[j])) { %>
										class="success"
									<% } else { %>
										class="danger"
									<%} %>
									 >
										<td align="center"><%=custp.getMaterialName()%><input type="hidden" id="projectID" name="projectID" value="<%=custp.getProjectID()%>" /></td>
										<td align="center"><%=custp.getAmountTotal()%><input type="hidden" id="structure" name="structure" value="<%=custp.getStructure()%>" /><input type="hidden" id="materialCode" name="materialCode" value="<%=custp.getMaterialCode()%>" /></td>
										<td><%=custp.getAmountTotalCust()%><input type="hidden" id="calCost" name="calCost" value="<%=custp.getAmountTotalCust()%>" /> </td>
										<td><input type="text" id="amountTotalCust" name="amountTotalCust"  size="10"/></td>
										<td id="" width="50%"><div class="progress"><div class="progress-bar progress-bar-success" style="width: <%=progress%>%"><span class="sr-only"><%=progress%>% Complete (success)</span><label><%=progress%>%</label></div></div></td>
									</tr>
									 
									</tbody>
									<%} j++; calAmotxt = Float.toString((Float.parseFloat(calCustAmotxt)*100)/Float.parseFloat(calAmotxt)); %>
								</table>

							</div>

     			<br />
    					<div class="col-md-8 col-md-offset-4">
		                <div class="progress-bar progress-bar-danger" style="width: <%=calAmotxt%>%"><span class="sr-only"><%=calAmotxt%>% Complete (success)</span><label><%=calAmotxt%>%</label></div>
		                </div>
						</div>
						</div>
					</div>
					
                	 			
                	 
				</div>
     		</div>
     		<div class="clearfix"> </div>
     	</div>
     	<% } %>
     	 </html:form>   		
		<div class="copy">
            <p>Copyright &copy; 2015 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
	    </div>
		</div>
       </div>
      <!-- /#page-wrapper -->
   </div>
    <!-- /#wrapper -->
    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/js/bootstrap.js"></script>
    <script>


</script>
</body>
</html>
