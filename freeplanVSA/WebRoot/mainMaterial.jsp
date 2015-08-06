<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.vsa.form.MaterialForm" %>
<%@ page import="com.vsa.data.MaterialDB" %>
<%@ page import="com.vsa.util.DBConnect" %>
<%@ page import="java.sql.*" %>
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
%>
<% 	List materialList1 = null;

	if (request.getAttribute("materialList") == null) {
	MaterialDB materialDB = new MaterialDB();
	materialList1 = materialDB.GetMaterialList("","");
	}else{
	materialList1 = (List) request.getAttribute("materialList");
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
        
        function getCustomer(tmatID, tmatName, tAmount, tUnit) {
				
				document.materialForm.materialCode.value 			= tmatID;
				document.materialForm.materialName.value 		= tmatName;	
				document.materialForm.amount.value 			= tAmount;
				document.materialForm.unit.value 		= tUnit;
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
        
		<html:form action="/material" styleClass="bg-white" >
		
		<div class="row" style="padding-left: 2.5%; margin-top: 1%;">
		<input type="hidden" id="materialCode" name="materialCode" />
		
        <label style="font-size: 160%; font-weight: bold;"> ชื่อ วัสดุ</label>  &nbsp;
        <input type="text" id="materialName" name="materialName" size="25" maxlength="50"/>&nbsp;
        <label style="font-size: 160%; font-weight: bold;"> ราคา</label>  &nbsp;
		<input type="text" id="amount" name="amount" size="15" maxlength="15"/>&nbsp;
		<label style="font-size: 160%; font-weight: bold;"> หน่วย</label>  &nbsp;
        <input type="text" id="unit" name="unit" size="8" maxlength="10"/>
        </div>
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;">
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
                						<td align="center"><a href="javascript:getCustomer('<%=mat.getMaterialCode()%>','<%=mat.getMaterialName()%>',
                						'<%=mat.getAmount()%>','<%=mat.getUnit()%>');">
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
