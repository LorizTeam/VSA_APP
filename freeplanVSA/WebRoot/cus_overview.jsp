<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.vsa.form.CustomerProjectForm" %>
<%@ page import="com.vsa.data.Cust_ProjectDB" %> 
<%	
	String custID = "", grpName = "";
	if(session.getAttribute("custID") != null){
	custID = session.getAttribute("custID").toString();
	}
	Cust_ProjectDB cust_projectDB = new Cust_ProjectDB();
	List projectHistoryList1 = null;
	if (request.getAttribute("projectHistoryList") == null) {
	projectHistoryList1 = cust_projectDB.GetProjectHistoryList(custID);
	}else{
	projectHistoryList1 = (List) request.getAttribute("projectHistoryList");
	} 
	
	int count = 0; String grp[] = null;
	count = cust_projectDB.GetGrp(custID);
	grp = cust_projectDB.GetGrpList(count, custID);
	
	List galleryHDList = null;
	galleryHDList = cust_projectDB.GetGalleryList(custID);
%> 
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
		<link rel="home/stylesheet" href="css/chocolat.css" type="text/css"
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
		<%@include file="topnav.jsp" %>
		<div id="contact" class="contact">
			<h3 class="text-center">ภาพรวม</h3>
		</div>	
		<section class="container touch-top">
		<article class="row ">
		<div class="col-md-8 thumbnail">

			<!-- Project overview-->

			
			<h4  class="text-right"><small>อัพเดทล่าสุด <span class="glyphicon glyphicon-time"></span> 20-11-2015</small></h4>
			
			<hr />
			<% for (Iterator iter = galleryHDList.iterator(); iter.hasNext();) {
				CustomerProjectForm custp = (CustomerProjectForm) iter.next();
				String galleryName = custp.getGalleryName();
				String galleryAmount = custp.getGalleryAmount();
				String galleryWork = custp.getGalleryWork();
			%>
			<h4>
				<small>ประเภท</small> <%=galleryName%>
				<small>ราคาก่อสร้าง โดยประมาณ </small> <%=galleryAmount%> บาท
				<small>เวลาก่อสร้างโดยประมาณ</small> <%=galleryWork%> เดือน
			</h4>
			<%} %>
			<hr />
			<blockquote>
				<h4>
					<small>ระยะเวลาที่สร้าง</small> 120 วัน
				</h4>
			</blockquote>
			<blockquote>
				<h4>
					<small>ยอดเงินที่ใช้ไป </small> 402,211 บาท
				</h4>
			</blockquote>
				
				<%  for(int a=0; a<count; a++){
				    grpName = cust_projectDB.GetGrpName(grp[a]);
				    String amount = cust_projectDB.GetProgress(grp[a],custID);
				    String amountCust = cust_projectDB.GetProgressCust(grp[a],custID);
				    String progress = Float.toString((Float.parseFloat(amountCust)*100)/Float.parseFloat(amount));
				%>
				<h4>
					<small>ความคืบหน้าของ<% if(grpName.equals("A")){%>หลังคา<%} if(grpName.equals("B")){%>ตัวบ้าน<%} if(grpName.equals("C")){%>ฐานบ้าน<%} %></small> <div class="uk-progress">
						<div class="uk-progress-bar " style="width: <%=progress%>%;">
							<%=progress%>%
						</div>
					</div>
				</h4>
				<%} %>
				<%
					String amountSum = cust_projectDB.GetProgressSum(custID);
				    String amountCustSum = cust_projectDB.GetProgressCustSum(custID);
				    String progressSum = Float.toString((Float.parseFloat(amountCustSum)*100)/Float.parseFloat(amountSum));
				%> 
				<h4>
					<small>ความคืบหน้าของโครงการรวม</small>
					<div class="uk-progress">
						<div class="uk-progress-bar" style="width: <%=progressSum%>%;">
							<%=progressSum%>%
						</div>
					</div>
				</h4>

		</div>
		<div class="col-md-4 ">
			<div class="thumbnail">
			<!-- Project info-->
			<img alt="บ้านเดี่ยว 2 ชั้น" src="images/1-1.jpg"
				class="img-responsive ">
			<hr />
			<h3>
				รายละเอียด
			</h3>
			<% for (Iterator iter = galleryHDList.iterator(); iter.hasNext();) {
				CustomerProjectForm custp = (CustomerProjectForm) iter.next();
				String galleryName = custp.getGalleryName();
				String galleryAmount = custp.getGalleryAmount();
				String galleryWork = custp.getGalleryWork();
			%>
			<blockquote class="row">
				<div class="col-md-12">
					<h4>
						ประเภท
						<small> <%=galleryName%></small>
					</h4>
				</div>
				<div class="col-md-12">
					<h4>
						ราคาก่อสร้าง โดยประมาณ
						<small> <%=galleryAmount%> บาท</small>
					</h4>
				</div>
				<div class="col-md-12">
					<h4>
						เวลาก่อสร้างโดยประมาณ
						<small> <%=galleryWork%> เดือน</small>
					</h4>
				</div>
			</blockquote>
			<%} %>
			</div>
		</div>
		</article>
		<!-- History project -->
		<h3>
			รายการซื้อวัสดุล่าสุด
			<small><a href="cus_history.jsp"> - ดูทั้งหมด</a>
			</small>
		</h3>
		<hr />
		<div class="row">

			<div class="col-md-12">
				<table class="table table-bordered table-hover bg-table">
					<tr>
						<th>
							ลำดับที่
						</th>
						<th>
							โครงสร้าง
						</th>
						<th>
							รายการที่ซื้อ
						</th>
						<th>
							จำนวนครั้งที่เพิ่ม
						</th>
						<th>
							ราคาเงินครั้งก่อน
						</th>
						<th>
							จำนวนเงินที่ใช้
						</th>
						<th>
							ยอดรวม
						</th>
						<th> 
							วันที่
						</th>

					</tr>
					<%	if (projectHistoryList1 != null) {
						List projectHistoryList = projectHistoryList1;
						int x = 0;
						for (Iterator iter = projectHistoryList.iterator(); iter.hasNext();) {
						x++; 
						CustomerProjectForm projHis = (CustomerProjectForm) iter.next();
					%>
					<tr>
						<td align="center"><%=x%></td>
						<td align="center"><% if(projHis.getStructure().equals("A")){%>หลังคา<%} if(projHis.getStructure().equals("B")){%>ตัวบ้าน<%} if(projHis.getStructure().equals("C")){%>ฐานบ้าน<%} %></td>
						<td align="center"><%=projHis.getMaterialName()%></td>
						<td align="center">ครั้งที่ <%=projHis.getQtyUse()%></td>
						<td align="center"><%=projHis.getAmount_old()%> บาท</td>
						<td align="center"><%=projHis.getAmount_new()%> บาท</td>
						<td align="center"><%=projHis.getAmountTotal()%> บาท</td>
						<td align="center"><%=projHis.getDateTime()%></td>
					</tr>
					<% 	}
                		} else {
                	%>
                		<tr><td align="center" colspan="8">No Data Found</td></tr>
                	<%	} %>
				</table>
			</div>
		</div>
		</section>



		<script src="home/js/accordion.js">
</script>

	</body>
</html>
