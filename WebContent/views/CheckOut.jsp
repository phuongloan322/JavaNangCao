<%@page import="bean.Accountbean"%>
<%@page import="bo.Accountbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <%@include file="/views/header/head.jsp" %>
</head><!--/head-->
 
<body>

	<%@include file="/views/header/header.jsp" %>
	
	<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4 panel panel-default">
					<div class="login-form"><!--login form-->
						<b class="register">Thông tin thanh toán</b>
						<br>
						Nhanh chóng và dễ dàng.<hr>
						
						<%Accountbean acc = (Accountbean)session.getAttribute("loginInfor");%>	
						
						<form action="<%=request.getContextPath()%>/checkout" method="post" class="has-error">
							
							<input type="text" required id="hoten" placeholder="Họ tên" value="<%=acc.getHoten() %>" name="hoten"/>
							<input type="text" required id="phone" placeholder="Số điện thoại" value="<%=acc.getSodt() %>" name="sdt"/>
							<input type="text" required placeholder="Địa chỉ" value="<%=acc.getDiachi() %>" name="diachi"/>
							<label>Hình thức thanh toán:</label>
							<div class="radiothanhtoan">
								&nbsp;<input type="radio" id="" name="thanhtoan" value="true">
								<label class="labelthanhtoan">Thanh toán qua thẻ</label><br>
								&nbsp;<input type="radio" id="" name="thanhtoan" value="false">
								<label class="labelthanhtoan">Thanh toán khi nhận hàng</label><br>
							</div>
							<!-- <select name="thanhtoan" id="thanhtoan">
							  <option value="Đã thanh toán">Thanh toán qua thẻ</option>
							  <option value="Chưa thanh toán">Thanh toán khi nhận hàng</option>
							</select> -->
							
							<button type="submit" class="btn btn-default btnregister vertical-center CreateAcc">Đặt hàng</button>
							<br>
						</form>
					</div><!--/login form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	

	
	</body>
</html>