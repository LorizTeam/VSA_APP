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
<% 	List matList = null, galleryHDList = null;
	int count = 0; String grp[] = null;  String grpName = "", custIDCus = "";
	List list = new ArrayList();
	
	if(session.getAttribute("custIDCus") != null){
	custIDCus = session.getAttribute("custIDCus").toString();
	}
	
	Cust_ProjectDB cust_projectDB = new Cust_ProjectDB();
	galleryHDList = cust_projectDB.GetGalleryList(custIDCus);
	
	count = cust_projectDB.GetGrp(custIDCus);
	grp = cust_projectDB.GetGrpList(count, custIDCus);
	
	for(int f=0; f<count; f++){
	
		matList = cust_projectDB.GetProjectList(grp[f], custIDCus);
		
		list.add(matList); 
	} 
	
	List projectHistoryList1 = null;
	if (request.getAttribute("projectHistoryList") == null) {
	projectHistoryList1 = cust_projectDB.GetProjectHistoryListLimit(custIDCus);
	}else{
	projectHistoryList1 = (List) request.getAttribute("projectHistoryList");
	} 
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

		<link href="home/css/style.css" rel="stylesheet" type="text/css"
			media="all" />
		<link rel="stylesheet" href="css/chocolat.css" type="text/css"
			media="screen" />
		<link href="home/css/uikit-accordion/accordion.min.css" rel="stylesheet"
			type="text/css">
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
			<h3 class="text-center">บันทึกค่าใช้จ่าย</h3>
		</div>
		<section class="container touch-top" >
		<article class="row ">
		<div class="col-md-4">
			<img alt="บ้านเดี่ยว 2 ชั้น" src="images/1-1.jpg"
				class="img-responsive ">
		</div>
		<div class="col-md-8  thumbnail">
			<!-- Detail project -->

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
				<div class="col-md-4">
					<h4>
						ประเภท
					</h4>
					<h4>
						<small> <%=galleryName%></small>
					</h4>
				</div>
				<div class="col-md-4">
					<h4>
						ราคาก่อสร้าง โดยประมาณ
					</h4>
					<h4>
						<small> <%=galleryAmount%> บาท</small>
					</h4>
				</div>
				<div class="col-md-4">
					<h4>
						เวลาก่อสร้างโดยประมาณ
					</h4>
					<h4>
						<small> <%=galleryWork%> เดือน</small>
					</h4>
				</div>
			</blockquote>
			<%} %>
			<!-- Accorion -->
			<blockquote class="row ">
				<h3>
					บันทึกค่าใช้จ่าย
				</h3>
			</blockquote>
			<html:form action="/custMain" >
			<div class="uk-accordion" data-uk-accordion="{showfirst:false}">
			
				<%  for(int a=0; a<count; a++){
				    List materialList = (List)list.get(a);
				    grpName = cust_projectDB.GetGrpName(grp[a]);
				%>
				 
				<!-- 1 Accordion -->
				<h3 class="uk-accordion-title thumbnail">
					หลังคา
					<% if(grpName.equals("A")){%>หลังคา<%} if(grpName.equals("B")){%>ตัวบ้าน<%} if(grpName.equals("C")){%>ฐานบ้าน<%} %>
					<i class="close glyphicon glyphicon-align-justify"></i>
				</h3>
				<div class="uk-accordion-content ">
					<div class="row ">
						<div class="col-xs-3 col-sm-3 col-md-3">
							<h4>
								วัสดุ
							</h4>
						</div>
						<div class="col-xs-3 col-sm-3 col-md-3">
							<h4>
								ต้นทุน
							</h4>
						</div>
						<div class="col-xs-3 col-sm-3 col-md-3">
							<h4>
								ใช้ไปแล้ว
							</h4>
						</div>
						<div class="col-xs-3 col-sm-3 col-md-3 text-center">
							<h4>
								เพิ่ม
							</h4>
						</div>
						<div class="col-xs-3 col-sm-3 col-md-1"></div>
					</div>
					<!-- วัสดุในการสร้าง -->		
					<hr />
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
					
					<div class="row">
						<div class="col-xs-3 col-sm-3 col-md-3">
							<%=custp.getMaterialName()%> <input type="hidden" id="projectID" name="projectID" value="<%=custp.getProjectID()%>" />
						</div>
						<div class="col-xs-3 col-sm-3 col-md-3">
							<%=custp.getAmountTotal()%><input type="hidden" id="structure" name="structure" value="<%=custp.getStructure()%>" /><input type="hidden" id="materialCode" name="materialCode" value="<%=custp.getMaterialCode()%>" />
						</div>
						<div class="col-xs-3 col-sm-3 col-md-3">
							<%=custp.getAmountTotalCust()%><input type="hidden" id="calCost" name="calCost" value="<%=custp.getAmountTotalCust()%>" />
						</div>
						<div class="col-xs-3 col-sm-3 col-md-3"> 
							<input type="text" id="amountTotalCust" name="amountTotalCust"  size="10" class="form-control" />
						</div>												
					</div>
					<%} j++; calAmotxt = Float.toString((Float.parseFloat(calCustAmotxt)*100)/Float.parseFloat(calAmotxt)); %>
					
					<!-- วัสดุในการสร้าง -->
					<!-- วัสดุในการสร้าง -->		
					<hr />
				
					<div class="row">
					<hr/>
						<div class="col-xs-3 col-sm-3 col-md-3 col-md-offset-9 col-sm-offset-9 ">
								<button type="submit" class="btn btn-success form-control" id="update" name="update">
									<i class="glyphicon glyphicon-floppy-disk"></i> บันทึก
								</button>
						</div>
					</div>
					
					<div class="row">
					
					<h4>
						<small>ความคืบหน้าของ<% if(grpName.equals("A")){%>หลังคา<%} if(grpName.equals("B")){%>ตัวบ้าน<%} if(grpName.equals("C")){%>ฐานบ้าน<%} %></small> <div class="uk-progress">
							<div class="uk-progress-bar " style="width: <%=calAmotxt%>%;">
								<%=calAmotxt%>%
							</div>
						</div>
					</h4>
					</div>
				</div>
				<!-- 1 Accordion -->
				<% } %>	
				
			</div>
			</html:form>
			<!-- /Accorion -->

		</div>
		<!-- History project -->
		<h3>
			รายการซื้อวัสดุล่าสุด
			<small><a href="cus_history.jsp"> - ดูทั้งหมด</a> </small>
		</h3>
		<hr />
		<div class="row ">

			<div class="col-md-12">
				<table class="table table-bordered table-hover table-responsive bg-table" >
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
		</article>
		</section>



		<script src="home/js/accordion.js">
</script>

	</body>
</html>
