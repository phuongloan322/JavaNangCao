<%@page import="bean.DonVibean"%>
<%@page import="java.util.List"%>
<%@page import="bean.NhanVienbean"%>
<%@page import="bo.DonVibo"%>
<%@page import="bo.NhanVienbo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Nhân Viên</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style type="text/css">
		td, tr {
			vertical-align: middle;
		}
	</style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		NhanVienbo nvbo = new NhanVienbo();
		DonVibo dvbo = new DonVibo();
		List<NhanVienbean> ds = nvbo.getNhanVien();
		String dv = request.getParameter("donvi");
		String key = request.getParameter("search");
		if (dv!=null && !dv.equals("all"))
			ds = nvbo.TimNhanVien(dv);
		else if (key != null)
			ds = nvbo.TimKiemChung(key);
		
	%>
	<table align="center" cellspacing="0" width="1000">
		<tr>
			<td >
				<div class="dropdown ">
				    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Danh sách khoa
				    <span class="caret"></span></button>
				    <ul class="dropdown-menu float-right">
					     	<li><a class="item-menu"
								href="NhanVien.jsp?donvi=all">Tất cả khoa</a></li>
					      	<li> 
					      	<% for (DonVibean k : dvbo.getDonVi()) {%>
					      	<li> 
					      		<a  class="item-menu"
								href="NhanVien.jsp?donvi=<%=k.getMadonvi()%>"><%=k.getTendonvi()%>
								</a>
							</li>
							<%} %>

				    </ul>
				</div>
			</td>
			<td>
				<form action="NhanVien.jsp" method="post" style="float:right;max-width:300px">
					  <input type="text" placeholder="Search.." name="search">
					  <button type="submit"><i class="fa fa-search"></i></button>
				</form>
			</td>
		</tr>
		<!-- hiển thị danh sách -->
		<tr>
		 	<td width="700" colspan="2">
				<br>
				<h4 style="text-align: center"><b>Danh sách sinh viên</b></h4><br>
				<table class="table table-striped">
				    <thead>
				      <tr>
				        <th>Ảnh</th>
				        <th>Mã nhân viên</th>
				        <th>Họ và tên</th>
				        <th>Địa chỉ</th>
				        <th>Đơn vị</th>
				      </tr>
				    </thead>
		 			<tbody>
				      <% 
				      String khoa = request.getParameter("khoa");
				      String search = request.getParameter("search");
				      for (NhanVienbean nv : ds) {  %>
				      	<tr>
				      		<td><img alt="" src="<%=request.getContextPath()%>/asset/images/<%=nv.getImg()%>" width="50" height="60"></td>
							<td><%=nv.getManv()%></td>
							<td><%=nv.getTennv()%></td>
							<td><%=nv.getDiachi()%></td>
							<td><%=dvbo.getDonVi(nv.getMadonvi()).getTendonvi()%></td>
						</tr>
					<%} %>
				    </tbody>
				  </table>
			</td>
		</tr>
		
	</table>
</body>
</html>