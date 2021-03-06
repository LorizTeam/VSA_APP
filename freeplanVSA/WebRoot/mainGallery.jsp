<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.vsa.form.GalleryForm" %>
<%@ page import="com.vsa.data.GalleryDB" %>
<%@ page import="com.vsa.util.DBConnect" %>
<%@ page import="java.sql.*" %>
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
%>
<% 	List galleryList1 = null;

	if (request.getAttribute("gallerytList") == null) {
	GalleryDB galleryDB = new GalleryDB();
	galleryList1 = galleryDB.GetGallery();
	}else{
	galleryList1 = (List) request.getAttribute("gallerytList");
	} 
	
	String menu = "gallery";
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
            width:100%;
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
        width: 90%;
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
        
        function getGallery(tgaCode, tgaName, tgadescription, tgaAmount, tgaTimeUse) {
				document.galleryForm.galleryCode.value 	= tgaCode; 
				document.galleryForm.galleryName.value 	= tgaName; 
			//	document.galleryForm.chkUP.value 	= tgaCode;
				document.galleryForm.description.value 	= tgadescription; 
				document.galleryForm.amount.value 	= tgaAmount; 
				document.galleryForm.timeUse.value 	= tgaTimeUse;
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
        
		<html:form action="/gallery" styleClass="bg-white" method="post" enctype="multipart/form-data" style="width:100%;">
		
		<div class="row" style="padding-left: 2.5%; margin-top: 1%;">
		<div class="input-control modern text" style="width:19%;">
		    <input type="hidden" id="galleryCode" name="galleryCode" /> 
		    <input type="text" id="galleryName" name="galleryName" size="25" maxlength="50" style="height: 2em;" required/>
		    <span class="label"> ชื่อ Gallery</span>
		</div>&nbsp;
		<div class="input-control modern text" style="width:19%;">
		    <input type="text" id="description" name="description" size="50" maxlength="100" style="height: 2em;" required/>
		    <span class="label">รายละเอียด</span>
		</div>&nbsp;
		</div>
		
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;">
        <div class="input-control modern text" style="width:30%;">
		    <input type="text" id="amount" name="amount" size="10" maxlength="16" style="height: 2em;" required/>
		    <span class="label">จำนวนเงินที่ใช้ก่อสร้าง โดยประมาณ(บาท)</span>
		   
		</div>&nbsp;
		<div class="input-control modern text" style="width:30%;">
		    <input type="text" id="timeUse" name="timeUse" size="2" maxlength="4" style="height: 2em;" required/>
		    <span class="label">เวลาในการก่อสร้าง โดยประมาณ(เดือน)</span>
		   
		</div>&nbsp;
		<label style="font-size: 160%; font-weight: normal;">Upload&nbsp;Image&nbsp;:</label>&nbsp;
			<div class="input-control file" data-role="input">
				<input type="file" id="file" name="file" >
				<button class="button"><span class="mif-folder"></span></button>
			</div>
        </div>
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;">
        		
        </div>
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;">
        <input class="button mini-button" type="submit" id="add" name="add" value="เพิ่ม"/>
        <input class="button mini-button" type="submit" id="update" name="update" value="แก้ไข"/>
        <input class="button mini-button" type="submit" id="delete" name="delete" value="ลบ"/> 
        </div>
        	 
                	<!-----------------------------table---------------------------------->
					<div class="row">
								<table class="display" cellspacing="0" width="100%" id="gallery" style="font-size: 110%;">
									<thead>
									<tr>
										<th><center>ลำดับ</center></th>
										<th><center>ชื่อ Gallery</center></th> 
										<th><center>รายละเอียด</center></th>
										<th><center>จำนวนเงินที่ใช้ก่อสร้าง โดยประมาณ</center></th>
										<th><center>เวลาในการก่อสร้าง โดยประมาณ</center></th>
									</tr>
									</thead>
									<tbody>
									<%	if (galleryList1 != null) {
									List gallerytList = galleryList1;
									int x = 0;
									for (Iterator iter = gallerytList.iterator(); iter.hasNext();) {
							  			x++;
							  			GalleryForm gary = (GalleryForm) iter.next();
									%>
                					<tr>
                						<td align="center"><%=x%></td>
                						<td align="center"><a href="javascript:getGallery('<%=gary.getGalleryCode()%>','<%=gary.getGalleryName()%>',
                						'<%=gary.getDescription()%>','<%=gary.getAmount()%>','<%=gary.getTimeUse()%>');">
                						<%=gary.getGalleryName()%></a></td> 
                						<td align="center"><%=gary.getDescription()%></td>
                						<td align="center"><%=gary.getAmount()%> บาท</td>
                						<td align="center"><%=gary.getTimeUse()%> เดือน</td>
                					</tr>
                					<% 	}
                						} else {
                					 %>
                					<tr><td align="center" colspan="2">No Data Found</td></tr>
                					
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
        $('#gallery').DataTable({
        	 "scrollX":true,
        	 "scrollY":200,
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
