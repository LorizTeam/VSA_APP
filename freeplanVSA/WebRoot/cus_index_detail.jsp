<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ page import="com.vsa.form.GalleryForm" %>
<%@ page import="com.vsa.data.GalleryDB" %>
<%@ page import="com.vsa.form.UploadImageForm" %>
<%@ page import="com.vsa.data.ImportImageDB" %>
<%@ page import="com.vsa.util.DBConnect" %>
<%@ page import="java.sql.*" %>

<!--Service-->

<link rel="stylesheet" href="css/fotorama.css"/>
<script src="css/fotorama.js"></script>
<script src="js/uikit.min.js"></script>
<script src="js/modal.min.js"></script>
<div id="service" class="service">
	 <div class="container">
		 <h3>ทำไมต้องของแบบบ้านที่ Home-Me?</h3>	
		 <div class="service-grids">
		 <div class="icon-grids">
			 <div class="col-md-6 futr-grid futr1">
				 <div class="icon-pic">
						<div class="icon text-center">
						 <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
						 </div>
				  </div>
				 <div class="icon-info">
						 <h4><a href="#">การขอแบบบ้าน ง่าย</a></h4>							
						 <p>ขั้นตอนการขอแบบบ้านง่ายมาก ใครก็สามารถขอได้ แค่ไม่กี่ขั้นก็ท่านก็สามารถได้รับแบบบ้านไปใช้สร้างบ้านของท่าน ที่สำคัญคือ "ฟรี"</p>
				 </div>
				 <div class="clearfix"></div>
			 </div>
			 <div class="col-md-6 futr-grid">
				  <div class="icon-pic">
							<div class="icon text-center">
							<span class="glyphicon glyphicon-thumbs-up glyphicon-briefcase" aria-hidden="true"></span>
						 </div>
				  </div>
				  <div class="icon-info">
						<h4><a href="#">ไม่มีค่าใช้จ่ายเพิ่มเติมหลังจากการขอแบบบ้าน</a></h4>						 
						<p>เราแจกแบบบ้าน ให้ท่านฟรี 100% ไม่มีค่าใช้จ่ายภายหลังเพื่อจะขอแบบบ้าน </p>
				  </div>
				  <div class="clearfix"></div>
			 </div>
			 <div class="clearfix"></div>
		 </div>
		 <div class="icon-grids grids2">
			 <div class="col-md-6 futr-grid futr1">
				 <div class="icon-pic">
						<div class="icon text-center">
						 <span class="glyphicon glyphicon-picture" aria-hidden="true"></span>
						 </div>
				  </div>
				 <div class="icon-info">
						 <h4><a href="#">เป็นแบบบ้านที่ใช้ได้จริงได้มาตราฐาน</a></h4>							
						 <p>แบบบ้านที่ท่านเลือก ทางเราจะมีทีมงาน เขียนแบบให้ท่านโดยอ้างอิง ที่ดินของท่าน จึงมั่นใจได้ว่า นำไปใช้ได้จริง</p>
				 </div>
				 <div class="clearfix"></div>
			 </div>
			 <div class="col-md-6 futr-grid">
				  <div class="icon-pic">
							<div class="icon text-center">
							 <span class="glyphicon glyphicon-user glyphicon-dashboard" aria-hidden="true"></span>
						 </div>
				  </div>
				  <div class="icon-info">
						<h4><a href="#">มีระบบควบคุมต้นทุนที่ใช้งานง่ายให้</a></h4>						 
						<p>ด้วยระบบควบคุมต้นทุน ของเรา ลูกค้าจะสามารถใช้งบประมาณที่มีอยู่ สร้างบ้านได้คุ้มค่าที่สุด อีกทั้งยังควบคุมต้นทุนในการสร้างให้อยู่ภายในขอบเขตที่กำหนดไว้ สามารถตรวจสอบได้</p>
				  </div>
				  <div class="clearfix"></div>
			 </div>
			 <div class="clearfix"></div>
		 </div>
		 </div>
	 </div>
