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
	<%
		String tieudeSach = "SÁCH MỚI";
		Loaibean loaibean = (Loaibean)request.getAttribute("itemLoai");
		if(loaibean!=null) {
			tieudeSach = loaibean.getTenloai();
		}
	%>
	<section style="background: #f0f0f0">
		<section style="padding-top:10px">
			<div class="container">
				<div class="row">
					<%@include file="/views/CategorySach.jsp" %>
					
					<div class="col-sm-9 padding-right">
						<div class="features_items"><!--features_items-->
							<h2 class="title text-center"><%=tieudeSach %></h2>
							<table class="table" style="max-width: 100%">
							<%
								if(request.getAttribute("Sachlist") != null) {
									List<Sachbean> ds = (List)request.getAttribute("Sachlist");
									for(Sachbean s : ds) {
										int i = ds.indexOf(s);
									%>
										<td  style="text-align:center">
											<div class="iSach">
											<a href="<%=request.getContextPath() %>/DetailSach?i=<%=s.getMasach()%>"> 
												<img src="<%=request.getContextPath() %>/asset/<%=s.getAnh()%>" width="200" height="220">
												<br><br> <b><%=s.getTensach()%></b>
												<br> Tác giả: <i><%=s.getTacgia()%> </i>
												<br> Giá: <i><%=s.getGia()%>đ</i></a>
												<br>
												<a href="<%=request.getContextPath() %>/Cart?AddCart=1&itemCart=<%=s.getMasach()%>" class="sach-box"> 
												<img src="<%=request.getContextPath() %>/asset/image_sach/buy3.png" height="40"></a> 
											</div>
										</td>
									<%
									if((i+1)%3==0 || (i+1)==ds.size()) {
									%>
										</tr>
										<%
											if((i+1)<ds.size()) {
										%>
										<tr>
								<%}}}} %>
						</table>
							
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