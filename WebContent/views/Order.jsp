<%@page import="bean.ChiTietHoaDon"%>
<%@page import="java.util.List"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.util.Formatter"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="bean.Cartbean"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <%@include file="/views/header/head.jsp" %>
</head><!--/head-->

<body>
	<%@include file="/views/header/header.jsp" %>
	<%
		List<ChiTietHoaDon> detailOrder = (List<ChiTietHoaDon>)session.getAttribute("DetailOrder");
		Sachbo sachbo = new Sachbo();
	%>
	<%
		if(!"".equals(request.getParameter("msg"))){
			String msg = request.getParameter("msg");
			if("OK".equals(msg)){
				%>
					<div class="alert alert-success" role="alert">
						 <div class="container">Xử lý thành công..!</div>
					</div>
				<%
			}
		}
	%>
	<section id="cart_items">
	<form action="<%=request.getContextPath() %>/Cart?DeleteCart=1" method="post">
		<div class="container setcart">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="<%=request.getContextPath()%>/Cart">Trang chủ</a></li>&nbsp; Đơn hàng
				 
				</ol>
			</div>
			<hr>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Sản phẩm</td>
							<td class="description"></td>
							<td class="price">Số lượng</td>
							<td class="price">Tổng tiền</td>
							<td class="quantity">Ngày mua</td>
							<td class="total">Tình trạng đơn hàng</td>
							<td></td>
						</tr>
					</thead>
					<tbody> 
							<%
							
							if(detailOrder!= null) { 
							for(ChiTietHoaDon i : detailOrder) {
								Sachbean sachbean = sachbo.FindSach(i.getMaSach());
								Formatter fGia = new Formatter();
								Formatter fTongGia = new Formatter();
							%>
								 
									<tr>
										<td class="cart_product" width="75" height="90">
											<a href=""><img src="<%=request.getContextPath() %>/asset/<%=sachbean.getAnh()%>" alt="" width="75" height="90"></a>
										</td>
										<td class="cart_description">
											<h4><a href=""><%=sachbean.getTensach()%></a></h4>
											<p><%=sachbean.getTacgia()%></p>
											<p><%=fGia.format("%,d", sachbean.getGia()) %>đ</p>
										</td>
										<td class="cart_price">
											<p><%=i.getSoLuongMua() %></p>
										</td>
										<td class="cart_price">
											<%long Tonggia = i.getSoLuongMua()*sachbean.getGia(); %>
											<p><%=fTongGia.format("%,d",Tonggia)%>đ</p>
										</td>
										<td class="cart_price">
											<p><%=i.getHoaDonbean().getNgayMua()%></p>
										</td>
										<td class="cart_price">
											<%  String tinhtrang = null;
												boolean itam = i.isDamua();
												if(itam) {
													tinhtrang = "Đã thanh toán";
												}
												else {
													tinhtrang = "Thanh toán khi nhận hàng";
												}
									
											%>
											<p><%=tinhtrang%></p>
										</td>
									</tr>
								<%
							}}
							%>
					</tbody>
				</table>
			</div>
			<div>
				<div class="pull-left">
					<a href="<%=request.getContextPath()%>/Sach_index" class="ttmh"><i class="fas fa-arrow-left"></i> Tiếp tục mua hàng</a>
				</div>
			</div>	
		</form>
	</section> 
	<% %>
	<br><br><br>
	
<!-- 	<script type="text/javascript">
		String array = [];
		var checkboxes = document.querySelectorAll('input[type=checkbox]:checked')
	
		for (var i = 0; i < checkboxes.length; i++) {
		  array.push(checkboxes[i].value)
		}
	</script> -->
</body>
</html>