</div>
<!--about-->
<div id="about" class="about">	 
	 <div class="about-left"></div>
	 <div class="about-right">
		<h3>เกี่ยวกับเรา</h3>
		<h4>Vivamus ac mi ut tortor elementum venenatis.</h4>
		<p>Mauris vestibulum pulvinar urna id ultricies. Etiam volutpat interdum mi in aliquet. Pellentesque vel tincidunt sapien.
		 Suspendisse potenti. Nam sed scelerisque est. Vestibulum non leo ligula. Donec aliquet viverra semper. Donec sed est ac sem suscipit vehicula.
		 Mauris nec nunc enim. Etiam aliquet risus et nunc rhoncus facilisis. Maecenas nec blandit ex. Nam nec dolor in nisl elementum malesuada. 
		 Fusce vitae eleifend magna. Curabitur tincidunt tincidunt vulputate.Etiam mollis nibh risus, a faucibus arcu ultricies eu. Morbi 
		 consectetur, metus vel efficitur luctus, nisi nulla vestibulum arcu, at rhoncus ligula ligula non nisl. Cras porttitor vestibulum nulla.</p>		
	 </div>
	 <div class="clearfix"></div>
</div>
<!--gallery -->
		<script src="home/js/jquery.chocolat.js"></script>		
		<!--light-box-files -->
		<script type="text/javascript">
		$(function() {
			$('.moments-bottom a').Chocolat();
		});
		</script> 
<!--gallery js-->
<div id="gallery" class="gallery">
	 <div class="container">
		 <h3>แกลอรี่ <small>แบบบ้านฟรี</small></h3>
         <div class="gallery-info">
         
         <% List galleryList = null;
         	GalleryDB galleryDB = new GalleryDB();
            galleryList = galleryDB.GetGalleryImage();
         	int x = 0;
			for (Iterator iter = galleryList.iterator(); iter.hasNext();) {
			x++;
			GalleryForm galry = (GalleryForm) iter.next();
			String galleryID = galry.getGalleryCode();
         	String galleryName = galry.getGalleryName();
          %>
         		<!--gallery-->	
         		<a href="#<%=galleryID%>"data-uk-modal >	
				<figure  class="col-sm-6 col-md-4  uk-overlay uk-overlay-hover" style="margin-bottom:30px;">
					
					<% List imageHDList = null;
			         	ImportImageDB importImageDB = new ImportImageDB();
			            imageHDList = importImageDB.GetImageHDList(galleryID);
			         	int y = 0;
						for (Iterator iter1 = imageHDList.iterator(); iter1.hasNext();) {
						y++;
						UploadImageForm img = (UploadImageForm) iter1.next();
						String imageHD = img.getPathfile(); 
			          	%>
				       		<img src="<%=imageHD%>" class="img-responsive" style="height:300px;overflow:hidden;width:100%;" alt="">
				       	<% } %>
						
							
					
					 <div class="uk-overlay-panel uk-overlay-background uk-overlay-icon"></div>			
				</figure >	
				</a>
				<!-- This is the modal -->
				<div id="<%=galleryID%>" class="uk-modal">
					<div class="uk-modal-dialog">
				 	<a class="uk-modal-close uk-close"></a>
				 	<div class="fotorama" data-allowfullscreen="true"data-loop="true"data-ratio="16/9"data-nav="false">
					<% 	String path = request.getContextPath (); 
						String basePath = request.getScheme () + "://" + request.getServerName () + ":" + request.getServerPort () + path + "/"; 
					
						List imageList = null;
			         	 
			            imageList = importImageDB.GetImageDTList(galleryID);
			         	int z = 0;
						for (Iterator iter2 = imageList.iterator(); iter2.hasNext();) {
						z++;
						UploadImageForm img = (UploadImageForm) iter2.next();
						String image = img.getPathfile();
						String pathImage = basePath+image;
			          	%>
				       		<img src="<%=pathImage%>"  > 
				       	<% } %>	
				       </div>
				       <hr/>
				       <h4>รายละเอียด</h4><br/>
				       <p><%=galleryName%></p>			      
				       <hr/>				
				       <a class="btn btn-info" href="cus_request_plan.jsp">แจ้งขอแบบบ้าน</a>				     
				       <a class="uk-modal-close btn btn-danger" href="#" >ปิด</a>
				       
				    </div>
				    	
				</div> 
				
				<!--gallery-->	
			<% } %>	
				<div class="clearfix"> </div>
			</div>
	 </div>
