<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <%@include file="/views/header/head.jsp" %>
</head><!--/head-->
<body>
	<%@include file="/views/header/header.jsp" %>
	<section style="background: #f0f0f0">
	<br>
		<div id="contact-page" class="container" style="background: #fff">
    	<div class="bg">
    		<br>
				<iframe 
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1597.1966350380499!2d107.59181611705397!3d16.45918394402365!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3141a13f462a1445%3A0x1b70ba6cb49fb526!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBLaG9hIGjhu41jIEh14bq_!5e0!3m2!1svi!2sus!4v1635385254938!5m2!1svi!2sus" 
					width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy">
				</iframe>
    		<div style="padding:30px">  	
	    		<div class="col-sm-6" style="padding-top: 15px;border: 1px solid #f0f0f0;">
	    			<div class="contact-form">
	    				<h2 class="title text-center">Get In Touch</h2>
	    				<div class="status alert alert-success" style="display: none"></div>
				    	<form id="main-contact-form" class="contact-form" name="contact-form" method="post">
				            <div class="form-group col-md-6">
				                <input type="text" name="name" class="form-control" required="required" placeholder="Name">
				            </div>
				            <div class="form-group col-md-6">
				                <input type="email" name="email" class="form-control" required="required" placeholder="Email">
				            </div>
				            <div class="form-group col-md-12">
				                <input type="text" name="subject" class="form-control" required="required" placeholder="Subject">
				            </div>
				            <div class="form-group col-md-12">
				                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your Message Here"></textarea>
				            </div>                        
				            <div class="col-md-12">
				                <input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit">
				            </div>
				        </form>
	    			</div>
	    		</div>
	    		<div class="col-sm-5" style="border: 1px solid #f0f0f0; margin-left: 40px;">
	    			<div class="contact-info" style="padding: 15px 0;">
	    				<h2 class="title text-center">Contact Info</h2>
	    				<address>
	    					<p><b>Minh Khai Book</b></p>
							<p>Địa chỉ: 77 Nguyễn Huệ, Thành phố Huế, Tỉnh Thừa Thiên Huế, Việt Nam</p>
							<p>Điện thoại: (84) 0234.3823290</p>
							<p>Fax: (84) 0234.3824901</p>
							<p>Email: phuongloan322000@gmail.com</p>
	    				</address>
	    				<br>
	    				<div class="social-networks">
	    					<h2 class="title text-center">Social Networking</h2>
							<ul>
								<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
								<li><a href="#"><i class="fab fa-twitter"></i></a></li>
								<li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
								<li><a href="#"><i class="fab fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fab fa-google-plus-g"></i></a></li>
							</ul>
	    				</div>
	    			</div>
    			</div>    			
	    	</div>  
    	</div>	
    </div><!--/#contact-page-->
 	<br><br>
	</section>
	 
    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="js/gmaps.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>