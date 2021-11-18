<%@page import="bean.SinhVienbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.SinhVienbo"%>
<%@page import="bean.Khoabean"%>
<%@page import="bo.Khoabo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hiển thị Khoa và Sinh viên</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		Khoabo khoabo = new Khoabo();
		SinhVienbo svbo = new SinhVienbo();
		ArrayList<SinhVienbean> ds = svbo.getSV();
		boolean flag = false;
		
	%>
	<table align="center" cellspacing="0" width="1000">
		<tr>
			<td >
				<div class="dropdown ">
				    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Danh sách khoa
				    <span class="caret"></span></button>
				    <ul class="dropdown-menu float-right">
					     	<li><a class="item-menu"
								href="htKhoa.jsp?khoa=all">Tất cả khoa</a></li>
					      	<li> 
					      	<% for (Khoabean k : khoabo.getKhoa()) {%>
					      	<li> 
					      		<a  class="item-menu"
								href="htKhoa.jsp?khoa=<%=k.getMakhoa()%>"><%=k.getTenkhoa()%>
								</a>
							</li>
							<%} %>

				    </ul>
				</div>
			</td>
			<td>
				<form class="example item-right" action="htKhoa.jsp?" method="post" style="margin:auto;max-width:300px">
					  <input type="text" placeholder="Search.." name="search">
					  <button type="submit"><i class="fa fa-search"></i></button>
				</form>
			</td>
		</tr>
		<!-- hiển thị danh sách -->
		<tr>
		 	<td valign="top" width="700" colspan="2">
				<br>
				<h4 style="text-align: center"><b>Danh sách sinh viên</b></h4><br>
				<table class="table table-striped">
				    <thead>
				      <tr>
				        <th>Mã sinh viên</th>
				        <th>Họ tên</th>
				        <th>Địa chỉ</th>
				        <th>Điểm trung bình</th>
				        <th>Mã khoa</th>
				      </tr>
				    </thead>
		 			<tbody>
				      <% 
				      String khoa = request.getParameter("khoa");
				      String search = request.getParameter("search");
				      
				      if(khoa!=null && khoa.equals("all") || (khoa==null && search==null)) {%>
				    	  <% 
				    	  for (SinhVienbean sv : ds) {  %>
				    	  
							<tr>
								<td><%=sv.getMasv()%></td>
								<td><%=sv.getHoten()%></td>
								<td><%=sv.getDiachi()%></td>
								<td><%=sv.getDtb()%></td>
								<td><%=sv.getMakhoa()%></td>
							</tr>
							<%}	%>
				     <%}
				      else if(search != null ) {
							ArrayList<SinhVienbean> dsSinhVien = svbo.TimChung(search);
							for (SinhVienbean sv : dsSinhVien) { %>
							<tr>
								<td><%=sv.getMasv()%></td>
								<td><%=sv.getHoten()%></td>
								<td><%=sv.getDiachi()%></td>
								<td><%=sv.getDtb()%></td>
								<td><%=sv.getMakhoa()%></td>
							</tr>
						 <%}
						}
				      else {
				    	  ArrayList<SinhVienbean> dsSinhVien = svbo.Tim(khoa);
					      for (SinhVienbean sv : dsSinhVien) { %>
							<tr>
								<td><%=sv.getMasv()%></td>
								<td><%=sv.getHoten()%></td>
								<td><%=sv.getDiachi()%></td>
								<td><%=sv.getDtb()%></td>
								<td><%=sv.getMakhoa()%></td>
							</tr>
						 <%}
						}%>
							  
				    </tbody>
				  </table>
			</td>
		</tr>
		
	</table>
</body>
</html>