</div>
<!---->
<div id="blog" class="blog">
	 <div class="container">
		 <h3>ช่วยเหลือ</h3>
		 <div class="blog-grids">
			 <div class="col-md-6 blog-grid">
				 <a href="#"><img src="home/images/b2.jpg" class="img-responsive" alt=""/></a> 
				 <h4><a href="#">วิธีการการขอแบบบ้านฟรี</a></h4>
					<span>Mar 12 | 2015</span>
				 <p>- สมัครสมาชิกกับเว็บของเรา หรือ<a href="cus_register.jsp">คลิ๊กที่นี่</a> เพื่อสมัครสมาชิก</p>
				 <p>- จากแบบบ้านทั้งหมดที่เรามีให้เลือกแบบบ้านที่ถูกใจ แล้วคลิ๊กขอแบบบ้าน</p>
				 <p>- นำเอกสารที่แจ้ง ส่งอีเมลมาที่ <a href="mailto:FreePlan@Home-me.co.th">FreePlan@Home-me.co.th</a> แล้วรอห้เจ้าหน้าที่ตรวจสอบเอกสาร</p>
				 <p>- รอรับแบบบ้านฟรี "ไม่มีค่าใช้จ่ายเพิ่มเติม"</p>			 
			 </div>
			 <div class="col-md-6 blog-grid">
				 <a href="#"><img src="home/images/b1.jpg" class="img-responsive" alt=""/> </a> 
				 <h4><a href="#">วิธีใช้งานระบบ Home-Me Cost Control</a></h4>
					<span>Mar 12 | 2015</span>
				 <p>- วิธีเข้าใช้งานระบบ <a href="#">คลิ๊ก<i class="glyphicon glyphicon-chevron-right"></i></a></p>
				 <p>- วิธีเพิ่มค่าใช้จ่าย เมื่อซื้อวัสดุ <a href="#">คลิ๊ก<i class="glyphicon glyphicon-chevron-right"></i></a></p>
				 <p>- วิธีใช้งานภาพรวมการสร้าง <a href="#">คลิ๊ก<i class="glyphicon glyphicon-chevron-right"></i></a></p>
				 <p>- วิธีเช็คประวัติการเพิ่มค่าใช้จ่าย <a href="#">คลิ๊ก<i class="glyphicon glyphicon-chevron-right"></i></a></p>
				 <p>- ช่องทางการติดต่อเจ้าหน้าที่เมื่อเกิดปัญหา <a href="#">คลิ๊ก<i class="glyphicon glyphicon-chevron-right"></i></a></p>
				 
			 </div>
			<div class="clearfix"></div>
		 </div>
	 </div>
</div>
<!---->		
<div class="map">
	 <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6632.248000703498!2d151.265683!3d-33.7832959!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12abc7edcbeb07%3A0x5017d681632bfc0!2sManly+Vale+NSW+2093%2C+Australia!5e0!3m2!1sen!2sin!4v1433329298259" style="border:0"></iframe>
</div>
<!---->	
<div id="contact" class="contact">
	 <div class="container">
		 <h3>ติดต่อเรา</h3>
		 <div class="touch-top">
			 <div class="col-md-8 touch-left">
				 <html:form action="/notification">
					<input type="text" id="name" name="name" required placeholder="Name" />
					<input type="email" id="email" name="email" required placeholder="Email" />
					<input type="text" id="messageHD" name="messageHD" required placeholder="Subject" />
					<textarea  id="messageDT" name="messageDT" required placeholder="Message"></textarea>
					<input type="submit" value="SUBMIT">				
				 </html:form>	
			 </div>
			 <div class="col-md-4 touch-right">
					<div class="touch-right-top">
							<span class="add"> </span>
							<h4>123 MAIN STREET,<label>CITY, COUNTRY</label></h4>
					</div>
					<div class="touch-right-top">
							<span class="mail"> </span>
							<p><a href="mailto:example@email.com">EMAIL@DOMAIN.COM</a></p>
					</div>
					<div class="touch-right-top">
							<span class="num"> </span>
							<p>+0123 456 789</p>
					</div>
			 </div>
				<div class="clearfix"></div>
		  </div>
	 </div>
	 
</div>
<div class="clearfix"></div>