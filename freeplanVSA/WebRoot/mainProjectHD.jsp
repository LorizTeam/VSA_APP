<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.vsa.form.*" %>
<%@ page import="com.vsa.data.*" %>
<%@ page import="com.vsa.util.DBConnect" %> 
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
%>
<%  
	List projectHDList1 = null, customerList1 = null; String docNo = "", name = "";
	ProjectDB projectDB = new ProjectDB();
	if(session.getAttribute("name") != null){
	name = session.getAttribute("name").toString();
	docNo = projectDB.SelectDocno(name);
	}
	
	if (request.getAttribute("projectHDList") == null) {
	projectHDList1 = projectDB.GetProjectHDList("", "");
	}else{
	projectHDList1 = (List) request.getAttribute("projectHDList");
	} 
	
	if (request.getAttribute("customerList") == null) {
	CustomerDB customerDB = new CustomerDB();
	customerList1 = customerDB.GetCustomerList("", "");
	}else{
	customerList1 = (List) request.getAttribute("customerList");
	}
	
	String menu = "project";
	request.setAttribute("menu", menu);
%>	
<%
	String userName = null;
	if(session.getAttribute("userName") != null){
    userName = session.getAttribute("userName").toString();
    }
  	if (userName == null)
  	{
    	%><jsp:forward page="Login.jsp" /><%
  	}
%>
<html lang="en">
  <head>
    <meta charset"UTF-8">
     
    <title>Project</title>
    
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
            width:100%;
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
        width: 96%;
        margin: 0 auto;
    }
    .w{
    	display:block;
    	width:100%;
    	padding:0px!important;
    }
    
    </style>

        <script type="text/javascript">
 		function noBack(){
                window.history.forward()
            }
             
            noBack();
            window.onload = noBack;
            window.onpageshow = function(evt) { if (evt.persisted) noBack() }
            window.onunload = function() { void (0) }
      </script>   
       
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
        
        function getProject(tprojID, tprojName, tprojEmpID, tprojCusID, tprojCusName, tprojCreateDate, tprojType, tprojStatus, tprojAddr) {
				
				document.projectForm.projectID.value 			= tprojID;
				document.projectForm.projectName.value 			= tprojName;	
				document.projectForm.employeeID.value 			= tprojEmpID;
				document.projectForm.customerID.value 			= tprojCusID;
				document.projectForm.customerName.value 		= tprojCusName;
				document.projectForm.createDate.value 			= tprojCreateDate;	
				document.projectForm.projectType.value 			= tprojType;
				document.projectForm.projectStatus.value 		= tprojStatus;
				document.projectForm.projectAddress.value 		= tprojAddr;
	}
	function submitView(projectID) {        
        document.projectForm.action="/freeplanVSA/mainProjectDT.jsp?projectID="+projectID+" ";
        document.projectForm.submit();         
    }  
    function getCustomer(tcusID, tcusName) {
				 
				document.projectForm.customerID.value 			= tcusID;
				document.projectForm.customerName.value 		= tcusName;	
				 
	}
    </script>
	</head>
	<body class="bg-steel">
 	<%
      // Set standard HTTP/1.1 no-cache headers.
  /*    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");

     // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
     response.addHeader("Cache-Control", "post-check=0, pre-check=0");

     // Set standard HTTP/1.0 no-cache header.
     response.setHeader("Pragma", "no-cache");
    
     //prevents caching at the proxy server
     response.setDateHeader ("Expires", 0);  */
