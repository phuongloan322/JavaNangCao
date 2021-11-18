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
						<b class="login">ĐĂNG NHẬP</b> <br><br>
						<form action="<%=request.getContextPath()%>/login" method="post" class="has-error">
							<input type="text" placeholder="User name" name="username"/>
							<input type="password" placeholder="Password" name="password"/>
							<span>
								<input type="checkbox" class="checkbox"> 
								Keep me signed in
							</span>
							<%
								String error = request.getParameter("msg");
								if(error != null && error.equals("ERROR")) {
									%>
									<span class="help-block textcenter">Thông tin đăng nhập không đúng!</span>
									<%
								}
							%>
							<button type="submit" class="btn btn-default btnlogin">Login</button>
							<a class="textcenter" href="#">Quên mật khẩu ?</a>
							<hr>
							<a href="<%=request.getContextPath() %>/Register" class="btn btn-default btnregister1 vertical-center">Tạo tài khoản mới</a>
							<br>
						</form>
					</div><!--/login form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
</body>
</html>