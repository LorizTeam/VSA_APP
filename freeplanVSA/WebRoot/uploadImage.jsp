<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ page import ="javax.servlet.http.HttpServletRequest.*"%>
<%@ page import ="javax.servlet.http.HttpServletResponse.*"%>
<%@ page import ="javax.servlet.http.HttpSession.*"%>
<%@ page import="com.vsa.form.*" %>
<%@ page import="com.vsa.data.*" %>
<% 
String path = request.getContextPath (); 
String basePath = request.getScheme () + ":/ /" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
%>
<% 	List imageList1 = null, galleryList1 = null;
	String alertMassage = "";
	if(request.getAttribute("uploadedFileName") != null){
		alertMassage = (String) request.getAttribute("uploadedFileName");
	}
	
	if (request.getAttribute("imageList") == null) {
	ImportImageDB importImageDB = new ImportImageDB();
	imageList1 = importImageDB.GetImageList("");
	}else{
	imageList1 = (List) request.getAttribute("imageList");
	} 
	
	if (request.getAttribute("gallerytList") == null) {
	GalleryDB galleryDB = new GalleryDB();
	galleryList1 = galleryDB.GetGallery();
	}else{
	galleryList1 = (List) request.getAttribute("gallerytList");
	} 
	
	String menu = "upload";
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
	<!--Use Custom Style-->
   <script src="metro-ui/build/js/metro.js"></script>
   <!-- DataTables JavaScript -->
   
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
        width: 95%;
        margin: 0 auto;
    }
    .w{
    	display:block;
    	width:100%;
    	padding:0px!important;
    }
    .frm-import{
    	width:100%;
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
    	function getGallery(tgaCode, tgaName) {
				document.uploadImageForm.galleryCode.value 	= tgaCode; 
				document.uploadImageForm.galleryName.value 	= tgaName; 
		}
		function getImage(tgaCode, tgaName, timage) {
				document.uploadImageForm.galleryCode.value 	= tgaCode; 
				document.uploadImageForm.galleryName.value 	= tgaName;
				document.uploadImageForm.imageName.value 	= timage; 
		}
    </script>
	</head>
<body class="bg-steels">
<!-- /.menu top -->	
					<jsp:include page="/menu_top.jsp"></jsp:include>
                    <!-- /.menu top --> 
        <!-- /.page-content -->	            
        <div class="page-content">
        <div class="flex-grid "  style="height: 100%;">
        
         <div class="row" style="height: 100%; width:100%;">     
    				<!-- /.menu left -->	
                    <jsp:include page="/menu_left.jsp"></jsp:include>
                    <!-- /.menu left -->
	
	<html:form action="/uploadImage" method="post" enctype="multipart/form-data">
	<div class="row" style="padding-left: 2.5%; margin-top: 2%; width:100%;">
		<label style="font-size: 160%; font-weight: bold;">Gallery&nbsp;Name</label>&nbsp;
		 <input type="hidden" id="galleryCode" name="galleryCode" />
        <input type="text" id="galleryName" name="galleryName" size="25" maxlength="50"/>&nbsp;
        <button type="button" class="button mini-button rounded" onclick="showDialog('#dialog')">Get</button> &nbsp;
		<select id="grStatus" name="grStatus" class="input-control text small-input"> 
        	 <option value="dt">รูปกลุ่ม</option>
        	 <option value="hd">รูปหลัก</option>
        </select>&nbsp;
		<input type="hidden" id="imageName" name="imageName" />
	</div>
	<br/>
	<div class="row" style="padding-left: 2.5%; width:100%;">
		<label style="font-size: 160%; font-weight: bold;">Image : 1</label>&nbsp;
		<div class="input-control file" data-role="input">
			<input type="file" id="file" name="file" >
			<button class="button"><span class="mif-folder"></span></button>
		</div>
		<label style="font-size: 160%; font-weight: bold;">Image : 2</label>&nbsp;
		<div class="input-control file" data-role="input">
			<input type="file" id="file1" name="file1" >
			<button class="button"><span class="mif-folder"></span></button>
		</div>
		<label style="font-size: 160%; font-weight: bold;">Image : 3</label>&nbsp;
		<div class="input-control file" data-role="input">
			<input type="file" id="file2" name="file2" >
			<button class="button"><span class="mif-folder"></span></button>
		</div>
		<label style="font-size: 160%; font-weight: bold;">Image : 4</label>&nbsp;
		<div class="input-control file" data-role="input">
			<input type="file" id="file3" name="file3" >
			<button class="button"><span class="mif-folder"></span></button>
		</div>
	</div>
		<div class="row">
			<label style="font-size: 160%; font-weight: bold;"><%=alertMassage%></label>  &nbsp;<br/>
        </div>
        <div class="row" style="padding-left: 2.5%; margin-top: 1%;">
        <input class="button mini-button" type="submit" id="upload" name="upload" value="upload image"/>
        </div>
        
        <!-----------------------------table---------------------------------->
					<div class="row">
								<table class="display" cellspacing="0" width="100%" id="image" style="font-size: 110%;">
									<thead>
									<tr>
										<th><center>ลำดับ</center></th>
										<th><center>ชื่อ รูปภาพ</center></th>
										<th><center>ชื่อ Gallery</center></th> 
										<th><center>สถานะรูปภาพ</center></th>
									</tr>
									</thead>
									<tbody>
									<%	if (imageList1 != null) {
									List imageList = imageList1;
									int x = 0;
									for (Iterator iter = imageList.iterator(); iter.hasNext();) {
							  			x++;
							  			UploadImageForm ui = (UploadImageForm) iter.next();
									%>
                					<tr>
                						<td align="center"><%=x%></td>
                						<td align="center"><a href="javascript:getImage('<%=ui.getGalleryCode()%>',
                						'<%=ui.getGalleryName()%>','<%=ui.getImageName()%>');">
                						<%=ui.getImageName()%></a></td> 
                						<td align="center"><%=ui.getGalleryName()%></td>
                						<%if(ui.getGrStatus().equals("hd")) {%>
                						<td align="center">รูปหลัก Gallery</td>
                						<%}else if(ui.getGrStatus().equals("dt")) {%>
                						<td align="center">รูปกลุ่ม Gallery</td>
                						<%} %>
                					</tr>
                					<% 	}
                						} else {
                					 %>
                					<tr><td align="center" colspan="3">No Data Found</td></tr>
                					
									<%	} %>
                					</tbody>
								</table>	
                		</div>
        <!-----------------------------table---------------------------------->      		
        
        <!-----------------------------dialog---------------------------------->
                				<div data-role="dialog" id="dialog" data-close-button="true" 
                				data-overlay="true" data-overlay-color="ob-dark" data-width="47%" align="center">
							    <h1>List Gallery</h1>
							    <p>
							    <div>
								<table class="display" cellspacing="0" width="522px" id="gallery" style="font-size: 110%;">
									<thead>
									<tr>
										<th><center>ลำดับ</center></th>
										<th><center>ชื่อ Gallery</center></th>
									</tr>
									</thead>
									<tbody >
									<%	if (galleryList1 != null) {
									List galleryList = galleryList1;
									int x = 0;
									for (Iterator iter = galleryList.iterator(); iter.hasNext();) {
							  			x++;
							  			GalleryForm gary = (GalleryForm) iter.next();
									%>
                					<tr>
                						<td align="center"><%=x%></td>
                						<td align="center"><a href="javascript:getGallery('<%=gary.getGalleryCode()%>','<%=gary.getGalleryName()%>');" onclick="dialogClose('#dialog')">
                						<%=gary.getGalleryName()%></a></td> 
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
        $('#image').DataTable({
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
        $('#gallery').DataTable({
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
    
  </script>
</body>
</html>