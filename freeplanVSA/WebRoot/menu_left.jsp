<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.vsa.form.*" %>
<%@ page import="com.vsa.data.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 	List customerList1 = null, materialList1 = null, projectHDList1 = null; 
	int x = 0, f = 0, d = 0;

	if (request.getAttribute("customerList") == null) {
	CustomerDB customerDB = new CustomerDB();
	customerList1 = customerDB.GetCustomerList("", "");
	}
	if (request.getAttribute("materialList") == null) {
	MaterialDB materialDB = new MaterialDB();
	materialList1 = materialDB.GetMaterialList("","");
	}
	if (request.getAttribute("projectHDList") == null) {
	ProjectDB projectDB = new ProjectDB();
	projectHDList1 = projectDB.GetProjectHDList("", "");
	}
	String menu = "";
	if(request.getAttribute("menu") != ""){ 
		menu = (String)request.getAttribute("menu");
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset"UTF-8">
    
    <title>My JSP 'Customer.jsp' starting page</title>
    
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
		
		
		<!--Loading JS-->
		
		<script src="metro-ui/js/jquery-2.1.4.min.js"></script>
		<script src="metro-ui/js/jquery.dataTables.min.js"></script>
		<script src="metro-ui/build/js/metro.js"></script>
		
		<!--Use Custom Style-->
		<style>
        html, body {
            height: 100%;
        }
        .page-content {
            padding-top: 0;
            min-height: 100%;
            height: 100%;
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
	
		<!-----------------------------sidebar---------------------------------->

                <div class="cell size-x200" id="cell-sidebar" style="background-color: #71b1d1; height: 100%">
                    <ul class="sidebar" >
                        <li  <%if(menu == "project"){ %> class="active" <%}%> ><a href="mainProjectHD.jsp">
                            <span class="mif-apps icon"></span>
                            <span class="title">Project</span>
                            <%	if (projectHDList1 != null) {
									List projectHDList = projectHDList1;
									for (Iterator iter = projectHDList.iterator(); iter.hasNext();) {
							  			d++;
							  			ProjectForm proj = (ProjectForm) iter.next();
							%>
							<% }
                            } %>
                            <span class="counter"><%=d %></span>
                        </a></li>
                        <li <%if(menu == "importexcel"){ %> class="active" <%}%> ><a href="importExcel.jsp">
                            <span class="mif-vpn-publ icon"></span>
                            <span class="title">Excel Upload File</span>
                            <span class="counter">-</span>
                        </a></li>
                        <li <%if(menu == "customer"){ %> class="active" <%}%> ><a href="mainCustomer.jsp">
                            <span class="mif-drive-eta icon"></span>
                            <span class="title">Customer</span>
                            <%	if (customerList1 != null) {
									List customerList = customerList1;
									for (Iterator iter = customerList.iterator(); iter.hasNext();) {
							  			x++;
							  			CustomerForm cust = (CustomerForm) iter.next();
							%>
							<% }
                            } %>
                            <span class="counter"><%=x %></span>
                            
                        </a></li>
                        <li><a href="#">
                            <span class="mif-cloud icon"></span>
                            <span class="title">Department</span>
                            <span class="counter">0</span>
                        </a></li>
                        <li><a href="#">
                            <span class="mif-database icon"></span>
                            <span class="title">Employee</span>
                            <span class="counter">0</span>
                        </a></li>
                        <li <%if(menu == "material"){ %> class="active" <%}%> ><a href="mainMaterial.jsp">
                            <span class="mif-cogs icon"></span>
                            <span class="title">Material</span>
                            <%	if (materialList1 != null) {
									List materialList = materialList1;
									for (Iterator iter = materialList.iterator(); iter.hasNext();) {
							  			f++;
							  			MaterialForm mat = (MaterialForm) iter.next();
							%>
							<% }
                            } %>
                            <span class="counter"><%=f %></span>
                        </a></li>
                    </ul>
                </div>
              
  </body>
</html>
