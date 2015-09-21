<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!--Service-->

<script src="js/uikit.min.js"></script>
<script src="js/modal.min.js"></script>
<div id="service" class="service">
	 <div class="container">
		 <h3>การบริการ</h3>	
		 <div class="service-grids">
		 <div class="icon-grids">
			 <div class="col-md-6 futr-grid futr1">
				 <div class="icon-pic">
						<div class="icon text-center">
						 <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
						 </div>
				  </div>
				 <div class="icon-info">
						 <h4><a href="#">Vestibulum sagittis</a></h4>							
						 <p>Aliquam erat volutpat. Nam egestas dapibus pellentesque. Nunc non luctus neque, non aliquet tortor. Suspendisse in faucibus dolor, commodo malesuada ipsum. Cras vel facilisis mi. In malesuada felis eu volutpat consequat.</p>
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
						<h4><a href="#">Enter Text Here...</a></h4>						 
						<p>Mauris vestibulum pulvinar urna id ultricies. Etiam volutpat interdum mi in aliquet. Pellentesque vel tincidunt sapien.
		 Suspendisse potenti. Nam sed </p>
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
						 <h4><a href="#">Vestibulum sagittis</a></h4>							
						 <p>Aliquam erat volutpat. Nam egestas dapibus pellentesque. Nunc non luctus neque, non aliquet tortor. Suspendisse in faucibus dolor, commodo malesuada ipsum. Cras vel facilisis mi. In malesuada felis eu volutpat consequat.</p>
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
						<h4><a href="#">ระบบสมาชิกที่ใช้งานง่าย</a></h4>						 
						<p>ด้วยระบบควบคุมต้นทุน ที่ใช้งานง่าย ช่วยให้ทำงานง่ายขึ้น</p>
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
		<h3>เกี่ยวกับ</h3>
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
		 <h3>แกลอรี่</h3>
         <div class="gallery-info">
         
         		<!--gallery-->		
				<div class="col-md-4">
					<a href="#my-id" data-uk-modal>
						<img src="home/images/img15.jpg" class="img-responsive" alt="">
						<div class="b-wrapper">
							<span class="b-animate b-from-left    b-delay03 ">
								<img class="img-responsive" src="home/images/e.png" alt=""/>
							</span>					
						</div>
					</a>				
				</div>	
				<!-- This is the modal -->
				<div id="my-id" class="uk-modal">
				    <div class="uk-modal-dialog">
				        <a class="uk-modal-close uk-close"></a>
				        ...
				    </div>
				</div>
				<!--gallery-->	
				
				
				<div class="clearfix"> </div>
			</div>
	 </div>
</div>
<!---->
<div id="blog" class="blog">
	 <div class="container">
		 <h3>ข่าวสาร</h3>
		 <div class="blog-grids">
			 <div class="col-md-6 blog-grid">
				 <a href="#"><img src="home/images/b1.jpg" class="img-responsive" alt=""/></a> 
				 <h4><a href="#">Etiam luctus velit ac cursus lobortis.</a></h4>
					<span>Mar 12 | 2015</span>
				 <p>Aenean eget eleifend nulla. Nunc vel nisi mi. Ut faucibus ornare tempus. Donec non mi et sem convallis tincidunt ac in purus. Nullam tincidunt orci elit, vitae vulputate sapien ullamcorper et. Sed ut est purus. Duis consectetur suscipit ullamcorper. Nam dictum nisl odio, eget maximus ante interdum iaculis urna sapien.</p>				 
			 </div>
			 <div class="col-md-6 blog-grid">
				 <a href="#"><img src="home/images/b2.jpg" class="img-responsive" alt=""/> </a> 
				 <h4><a href="#">Etiam luctus velit ac cursus lobortis.</a></h4>
					<span>Mar 12 | 2015</span>
				 <p>Aenean eget eleifend nulla. Nunc vel nisi mi. Ut faucibus ornare tempus. Donec non mi et sem convallis tincidunt ac in purus. Nullam tincidunt orci elit, vitae vulputate sapien ullamcorper et. Sed ut est purus. Duis consectetur suscipit ullamcorper. Nam dictum nisl odio, eget maximus ante interdum iaculis urna sapien.</p>
			 </div>
			 <div class="clearfix"></div>
			 <div class="middleblog-grid blog-grid">
				 <a href="#"><img src="home/images/b3.jpg" class="img-responsive" alt=""/> </a> 
				 <h4><a href="#">Etiam luctus velit ac cursus lobortis.</a></h4>
					<span>Mar 12 | 2015</span>
				 <p>Aenean eget eleifend nulla. Nunc vel nisi mi. Ut faucibus ornare tempus. Donec non mi et sem convallis tincidunt ac in purus. Nullam tincidunt orci elit, vitae vulputate sapien ullamcorper et. Sed ut est purus. Duis consectetur suscipit ullamcorper. Nam dictum nisl odio, eget maximus ante interdum iaculis urna sapien.</p>
				
			 </div>
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
				 <form>
					<input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" />
					<input type="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" />
					<textarea onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}"></textarea>
					<input type="submit" value="SUBMIT">				
				 </form>	
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