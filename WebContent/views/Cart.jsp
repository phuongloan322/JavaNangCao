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
		HashMap<String, Cartbean> cart = (HashMap<String, Cartbean>)session.getAttribute("Cart");
		
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
	<%
		if(!"".equals(request.getParameter("msg"))){
			String msg = request.getParameter("msg");
			if("ERROR".equals(msg)){
				%>
					<div class="alert alert-danger" role="alert">
						 <div class="container">Xử lý thất bại..!</div>
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
				  <li><a href="<%=request.getContextPath()%>/Cart">Trang chủ</a></li>&nbsp; Giỏ hàng
				 
				</ol>
			</div>
			<hr>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="" style="text-align: center">#</td>
							<td class="image">Sản phẩm</td>
							<td class="description"></td>
							<td class="price">Đơn giá</td>
							<td class="quantity">Số lượng</td>
							<td class="total">Thành tiền</td>
							<td></td>
						</tr>
					</thead>
					<tbody> 
							<%
							
							if(cart!= null) { 
							for(Map.Entry<String, Cartbean> entry : cart.entrySet()) {
								String key = entry.getKey();
								Cartbean itemCart = entry.getValue();
								Formatter fGia = new Formatter();
								Formatter fTongGia = new Formatter();
							%>
								 <input type="hidden" value="<%=itemCart.getSachbean().getMasach()%>" name="imasach"> 
									<tr>
										<td style="text-align: center">
											<input type="checkbox" name="check" value="<%=itemCart.getSachbean().getMasach()%>">
										</td>
										<td class="cart_product" width="75" height="90">
											<a href=""><img src="<%=request.getContextPath() %>/asset/<%=itemCart.getSachbean().getAnh()%>" alt="" width="75" height="90"></a>
										</td>
										<td class="cart_description">
											<h4><a href=""><%=itemCart.getSachbean().getTensach()%></a></h4>
											<p><%=itemCart.getSachbean().getTacgia()%></p>
										</td>
										<td class="cart_price">
											<p><%=fGia.format("%,d", itemCart.getSachbean().getGia())%>đ</p>
										</td>
										<td class="cart_quantity">
											<div class="cart_quantity_button">
												<a class="cart_quantity_up" href="<%=request.getContextPath()%>/Cart?EditCart=1&masach=<%=itemCart.getSachbean().getMasach()%>&quanty=1"> + </a>
												<input class="cart_quantity_input" type="text" name="quantity" value="<%=itemCart.getSoluong()%>" autocomplete="off" size="2">
												<a class="cart_quantity_down" href="<%=request.getContextPath()%>/Cart?EditCart=1&masach=<%=itemCart.getSachbean().getMasach()%>&quanty=-1"> - </a>
											</div>
										</td>
										<td class="cart_total">
											<p class="cart_total_price"><%=fTongGia.format("%,d", (int)itemCart.getTongtien())%>đ</p>
										</td>
										<td class="cart_total">
											<a class="cart_total_price" href="<%=request.getContextPath()%>/Cart?DeleteCart=1&item=<%=itemCart.getSachbean().getMasach()%>"><i class="fa fa-times"></i></a>
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
					<div style="padding: 10px;">
						<button name="okXoa" class="btn-link tralai">Trả lại</button><span> |</span>&nbsp;
						<a class="tralai" href="<%=request.getContextPath()%>/Cart?DeleteCart=1&item=all">Trả lại toàn bộ</a>
					</div>
					<a href="<%=request.getContextPath()%>/Sach_index" class="ttmh"><i class="fas fa-arrow-left"></i> Tiếp tục mua hàng</a>
				</div>
				<div class="pull-right">
					<div class="totalPrice">
					<% 
					Formatter fTongcong = new Formatter();  
					long TotalPrice = 0;
					if(session.getAttribute("TotalPrice")!=null && cart!=null) {
					  TotalPrice = (long)session.getAttribute("TotalPrice");			
					}
					%>
					Tổng cộng:  <%=fTongcong.format("%,d", (int)TotalPrice)%>đ 
					</div>
					<a data-toggle="modal" data-target="#exampleModal" class="tt">Thanh toán <i class="fas fa-arrow-right"></i></a>
					
				</div>
			</div>	
		</form>
	</section> 
	<% %>
	<br><br><br>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document" style="width:30%">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title" id="exampleModalLabel">Thông tin đặt hàng</h3>
	        Nhanh chóng và dễ dàng.
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body ">
	      
	      	<%
	      	if(session.getAttribute("loginInfor")!=null){
	      	Accountbean acc = (Accountbean)session.getAttribute("loginInfor");%>	
	      	
	        <form action="<%=request.getContextPath()%>/checkout" method="post">
	        	<div class="form-group">
		            <label for="recipient-name" class="col-form-label">Họ và tên:</label>
		            <input type="text" class="form-control" required id="hoten" placeholder="Họ tên" value="<%=acc.getHoten() %>" name="hoten"/>
	          	</div>
		           <div class="form-group">
		            <label for="recipient-name" class="col-form-label">Số điện thoại:</label>
		            <input type="text" class="form-control" required id="phone" placeholder="Số điện thoại" value="<%=acc.getSodt() %>" name="sdt"/>
		        </div>
		        <div class="form-group">
		            <label for="recipient-name" class="col-form-label">Địa chỉ:</label>
		            <input type="text" class="form-control" required placeholder="Địa chỉ" value="<%=acc.getDiachi() %>" name="diachi"/>
		        </div>
		        <div class="form-group">
		            <label for="recipient-name" class="col-form-label">Hình thức thanh toán::</label>
					<div class="radiothanhtoan">
						&nbsp;<input type="radio" id="" name="thanhtoan" value="true">
						<label class="labelthanhtoan">Thanh toán qua thẻ</label><br>
						&nbsp;<input type="radio" id="" name="thanhtoan" value="false">
						<label class="labelthanhtoan">Thanh toán khi nhận hàng</label><br>
					</div>				
		         </div>
		         
		         <button type="submit" class="btn btn-default btnregister vertical-center CreateAcc">Đặt hàng</button>
	        </form>
	        <%} %>
	    </div>
	  </div>
	</div>
</body>
</html>