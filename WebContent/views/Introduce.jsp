<%@page import="java.util.List"%>
<%@page import="bo.Cartbo"%>
<%@page import="bean.Cartbean"%>
<%@page import="java.util.HashMap"%>
<%@page import="bean.Loaibean"%>
<%@page import="bean.Sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.Loaibo"%>
<%@page import="bo.Sachbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <%@include file="/views/header/head.jsp" %>
</head>

<body style="background: #fff">
	<%@include file="/views/header/header.jsp" %>

	<section style="background: #f0f0f0">
		<section style="padding-top:10px">
			<div class="container">
				<div class="row">
					<%@include file="/views/CategorySach.jsp" %>
					
					<div class="col-sm-9 padding-right">
						<div class="features_items" style="padding: 5px 30px;">
							<!--  -->
							
							<h4>GIỚI THIỆU VỀ NHÀ SÁCH MINH KHAI (CÔNG TY MINH KHAI S.G)</h4>
							<hr>
							<p>Từ năm 1998 đến nay, Nhà sách Minh Khai đã và đang tiếp tục nhận được sự tín nhiệm của đông đảo bạn đọc gần xa cũng như sự tín nhiệm của các cơ quan, trường học trong và ngoài nước. Sự tín nhiệm đó chính là nguồn động lực lớn giúp Nhà sách luôn cố gắng hoàn thiện hơn nữa để phục vụ quý khách ngày một tốt hơn.</p>
							<br>
							<br>
							<table>
								<tbody>
									<tr>
										<td><img src="<%=request.getContextPath() %>/asset/image_sach/mk1.jpg" width="80%" height="50%"></td>
										<td><img src="<%=request.getContextPath() %>/asset/image_sach/mk2.jpg" width="80%" height="50%"></td>
									</tr>
									<tr>
										<td><img src="<%=request.getContextPath() %>/asset/image_sach/mk3.jpg" width="80%" height="50%"></td>
										<td><img src="<%=request.getContextPath() %>/asset/image_sach/mk4.jpg" width="80%" height="50%"></td>
									</tr>
								</tbody>	
							</table>
							<br>
							<p>Với tổng diện tích 1.200m2, không gian rộng rãi, trang bị máy lạnh thoáng mát, đội ngũ nhân viên phục vụ ân cần. Chủng loại sách phong phú với khoảng 35.000 đầu sách, đa dạng các mặt hàng: Văn phòng phẩm, Dụng cụ học sinh, Băng đĩa, Quà lưu niệm, Đồ chơi, …</p>
							<br>
							<p>Nhà sách Minh Khai chuyên cung cấp sỉ và lẻ các mặt hàng sau tại chỗ hoặc tận nơi theo yêu cầu, nhanh chóng và tiện lợi:</p>
						
							<strong>
							   <p> • Sách</p>
							   <p> • Báo và Tạp chí</p>
							   <p> • Băng đĩa nhạc</p>
							   <p> • Văn phòng phẩm và quà tặng, lưu niệm, ...</p> 
							</strong>
                    		<br>
                    		<table>
								<tbody>
									<tr>
										<td><img src="<%=request.getContextPath() %>/asset/image_sach/mk5.jpg" width="80%" height="50%"></td>
										<td><img src="<%=request.getContextPath() %>/asset/image_sach/mk6.jpg" width="80%" height="50%"></td>
									</tr>
								</tbody>	
							</table>
							<br>
                    		<p>Khi đặt mua hàng tại nhà sách của chúng tôi, quý khách sẽ giảm được khá nhiều những chi phí vì được hưởng các loại hình dịch vụ miễn phí và Quý khách còn được hưởng chiết khấu cao. Ngoài việc cung cấp sỉ và lẻ các mặt hàng phong phú như trên, Nhà sách Minh Khai còn phục vụ Quý khách các dịch vụ sau:</p>
                    		<br>
                    		<strong>• Dịch vụ bán hàng qua mạng Internet (giao hàng tận nơi)</strong>
                    		<p>Thăm website minhkhai.vn, Quý khách có thể lựa chọn và đặt mua những loại Sách, Báo & Tạp chí, Băng Đĩa, Văn Phòng Phẩm, Quà lưu niệm, ... mà mình cần.</p>
                    		<table>
								<tbody>
									<tr>
										<td><img src="<%=request.getContextPath() %>/asset/image_sach/mk8.jpg" width="80%" height="50%"></td>
										<td><img src="<%=request.getContextPath() %>/asset/image_sach/mk7.jpg" width="80%" height="50%"></td>
									</tr>
								</tbody>	
							</table>
							<br>
							<p>Đặc biệt, Nhà sách Minh Khai còn liên kết với Amazon.com để phục vụ nhu cầu mua sách ngoại văn thuộc các thể loại, chuyên đề khác nhau.
							</p>
							<p>Khi mua sách ngoại văn từ Amazon.com thông qua minhkhai.vn, Quý khách sẽ tiết kiệm được khá nhiều tiền bạc và thời gian. Hình thức thanh toán: Tiền mặt hoặc Chuyển khoản hoặc thẻ Tín dụng.</p>
							<p>Chúng tôi sẽ giao đủ chủng loại và số lượng mà khách yêu cầu với đầy đủ chứng từ hợp lệ. Với phương châm: Càng ngày càng phục vụ khách hàng tốt hơn, nhà sách Minh Khai chúng tôi rất hân hạnh được đáp ứng những yêu cầu của quý khách.</p>
							<br>	
							<center>
								<p>Các bạn muốn biết thêm thông tin, xin liên hệ địa chỉ:<p>
								<b>Công ty TNHH Minh Khai S.G</b>
								<br>
								249 - Nguyễn Thị Minh Khai, phường Nguyễn Cư Trinh, Quận 1
								<br>
								TP. Hồ Chí Minh - Việt Nam
								<br>
								Tel: 08 39 250 590 – 08 39 250 591 (Xin số 38 - Gặp bộ phận bán hàng qua mạng)
								<br>
								E-mail: mk.book@minhkhai.vn - mk.book@minhkhai.com.vn
							</center>
							<p style="font-size: 13px;">
								Chúng tôi hoan nghênh Quý khách tới thăm Nhà sách Minh Khai tại địa chỉ trên hay Website: 
								<a href="http://www.minhkhai.vn">www.minhkhai.vn</a>
								và 
								<a href="http://www.minhkhai.com.vn">www.minhkhai.com.vn</a>
							</p>
							<!--  -->
						</div><!--features_items-->
						
						
					</div><!--/recommended_items-->
				</div>
			</div>
		</section>
	</section>
	
<!-- 	<footer id="footer">Footer
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
				</div>
			</div>
		</div>
		
	</footer>/Footer -->
	

  
    <script src="<%=request.getContextPath() %>/asset/js/jquery.js"></script>
	<script src="<%=request.getContextPath() %>/asset/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/asset/js/jquery.scrollUp.min.js"></script>
	<script src="<%=request.getContextPath() %>/asset/js/price-range.js"></script>
    <script src="<%=request.getContextPath() %>/asset/js/jquery.prettyPhoto.js"></script>
    <script src="<%=request.getContextPath() %>/asset/js/main.js"></script>
</body>
</html>