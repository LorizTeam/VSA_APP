<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.vsa.form.CustomerForm" %>
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
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

					<!-- /.menu top -->	
					<jsp:include page="/menu_top.jsp"></jsp:include>
                    <!-- /.menu top --> 
                    
        <!-- /.page-content -->	            
        <div class="page-content">
        <div class="flex-grid no-responsive-future" style="height: 100%;">
         <div class="row" style="height: 100%">     
                   
                    <!-- /.menu left -->	
                    <jsp:include page="/menu_left.jsp"></jsp:include>
                    <!-- /.menu left -->
		<html:form action="/customer">		 
                	<!-----------------------------table---------------------------------->
								<hr>
								<div class="cell auto-size padding20 bg-white">
							 
                    			<div class="row">
                    			<div class="col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 table-responsive">
								<table class="table striped hovered bordered cell-hovered" id="dataTables-customer">
									<thead>
									<tr>
										<th><center>ลำดับ</center></th>
										<th><center>ชื่อ นามสกุล</center></th>
										<th><center>อีเมล์</center></th>
										<th><center>เบอร์โทรศัพท์</center></th>
									</tr>
									</thead>
									<tbody>
                					<%	if (request.getAttribute("customerList") != null) {
									List customerList = (List)request.getAttribute("customerList");
									int x = 0;
									for (Iterator iter = customerList.iterator(); iter.hasNext();) {
							  			x++;
							  			CustomerForm cust = (CustomerForm) iter.next();
					
									%>
                					<tr>
                						<td align="center"><%=x%></td>
                						<td align="center"><a href="javascript:getSchedule('<%=cust.getCustomerID()%>','<%=cust.getCustomerName()%>',
                						'<%=cust.getCustomerSurName()%>','<%=cust.getCustomerTel()%>',
                						'<%=cust.getCustomerEmail()%>');"><%=cust.getCustomerName()%> <%=cust.getCustomerSurName()%></a>
                						</td>
                						<td align="center"><%=cust.getCustomerEmail()%></td>
                						<td align="center"><%=cust.getCustomerTel()%></td>
                					</tr>
                					<% 	}
                						} else {
                					 %>
                					<tr><td align="center" colspan="7">No Data Found</td></tr>
                					
									<%	} %>
                				</tbody>
								</table>
								</div>				
                				</div>
                				
                				</div>
                		</html:form>
                		<!-----------------------------table---------------------------------->		
	 					
	 					</div>
					</center>
				</div>
			</div>
		 <!-- /.page-content -->	
 
<!-- DataTables JavaScript -->
 	<!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.js"></script>
 <!-- DataTables JavaScript -->
	<script>
    $(document).ready(function() {
        $('#dataTables-customer').DataTable({
                responsive: true
        });
    });
    
    </script>
    		
  </body>
</html>