%>   
					<!-- /.menu top -->	
					<jsp:include page="/menu_top.jsp"></jsp:include>
                    <!-- /.menu top --> 
                    
        <!-- /.page-content -->	            
        <div class="">
        <div class="flex-grid " style="height: 100%;">
        
         <div class="row" style="height: 100%;">     
                   
                    <!-- /.menu left -->	
                    <jsp:include page="/menu_left.jsp"></jsp:include>
                    <!-- /.menu left -->
        
		<html:form action="/projectHD" styleClass="bg-white" style="width:100%;">
		
		<div class="row" style="padding-left: 2.5%;">
        <div class="input-control modern text">
		    <input type="text" id="projectID" name="projectID" size="5" maxlength="6" readonly="readonly" value="<%=docNo%>" style="height: 2em;"/>
		    <span class="label">รหัสโครงการ</span>
		
		</div> &nbsp;
		<div class="input-control modern text">
		    <input type="text" id="projectName" name="projectName" size="15" maxlength="35" style="height: 2em;"/>
		    <span class="label">ชื่อโครงการ</span>
		
		</div> &nbsp;
        <div class="input-control modern text">
		    <input type="text" id="employeeID" name="employeeID" size="8" maxlength="10" value="<%=name%>" style="height: 2em;"/>
		    <span class="label">รหัสพนักงาน</span>
		
		</div> &nbsp;
		<div class="input-control modern text">
		    <input type="text" id="customerName" name="customerName" size="10" maxlength="50" style="height: 2em;"/>
		    <span class="label">ชื่อลูกค้า</span>
		 
		</div> &nbsp;
		<button type="button" class="button large-button rounded" style="margin-top: 1em;" onclick="showDialog('#dialog')">Get</button> &nbsp;
        <input type="hidden" id="customerID" name="customerID" />
        </div>
        <div class="row " style="padding-left: 2.5%;" >
        <div class="input-control modern text" id="createDate" >
		    <input type="text" id="createDate" name="createDate" size="8" maxlength="10" style="height: 2em;"/>
		    <span class="label">วันที่เริ่มโครงการ</span>
	
		</div> &nbsp;

		
        <label style="font-size: 105%; font-weight: bold; margin-top: 1.7em;"> ชนิดโครงการ</label>  &nbsp;

        <div class="input-control select" style="margin-top: 0.7em;">
		<select id="projectStatus" name="projectStatus" class="input-control text small-input" > 
        	 <option value="01">บ้านเดี่ยว </option>
        	 <option value="02">ทาวน์เฮ้าส์ </option>
        	 <option value="03">อาคารพาณิชย์ </option>
        </select>
        </div>&nbsp;
        <label style="font-size: 105%; font-weight: bold; margin-top: 1.7em;"> สถานะโครงการ</label>  &nbsp;
        <div class="input-control select" style="margin-top: 0.7em;">
		<select id="projectStatus" name="projectStatus" class="input-control text small-input"> 
        	 <option value="01">Active</option>
        	 <option value="02">Non Active</option>
        </select>
        </div>&nbsp;
		
		
        <label style="font-size: 105%; font-weight: bold; margin-top: 1.7em;"> ที่อยู่โครงการ</label>  &nbsp;
        <div class="input-control textarea" id="projectAddress" name="projectAddress">
	        <textarea id="projectAddress" name="projectAddress"></textarea>
	    </div>
        </div>
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;">
        <input class="button mini-button" type="submit" id="add" name="add" value="เพิ่ม" />
        <input class="button mini-button" type="submit" id="update" name="update" value="แก้ไข"/>
        <input class="button mini-button" type="submit" id="delete" name="delete" value="ลบ"/> 
        </div>
        	 
                	<!-----------------------------table---------------------------------->
					<div class="row" style="width: 99.9%;">
								<table class="display" cellspacing="0" width="100%" id="project" style="font-size: 80%;">
									<thead>
									<tr>
										<th><center>ลำดับ</center></th>
										<th><center>รหัส ชื่อ (โครงการ)</center></th>
										<th><center>รหัสพนักงาน</center></th>
										<th><center>ชื่อลูกค้า</center></th>
										<th><center>วันที่เริ่มโครงการ</center></th>
										<th><center>ชนิดโครงการ</center></th>
										<th><center>สถานะโครงการ</center></th>
										<th><center>ที่อยู่โครงการ</center></th>
									</tr>
									</thead>
									<tbody>
									<%	if (projectHDList1 != null) {
									List projectHDList = projectHDList1;
									int x = 0;
									for (Iterator iter = projectHDList.iterator(); iter.hasNext();) {
							  			x++;
							  			ProjectForm proj = (ProjectForm) iter.next();
									%>
                					<tr>
                						<td align="center"><input type="radio" id="view" name="view" value="view" 
                						onclick="submitView('<%=proj.getProjectID()%>');" /> <%=x%></td>
                						<td align="center"><a href="javascript:getProject('<%=proj.getProjectID()%>','<%=proj.getProjectName()%>',
                						'<%=proj.getEmployeeID()%>','<%=proj.getCustomerID()%>','<%=proj.getCustomerName()%>',
                						'<%=proj.getCreateDate()%>','<%=proj.getProjectType()%>','<%=proj.getProjectStatus()%>','<%=proj.getProjectAddress()%>');">
                						<%=proj.getProjectID()%> <%=proj.getProjectName()%></a></td>
                						<td align="center"><%=proj.getEmployeeID()%></td>
                						<td align="center"><%=proj.getCustomerName()%></td>
                						<td align="center"><%=proj.getCreateDate()%></td>
                						<%if(proj.getProjectType().equals("01")){ %>
                							<td align="center">บ้านเดียว</td>
                						<%}else if(proj.getProjectType().equals("02")) {%>
                							<td align="center">ทาวน์เฮ้าส์</td>
                						<%}else if(proj.getProjectType().equals("03")) {%>
                							<td align="center">อาคารพาณิชย์</td>
                						<%} %>
                						<%if(proj.getProjectStatus().equals("01")){ %>
                							<td align="center">Active</td>
                						<%}else if(proj.getProjectStatus().equals("02")) {%>
                							<td align="center">Non Active</td>
                						<%}%>
                						<td align="center"><%=proj.getProjectAddress()%></td>
                					</tr>
                					<% 	}
                						} else {
                					 %>
                					<tr><td align="center" colspan="9">No Data Found</td></tr>
                					
									<%	} %>
                					</tbody>
								</table>	
                		</div>
                		<!-----------------------------dialog---------------------------------->
                				<div data-role="dialog" id="dialog" data-close-button="true" 
                				data-overlay="true" data-overlay-color="ob-dark" data-width="47%" align="center">
							    <h1>List Customer</h1>
							    <p>
							    <div>
								<table class="display" cellspacing="0" width="522px" id="customer" style="font-size: 110%;">
									<thead>
									<tr>
										<th><center>ลำดับ</center></th>
										<th><center>ชื่อ นามสกุล</center></th>
									</tr>
									</thead>
									<tbody >
									<%	if (customerList1 != null) {
									List customerList = customerList1;
									int x = 0;
									for (Iterator iter = customerList.iterator(); iter.hasNext();) {
							  			x++;
							  			CustomerForm cust = (CustomerForm) iter.next();
									%>
                					<tr >
                						<td align="center" width="291px"><%=x%></td>
                						<td align="center" width="291px"><a href="javascript:getCustomer('<%=cust.getCustomerID()%>','<%=cust.getCustomerName()%>',
                						'<%=cust.getCustomerSurName()%>');" onclick="dialogClose('#dialog')">
                						<%=cust.getCustomerName()%> <%=cust.getCustomerSurName()%></a></td>
                					</tr>
                					<% 	}
                						} else {
                					 %>
                					<tr><td align="center" colspan="2">No Data Found</td></tr>
                					
									<%	} %>
                					</tbody>
								</table>
								</div>
							    </p>
								</div>
								<!-----------------------------dialog----------------------------------> 			
                		</html:form>
                		<!-----------------------------table---------------------------------->		
	 					
	 					</div>
					
				</div>
			</div>
		 <!-- /.page-content -->	
 	<!-- DataTables JavaScript -->
	<script src="metro-ui/js/jquery-2.1.4.min.js"></script>
   <script src="js/jquery.dataTables.min.js"></script>
   
   <!-- DataTables JavaScript -->
  	<!--Loading Dialog-->
	<script src="metro-ui/build/js/metro.js"></script>
	<script src="metro-ui/js/widgets/dialog.js"></script>
    <!--Loading Dialog-->
	<script>
	function showDialog(id){
    	var dialog = $(id).data('dialog');
    	dialog.open();
     }
     function dialogClose(id){
     	var dialog = $(id).data('dialog');
    	dialog.close();
     }
	
    $(document).ready(function() {
    	$.extend( $.fn.dataTable.defaults, {
		    "searching": true,
		    "ordering": false
		} );
        $('#project').DataTable({
        	 "scrollX":true,
        	 "scrollY":190,
               "language": {
            "lengthMenu": "Display _MENU_ records per page",
            "zeroRecords": "Nothing found - sorry",
            "info": "Showing page _PAGE_ of _PAGES_",
            "infoEmpty": "No records available",
            "infoFiltered": "(filtered from _MAX_ total records)"
        },
        "lengthMenu": [[5, 10, 25, 50, 100,-1], [5, 10, 25, 50, 100, "All"]]
        
        });
    });
    
    $(document).ready(function() {
    	$.extend( $.fn.dataTable.defaults, {
		    "searching": true,
		    "ordering": false
		} );
        $('#customer').DataTable({
        	 "scrollX":true,
        	 "scrollY":380,
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
		    $( "#createDate" ).datepicker({ format: "dd/mm/yyyy"
		    });
	});
    
    </script>
      
  </body>
</html>
