<%@page import="bean.Sachbean"%>
<%@page import="bean.Loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.Loaibo"%>
<%@page import="bo.Sachbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sách</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
<script src="https://kit.fontawesome.com/yourcode.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Sachbo sbo = new Sachbo();
		Loaibo lbo = new Loaibo();
		ArrayList<Sachbean> ds = sbo.getSach();
		String ml = request.getParameter("ml");
		String key = request.getParameter("txtsearch");
		if (ml != null)
			ds = sbo.TimMaLoai(ml);
		else if (key != null)
			ds = sbo.TimChung(key);
	%>
	<%@include file="Sach_header.jsp" %>
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->
	
	

	<div class="main">
			<form action="Sach.jsp?" method="post" width="100%">
				<input type="text" class="setinput" name="txtsearch"
				placeholder="Search this blog">
				<button class="btn btn-secondary">
					<i class="fa fa-search"></i>
				</button>
			</form>
	</div>

	<table align="center" cellspacing="0" width="100%">
		<tr>
			<td valign="top" width="200">
				<table class="table">
					<%
						for (Loaibean loai : lbo.getLoai()) {
					%>
					<tr>
						<td><a href="Sach.jsp?ml=<%=loai.getMaloai()%>"> <%=loai.getTenloai()%>
						</a></td>
					</tr>
					<% 
						}
					%>
				</table>
			</td>
			<td>
				<table class="table" style="max-width: 100%">
					<%
						int n = ds.size();
						for (int i = 0; i < n; i++) {
							Sachbean s = ds.get(i);%>
						<td  style="text-align:center">
							<img src="image_sach/<%=s.getAnh()%>"><br> 
							<a href="giohang.jsp"> <img src="image_sach/datmua.PNG"></a> <br> <%=s.getTensach()%>
							<br> <%=s.getTacgia()%> <br> <%=s.getGia()%> <br>
						</td>
						<%
						if((i+1)%3==0 || (i+1)==ds.size()) {
						%>
							</tr>
							<%
								if((i+1)<ds.size()) {
							%>
							<tr>
					<%}}} %>
				</table>
				<hr> Sô sách:<%=sbo.Demsach(ml)%>
			</td>
	</table>
</body>
</html>