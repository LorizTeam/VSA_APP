<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.vsa.form.CustomerForm" %>
<%@ page import="com.vsa.data.CustomerDB" %>
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
%>
<% 	List customerList1 = null;
	if (request.getAttribute("customerList") == null) {
	CustomerDB customerDB = new CustomerDB();
	customerList1 = customerDB.GetCustomerList("", "");
	}
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
		<link rel="stylesheet" href="css/jquery.dataTables.css" /> 
	<!--Loading JS-->
		
		<style>
        html, body {
            height: 100%;
            overflow: hidden;
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

					<!-- /.menu top -->	
					<jsp:include page="/menu_top.jsp"></jsp:include>
                    <!-- /.menu top --> 
                    
        <!-- /.page-content -->	            
        <div class="page-content">
        <div class="flex-grid " style="height: 100%;">
        
         <div class="row" style="height: 100%;">     
                   
                    <!-- /.menu left -->	
                    <jsp:include page="/menu_left.jsp"></jsp:include>
                    <!-- /.menu left -->
        
		<html:form action="/customer" styleClass="bg-white" >
		<div class="row" style="padding-left: 2.5%; margin-top: 1%;">
        <label style="font-size: 160%; font-weight: bold;"> ชื่อ</label>  &nbsp;
        <input type="text" id="customerName" name="customerName" size="15" maxlength="50"/>&nbsp;
        <label style="font-size: 160%; font-weight: bold;"> นามสกุล</label>  &nbsp;
		<input type="text" id="customerSurName" name="customerSurName" size="15" maxlength="50"/>&nbsp;
		<label style="font-size: 160%; font-weight: bold;"> เบอร์โทรศัพท์</label>  &nbsp;
        <input type="text" id="customerTel" name="customerTel" size="8" maxlength="10"/>&nbsp;
        <label style="font-size: 160%; font-weight: bold;"> อีเมลล์</label>  &nbsp;
        <input type="text" id="customerEmail" name="customerEmail" size="30" maxlength="50"/>&nbsp;
        <label style="font-size: 160%; font-weight: bold;"> วันเกิด</label>  &nbsp;
        <input type="text" id="customerDOB" name="customerDOB" size="9" maxlength="10"/>&nbsp;
        <label style="font-size: 160%; font-weight: bold;"> บ้านเลขที่</label>  &nbsp;
        <input type="text" id="customerHouseNo" name="customerHouseNo" size="5" maxlength="9"/>&nbsp;
        </div>
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;">
        <label style="font-size: 160%; font-weight: bold;"> ซอย</label>  &nbsp;
        <input type="text" id="customerVillageNo" name="customerVillageNo" size="15" maxlength="50"/>&nbsp;
        <label style="font-size: 160%; font-weight: bold;"> หมู่บ้าน</label>  &nbsp;
		<input type="text" id="customerVillage" name="customerVillage" size="15" maxlength="50"/>&nbsp;
		<label style="font-size: 160%; font-weight: bold;"> ถนน</label>  &nbsp;
        <input type="text" id="customerLane" name="customerLane" size="8" maxlength="10"/>&nbsp;
        <label style="font-size: 160%; font-weight: bold;"> ตำบล</label>  &nbsp;
        <select id="customerSubDistrict" name="customerSubDistrict">
        	<option value="">1</option>
        </select>&nbsp;
        <label style="font-size: 160%; font-weight: bold;"> อำเภอ</label>  &nbsp;
        <select id="customerDistrict" name="customerDistrict">
        	<option value="">1</option>
        </select>&nbsp;
        <label style="font-size: 160%; font-weight: bold;"> จังหวัด</label>  &nbsp;
        <select id="customerProvince" name="customerProvince">
        	<option value="">1</option>
        </select>&nbsp;
        <label style="font-size: 160%; font-weight: bold;"> รหัสไปรษณีย์</label>  &nbsp;
        <input type="text" id="customerPostCode" name="customerPostCode" size="5" maxlength="9"/>&nbsp;
        </div>
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;">
        <input class="button success block-shadow-success text-shadow" type="submit" id="" name="" value="เพิ่ม"/>
        </div>
        	 
                	<!-----------------------------table---------------------------------->
					<div class="row">
								<table class="display" cellspacing="0" width="100%" id="customer" style="font-size: 110%;">
									<thead>
									<tr>
										<th><center>ลำดับ</center></th>
										<th><center>ชื่อ นามสกุล</center></th>
										<th><center>เบอร์โทรศัพท์</center></th>
										<th><center>อีเมล์</center></th>
										<th><center>วันเกิด</center></th>
										<th><center>บ้านเลขที่</center></th>
										<th><center>ซอยที่</center></th>
										<th><center>หมู่บ้าน</center></th>
										<th><center>ถนน</center></th>
										<th><center>ตำบล</center></th>
										<th><center>อำเภอ</center></th>
										<th><center>จังหวัด</center></th>
										<th><center>รหัสไปษณีย์</center></th>
									</tr>
									</thead>
									<tbody>
									<%	if (customerList1 != null) {
									List customerList = customerList1;
									int x = 0;
									for (Iterator iter = customerList.iterator(); iter.hasNext();) {
							  			x++;
							  			CustomerForm cust = (CustomerForm) iter.next();
					
									%>
                					<tr>
                						<td align="center"><%=x%></td>
                						<td align="center"><%=cust.getCustomerName()%> <%=cust.getCustomerSurName()%></td>
                						<td align="center"><%=cust.getCustomerTel()%></td>
                						<td align="center"><%=cust.getCustomerEmail()%></td>
                						<td align="center"><%=cust.getCustomerDOB()%></td>
                						<td align="center"><%=cust.getCustomerHouseNo()%></td>
                						<td align="center"><%=cust.getCustomerVillageNo()%></td>
                						<td align="center"><%=cust.getCustomerVillage()%></td>
                						<td align="center"><%=cust.getCustomerLane()%></td>
                						<td align="center"><%=cust.getCustomerSubDistrict()%></td>
                						<td align="center"><%=cust.getCustomerDistrict()%></td>
                						<td align="center"><%=cust.getCustomerProvince()%></td>
                						<td align="center"><%=cust.getCustomerPostCode()%></td>
                					</tr>
                					<% 	}
                						} else {
                					 %>
                					<tr><td align="center" colspan="9">No Data Found</td></tr>
                					
									<%	} %>
                					</tbody>
								</table>	
                		</div>			
                		</html:form>
                		<!-----------------------------table---------------------------------->		
	 					
	 					</div>
					
				</div>
			</div>
		 <!-- /.page-content -->	
 	<!-- DataTables JavaScript -->
	<script src="js/jquery-1.11.1.min.js"></script>
   <script src="js/jquery.dataTables.min.js"></script>
   <!--Use Custom Style-->
   <script src="metro-ui/build/js/metro.js"></script>
   <!-- DataTables JavaScript -->
	<script>
    $(document).ready(function() {
    	$.extend( $.fn.dataTable.defaults, {
		    "searching": true,
		    "ordering": false
		} );
        $('#customer').DataTable({
        	 "scrollX":true,
        	 "scrollY":400,
               "language": {
            "lengthMenu": "Display _MENU_ records per page",
            "zeroRecords": "Nothing found - sorry",
            "info": "Showing page _PAGE_ of _PAGES_",
            "infoEmpty": "No records available",
            "infoFiltered": "(filtered from _MAX_ total records)"
        },
        "lengthMenu": [[10, 25, 50, 100,-1], [10, 25, 50, 100, "All"]]
        
        });
    });
    
    </script>
    		
  </body>
</html>
