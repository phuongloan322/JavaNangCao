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
						<b class="register">ĐĂNG KÝ</b>
						<br>
						Nhanh chóng và dễ dàng.<hr>
						<form action="<%=request.getContextPath()%>/Register" method="post" class="has-error">
							<input type="text" placeholder="Tên đăng nhập" name="username"/>
							<%
								String error = request.getParameter("msg");
								if(error != null && error.equals("ERROR")) {
									%>
									<span class="help-block">Tên đăng nhập đã tồn tại!</span>
									<%
								}
							%>
							<input type="text" required id="username" placeholder="Họ tên" name="hoten"/>
							<div class="error-text1">${ status }</div>
							<input type="email" required id="email" placeholder="Email" name="email"/>
							<div class="error-text2 error-text">${ status }</div>
							<input type="text" required placeholder="Số điện thoại" name="sodt"/>
							<input type="password" id="password" required placeholder="Mật khẩu" name="password"/>
							<div class="error-text3"></div>
							<input type="password" id="repassword" required placeholder="Nhập lại mật khẩu" name="repassword" onkeyup='check();' />
							<div class="error-text3"></div>
							<span id='message'></span>
							<input type="text" required placeholder="Địa chỉ" name="diachi"/>
							<a class="textcenter" href="<%=request.getContextPath()%>/login">Bạn đã có tài khoản ?</a>
							
							<button type="submit" class="btn btn-default btnregister vertical-center CreateAcc">Đăng ký tài khoản</button>
							<br>
						</form>
					</div><!--/login form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
	<script type="text/javascript">
	var check = function() {
		  if (document.getElementById('password').value ==
		    document.getElementById('repassword').value) {
		    document.getElementById('message').style.color = 'green';
		    document.getElementById('message').innerHTML = 'matching';
		  } else {
		    document.getElementById('message').style.color = 'red';
		    document.getElementById('message').innerHTML = 'not matching';
		  }
		}
	</script>
	
	</body>
</html>