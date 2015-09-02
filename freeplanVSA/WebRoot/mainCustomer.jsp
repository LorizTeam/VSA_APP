<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.vsa.form.CustomerForm" %>
<%@ page import="com.vsa.data.CustomerDB" %>
<%@ page import="com.vsa.util.DBConnect" %>
<%@ page import="java.sql.*" %>
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
%>
<% 	List customerList1 = null;
	 
	if (request.getAttribute("customerList") == null) {
	CustomerDB customerDB = new CustomerDB();
	customerList1 = customerDB.GetCustomerList("", "");
	}else{
	customerList1 = (List) request.getAttribute("customerList");
	}
	 
	CustomerDB customerDB = new CustomerDB();
	List provinceList = customerDB.GetProvinceList(); 
	 
	String menu = "customer";
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
		<link rel="stylesheet" href="css/jquery.dataTables.css" /> 
	<!--Loading JS-->
	 <!-- date picker -->
    <link rel="stylesheet" href="css/jquery-ui.css"/>
		
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
        width: 92%;
        margin-top: 0;
        margin-left: 2%;
        margin-right: auto;
        margin-buttom: auto;
    }
    .w{
    	display:block;
    	width:100%;
    	padding:0px!important;
    }
    </style>

    <script type="text/javascript">
    
