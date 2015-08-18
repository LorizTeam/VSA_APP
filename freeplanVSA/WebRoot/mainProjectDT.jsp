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
<% 	List projectDTList1 = null, materialList1 = null;

	String projectID = "", projectName = "";
	if(request.getParameter("projectID") != null){ projectID = (String) request.getParameter("projectID");

	if (projectID.length() == 1) {
		projectID = "00000" + projectID; 
	} else if (projectID.length() == 2) {
		projectID = "0000" + projectID; 
	} else if (projectID.length() == 3) {
		projectID = "000" + projectID; 
	} else if (projectID.length() == 4) {
		projectID = "00" + projectID; 
	} else if (projectID.length() == 5) {
		projectID = "0" + projectID; 
	}
	}

	if (request.getAttribute("projectDTList") == null) {
	ProjectDB projectDB = new ProjectDB();
	projectDTList1 = projectDB.GetProjectDTList(projectID, "");
	}else{
	projectDTList1 = (List) request.getAttribute("projectDTList");
	} 
	
	if (request.getAttribute("materialList") == null) {
	MaterialDB materialDB = new MaterialDB();
	materialList1 = materialDB.GetMaterialList("","");
	}else{
	materialList1 = (List) request.getAttribute("materialList");
	} 
	
	String menu = "project";
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
        
        function getProjectDT(tprojID, tmatID, tStructure, tmatName, tWeight, tAmount, tAmountTotal, tUnit) {
				
				document.projectForm.projectID.value 			= tprojID;	
				document.projectForm.structure.value 			= tStructure;	
				document.projectForm.materialCode.value 		= tmatID;
				document.projectForm.materialName.value 		= tmatName;
				document.projectForm.weight.value 				= tWeight;
				document.projectForm.amount.value 				= tAmount;	
				document.projectForm.amountTotal.value 			= tAmountTotal;
				document.projectForm.unit.value 				= tUnit;
	}			
	function getMaterial(tmatID, tmatName, tAmount, tUnit) {
				 
				document.projectForm.materialCode.value 			= tmatID;
				document.projectForm.materialName.value 		= tmatName;	
				document.projectForm.amount.value 			= tAmount;
				document.projectForm.unit.value 		= tUnit;
				
				document.getElementById('weight').focus()
	}
	function cal(){
		document.projectForm.amountTotal.value = parseFloat(document.projectForm.amount.value)*parseFloat(document.projectForm.weight.value)
	}
	function add() {        
        document.projectForm.action="/freeplanVSA/projectDT.do ";
        document.projectForm.submit();         
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
        
		<html:form action="/projectDT" styleClass="bg-white" >
		
		<div class="row" style="padding-left: 2.5%; margin-top: 1%;">
		<label style="font-size: 160%; font-weight: bold;"> โครงสร้าง</label>  &nbsp;
		<select name="structure" id="structure">
			<option value="A">ฐานบ้าน</option>
			<option value="B">ตัวบ้าน</option>
			<option value="C">หลังคา</option>
		</select>&nbsp;
		<input type="hidden" id="projectID" name="projectID" value="<%=projectID%>" />
		<input type="hidden" id="materialCode" name="materialCode" />
		<label style="font-size: 160%; font-weight: bold;"> ชื่อวัสดุ</label>  &nbsp;
        <input type="text" id="materialName" name="materialName" size="10" maxlength="6" />&nbsp;
        <button type="button" class="button mini-button rounded" onclick="showDialog('#dialog')">Get</button> &nbsp;
        <label style="font-size: 160%; font-weight: bold;"> น้ำหนัก</label>  &nbsp;
		<input type="text" id="weight" name="weight" size="15" maxlength="35" onkeyup="cal()" />&nbsp;
		<label style="font-size: 160%; font-weight: bold;"> ราคา</label>  &nbsp;
        <input type="text" id="amount" name="amount" size="8" maxlength="10"/>&nbsp;
        <label style="font-size: 160%; font-weight: bold;"> ราคารวม</label>  &nbsp;
        <input type="text" id="amountTotal" name="amountTotal" size="10" maxlength="50" readonly="readonly" /> &nbsp;
        <label style="font-size: 160%; font-weight: bold;"> หน่วย</label>  &nbsp;
        <input type="text" id="unit" name="unit" size="8" maxlength="10"/>&nbsp;
        </div>
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;">
     <!--    <button type="button" class="button mini-button rounded" id="add" name="add" value="add" onclick="add()">เพิ่ม</button>  -->
        <input class="button mini-button" type="submit" id="add" name="add" value="เพิ่ม"/>
        <input class="button mini-button" type="submit" id="update" name="update" value="แก้ไข"/>
        <input class="button mini-button" type="submit" id="delete" name="delete" value="ลบ"/> 
        </div>
        	 
                	<!-----------------------------table---------------------------------->
					<div class="row">
								<table class="display" cellspacing="0" width="100%" id="customer" style="font-size: 110%;">
									<thead>
									<tr>
										<th><center>ลำดับ</center></th>
										<th><center>โครงสร้าง</center></th>
										<th><center>ชื่อ วัสดุ</center></th>
										<th><center>น้ำหนัก</center></th>
										<th><center>หน่วย</center></th>
										<th><center>ราคา</center></th>
										<th><center>ราคารวม</center></th>
									</tr>
									</thead>
									<tbody>
									<%	if (projectDTList1 != null) {
									List projectDTList = projectDTList1;
									int x = 0;
									for (Iterator iter = projectDTList.iterator(); iter.hasNext();) {
							  			x++;
							  			ProjectForm proj = (ProjectForm) iter.next();
									%>
                					<tr>
                						<td align="center"><%=x%></td>
                						<%if(proj.getStructure().equals("A")){  %>
                						<td align="center">ฐานบ้าน</td>
                						<%}else if(proj.getStructure().equals("B")){ %>
                						<td align="center">ตัวบ้าน</td>
                						<%}else if(proj.getStructure().equals("C")){ %>
                						<td align="center">หลังคา</td>
                						<%} %>
                						<td align="center"><a href="javascript:getProjectDT('<%=proj.getProjectID()%>','<%=proj.getMaterialCode()%>','<%=proj.getStructure()%>',
                						'<%=proj.getMaterialName()%>','<%=proj.getWeight()%>','<%=proj.getAmount()%>','<%=proj.getAmountTotal()%>','<%=proj.getUnit()%>');">
                						<%=proj.getMaterialName()%></a></td>
                						<td align="center"><%=proj.getWeight()%></td>
                						<td align="center"><%=proj.getUnit()%></td>
                						<td align="center"><%=proj.getAmount()%></td>
                						<td align="center"><%=proj.getAmountTotal()%></td>
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
                				data-overlay="true" data-overlay-color="ob-dark" data-width="50%" data-type="danger">
							    <h1>Simple dialog</h1>
							    <p>
							    <div>
								<table class="display" cellspacing="0" width="647px" id="material" style="font-size: 110%;">
									<thead>
									<tr>
										<th><center>ลำดับ</center></th>
										<th><center>ชื่อ วัสดุ</center></th>
										<th><center>ราคา</center></th>
										<th><center>หน่วย</center></th>
									</tr>
									</thead>
									<tbody>
									<%	if (materialList1 != null) {
									List materialList = materialList1;
									int x = 0;
									for (Iterator iter = materialList.iterator(); iter.hasNext();) {
							  			x++;
							  			MaterialForm mat = (MaterialForm) iter.next();
									%>
                					<tr>
                						<td align="center"><%=x%></td>
                						<td align="center"><a href="javascript:getMaterial('<%=mat.getMaterialCode()%>','<%=mat.getMaterialName()%>',
                						'<%=mat.getAmount()%>','<%=mat.getUnit()%>');" onclick="dialogClose('#dialog')" >
                						<%=mat.getMaterialName()%></a></td>
                						<td align="center"><%=mat.getAmount()%></td>
                						<td align="center"><%=mat.getUnit()%></td>
                					</tr>
                					<% 	}
                						} else {
                					 %>
                					<tr><td align="center" colspan="9">No Data Found</td></tr>
                					
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
    $(document).ready(function() {
    	$.extend( $.fn.dataTable.defaults, {
		    "searching": true,
		    "ordering": false
		} );
        $('#material').DataTable({
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
    </script>
    		
  </body>
</html>
