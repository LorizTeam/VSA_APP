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
	int count = 0; String grp[] = null;  String grpName = "", custID = "";
	List list = new ArrayList();
	
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
%>
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
			<link rel="stylesheet" href="css/jquery.dataTables.css" /> 
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
			<h3 class="text-center">ประวัติการบันทึกค่าใช้จ่าย</h3>
		</div>
		
		<table class="display" cellspacing="0"height="100%"   id="customer">
			<thead>
				<tr>
					<th>ลำดับที่</th>
					<th>โครงสร้าง</th>
					<th>รายการที่ซื้อ</th>
					<th>ครั้งที่</th>
					<th>ยอดเงินครั้งก่อน</th>
					<th>ยอดเงินที่ใช้</th>
					<th>ยอดใช้งานรวม</th>
					<th>วันที่</th>				
				</tr>
			</thead>
			<tbody>
				<%	if (projectHistoryList1 != null) {
						List projectHistoryList = projectHistoryList1;
						int x = 0;
						for (Iterator iter = projectHistoryList.iterator(); iter.hasNext();) {
						x++; 
						CustomerProjectForm projHis = (CustomerProjectForm) iter.next();
					%>
				<tr>
					<td><%=x%></td>
					<td><% if(projHis.getStructure().equals("A")){%>หลังคา<%} if(projHis.getStructure().equals("B")){%>ตัวบ้าน<%} if(projHis.getStructure().equals("C")){%>ฐานบ้าน<%} %></td>
					<td><%=projHis.getMaterialName()%></td>
					<td>ครั้งที่ <%=projHis.getQtyUse()%></td>
					<td><%=projHis.getAmount_old()%> บาท</td>
					<td><%=projHis.getAmount_new()%> บาท</td>
					<td><%=projHis.getAmountTotal()%> บาท</td>
					<td><%=projHis.getDateTime()%></td>
				</tr>
				
					<% 	}
                		} else {
                	%>
                		<tr><td align="center" colspan="8">No Data Found</td></tr>
                	<%	} %>
			</tbody>
		</table>
		
				
		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/jquery.dataTables.min.js"></script>
		<script>
		    $(document).ready(function() {
		    	$.extend( $.fn.dataTable.defaults, {
				    "searching": true,
				    "ordering": false
				} );
		        $('#customer').DataTable({
		        	 "scrollX":true,		        	 
		               "language": {
		            "lengthMenu": "แสดงผล _MENU_ รายการ ต่อหนึ่งหน้า",
		            "zeroRecords": "ขออภัย! ไม่พบผลลัพธ์ตามที่ค้นหา",
		            "info": "แสดงผลจากหน้า _PAGE_ ถึง หน้า _PAGES_",
		            "infoEmpty": "ไม่มีผลลัพธ์ที่ตรงกัน ",
		            "infoFiltered": "(จากทั้งหมด _MAX_ ที่บันทึกอยู่)",
		           	"search":"ค้นหา :"
		        },
		        "lengthMenu": [[5, 10, 50, 100,-1], [5, 10, 50, 100, "All"]]
		        
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