function showAmphur(value, textbox){
 
xmlHttp=GetXmlHttpObject()
var url="dropDownAmphur.jsp";
url=url+"?name="+value;
xmlHttp.onreadystatechange=stateChanged 
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
} 
function stateChanged() { 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
      
    var showdata = xmlHttp.responseText;
    document.getElementById("customerDistrict").innerHTML= showdata;
 //   alert(showdata);
    } 
}
function GetXmlHttpObject(){
var xmlHttp=null;
try {
  xmlHttp=new XMLHttpRequest();
 }
catch (e) {
 try  {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}
function showDistrict(value, textbox){
 
xmlHttp=GetXmlHttpObject1()
var url="dropDownDistrict.jsp";
url=url+"?id="+value;
xmlHttp.onreadystatechange=stateChanged1 
xmlHttp.open("GET",url,true)
xmlHttp.send(null)
} 
function stateChanged1() { 
if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
      
    var showdata = xmlHttp.responseText;
    document.getElementById("customerSubDistrict").innerHTML= showdata;
 //   alert(showdata);
    } 
}
function GetXmlHttpObject1(){
var xmlHttp=null;
try {
  xmlHttp=new XMLHttpRequest();
 }
catch (e) {
 try  {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}
    
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
        
        function getCustomer(tcustID, tcustName, tcustSurName, tcustTel, tcustEmail, tcustDOB, tcustHouseNo, 
        						tcustVillageNo, tcustVillage, tcustLane, tcustSubDistrict, tcustSubDistrictName, tcustDistrict, tcustDistrictName, tcustProvince, tcustPostCode) {
				
				document.customerForm.customerID.value 			= tcustID;
				document.customerForm.customerName.value 		= tcustName;	
				document.customerForm.customerSurName.value 	= tcustSurName;
				document.customerForm.customerTel.value 		= tcustTel;
				document.customerForm.customerEmail.value 		= tcustEmail;
				document.customerForm.customerDOB.value 		= tcustDOB;
				document.customerForm.customerHouseNo.value 	= tcustHouseNo;
				document.customerForm.customerVillageNo.value 	= tcustVillageNo;
				document.customerForm.customerVillage.value 	= tcustVillage;
				document.customerForm.customerLane.value 		= tcustLane;
				document.getElementById("customerSubDistrict").innerHTML = "<option value="+tcustSubDistrict+">"+tcustSubDistrictName+"</option>"; 
				document.getElementById("customerDistrict").innerHTML= "<option value="+tcustDistrict+">"+tcustDistrictName+"</option>";
				document.customerForm.customerProvince.value 	= tcustProvince;
				document.customerForm.customerPostCode.value 	= tcustPostCode; 
	}
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
		<input type="hidden" id="customerID" name="customerID" />
		
		<div class="input-control modern text" style="width:12%;">
		    <input type="text" id="customerName" name="customerName" size="15" maxlength="50" style="height: 2em;"/>
		    <span class="label"> ชื่อ</span>
		    <span class="placeholder"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ชื่อ</span>
		</div> &nbsp;
		<div class="input-control modern text" style="width:15%;">
		    <input type="text" id="customerSurName" name="customerSurName" size="15" maxlength="50" style="height: 2em;"/>
		    <span class="label"> นามสกุล</span>
		    <span class="placeholder"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; นามสกุล</span>
		</div> &nbsp;
		<div class="input-control modern text" style="width:17%;">
		    <input type="text" id="customerTel" name="customerTel" size="8" maxlength="10" style="height: 2em;"/>
		    <span class="label"> เบอร์โทรศัพท์</span>
		    <span class="placeholder"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; เบอร์โทรศัพท์</span>
		</div> &nbsp;
		<div class="input-control modern text" style="width:17%;">
		    <input type="text" id="customerEmail" name="customerEmail" size="30" maxlength="50" style="height: 2em;"/>
		    <span class="label"> อีเมลล์</span>
		    <span class="placeholder"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; อีเมลล์</span>
		</div> &nbsp;
		<div class="input-control modern text" style="width:13%;">
		    <input type="text" id="customerDOB" name="customerDOB" size="9" maxlength="10" style="height: 2em;"/>
		    <span class="label"> วันเกิด</span> 
		    <span class="placeholder"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; วันเกิด</span>
		</div> &nbsp;
		<div class="input-control modern text" style="margin-right : 2%;">
		    <input type="text" id="customerHouseNo" name="customerHouseNo" size="5" maxlength="9" style="height: 2em;"/>
		    <span class="label"> บ้านเลขที่</span>
		    <span class="placeholder"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; บ้านเลขที่</span>
		</div> &nbsp;		
        </div>
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;" >
        <div class="input-control modern text" style="width:10%;">
		    <input type="text" id="customerVillageNo" name="customerVillageNo" size="15" maxlength="50" style="height: 2em;"/>
		    <span class="label"> ซอย</span> 
		    <span class="placeholder"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ซอย</span>
		</div> &nbsp;
		<div class="input-control modern text" style="width:10%;">
		    <input type="text" id="customerVillage" name="customerVillage" size="15" maxlength="50" style="height: 2em;"/>
		    <span class="label"> หมู่บ้าน</span> 
		    <span class="placeholder"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; หมู่บ้าน</span>
		</div> &nbsp;
		<div class="input-control modern text" style="width:10%;">
		    <input type="text" id="customerLane" name="customerLane" size="" maxlength="" style="height: 2em;"/>
		    <span class="label"> ถนน</span> 
		    <span class="placeholder"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ถนน</span>
		</div> &nbsp;
		<label style="font-size: 150%; font-weight: bold; margin-top: 1.9em; margin-left:2%;"> ตำบล</label>  &nbsp;
		<div class="input-control select" style="margin-top: 1.5em; width :10%;">
		<select id="customerSubDistrict" name="customerSubDistrict" class="input-control text small-input" style="width:100%""> 
        	 <option value="">-- ตำบล --</option>
        </select>
        </div>&nbsp;
		<label style="font-size: 150%; font-weight: bold; margin-top: 1.9em;"> อำเภอ</label>  &nbsp;
		<div class="input-control select" style="margin-top: 1.5em; width :10%;">
		<div>
		<select id="customerDistrict" name="customerDistrict" class="input-control text small-input" style="width:100%"  onclick="showDistrict(this.value, this);" onchange="showDistrict(this.value, this);"> 
        	 <option value="">-- อำเภอ --</option>
        </select>
        <span class="mif-earth fg-green"></span>
        </div>
        </div>&nbsp;
        <label style="font-size: 150%; font-weight: bold; margin-top: 1.9em;"> จังหวัด</label>  &nbsp;
		<div class="input-control select" style="margin-top: 1.5em; width :10%;">
		<select id="customerProvince" name="customerProvince" class="input-control text small-input" style="width:100%" onclick="showAmphur(this.value, this);" onchange="showAmphur(this.value, this);"> 
        	  <option value="">-- จังหวัด --</option>
        			<% for (Iterator iterItem = provinceList.iterator(); iterItem.hasNext();) {
	   					CustomerForm provinceInfo = (CustomerForm) iterItem.next();
	       			%>
        			<option value="<%=provinceInfo.getProvinceID()%>">
        				<%=provinceInfo.getProvinceName()%>
        			</option>
					<% 		} 
						  
					%>
        </select>
        </div>&nbsp;
        
        <div class="input-control modern text" style="width:15%; margin-left : 2%;">
		    <input type="text" id="customerPostCode" name="customerPostCode" size="5" maxlength="5" style="height: 2em;"/>
		    <span class="label"> รหัสไปรษณีย์</span> 
		    <span class="placeholder"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; รหัสไปรษณีย์</span>
		</div> &nbsp;
        </div>
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;">
        <input class="button mini-button" type="submit" id="add" name="add" value="เพิ่ม"/>
        <input class="button mini-button" type="submit" id="update" name="update" value="แก้ไข"/>
        <input class="button mini-button" type="submit" id="delete" name="delete" value="ลบ"/> 
        </div>
        	 
                	<!-----------------------------table---------------------------------->
					<div class="row ">
								<table class="display" cellspacing="0"  width="80%" id="customer" style="font-size: 100%; ">
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
                						<td align="center"><a href="javascript:getCustomer('<%=cust.getCustomerID()%>','<%=cust.getCustomerName()%>','<%=cust.getCustomerSurName()%>',
                						'<%=cust.getCustomerTel()%>','<%=cust.getCustomerEmail()%>','<%=cust.getCustomerDOB()%>','<%=cust.getCustomerHouseNo()%>',
                						'<%=cust.getCustomerVillageNo()%>','<%=cust.getCustomerVillage()%>','<%=cust.getCustomerLane()%>',
                						'<%=cust.getSubDistrictID()%>','<%=cust.getCustomerSubDistrict()%>',
                						'<%=cust.getDistrictID()%>','<%=cust.getCustomerDistrict()%>',
                						'<%=cust.getProvinceID()%>','<%=cust.getCustomerPostCode()%>');">
                						<%=cust.getCustomerName()%> <%=cust.getCustomerSurName()%></a></td>
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
    <!-- datet -->
	 <script src="js/jquery-ui.js"></script>
	<script>
    $(document).ready(function() {
    	$.extend( $.fn.dataTable.defaults, {
		    "searching": true,
		    "ordering": false
		} );
        $('#customer').DataTable({
        	 "scrollX":true,
        	 "scrollY":250,
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
    
    $(function() {
		    $( "#customerDOB" ).datepicker({dateFormat: 'dd/mm/yy',
		    yearRange: "1950:yyyy",changeMonth: true,changeYear: true
		    });
	});
  
    </script>
    		
  </body>
</html>
