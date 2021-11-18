<%@page import="bean.Loaibean"%>
<%@page import="bean.Sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.Loaibo"%>
<%@page import="bo.Sachbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
		<a class="navbar-brand" href="Sach.jsp">Minh Khai Book</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Trang
						chủ <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Giới
						thiệu</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Gian hàng</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Sản phẩm </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<%-- <%
						Sachbo sbo = new Sachbo();
						Loaibo lbo = new Loaibo();
						ArrayList<Sachbean> ds = sbo.getSach();
							ArrayList<Loaibean> dsloai = lbo.getLoai();
							for (Loaibean i : dsloai) {
						%>
						<a class="dropdown-item" href="#"><%=i.getTenloai()%></a>
						<%
							}
						%> --%>
				</li>
			</ul>
			<ul class="nav navbar-nav">
		      <li><a href="#" data-toggle="modal" data-target="#myModal">
		      		 Đăng ký</a></li>
		      <li><a href="#" data-toggle="modal" data-target="#myModall">
		      	 <% String kt =request.getParameter("kt");
		      			if(kt!=null && kt.equals("1")) {
		      		%>
		      		<a href=""></a>
		      		<%} else { %>
		           	<span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
		           	<% if(kt!=null && kt.equals("0")){ %>
		           		<script>alert("Đăng nhập sai!");</script>
		           		<%}} %> 
		    </ul>
		</div>
	</nav>
	<div class="modal fade" id="myModall" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng nhập hệ thống</h4>
        </div>
  		<div class="modal-body">
          <form method="post" action="Sach.jsp">
             <input name="txtun" type="text" class="form-control">
             <input name="txtpass" type="password" class="form-control">
             <input name="but1" type="submit" value="Đăng nhập" class="btn-primary">
         </form>
        </div>
      
      </div>
    </div>
  </div>