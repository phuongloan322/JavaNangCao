<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phương trình bậc hai</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h2>Giải phương trình bậc hai</h2><br>
		<form action="ptb2.jsp?msg=1" method="post">
			<input placeholder="Nhập a" name="a">
			<input placeholder="Nhập b" name="b">
			<input placeholder="Nhập c" name="c"> 
			<button>Giải</button>
		</form>
			<%
				String atam = request.getParameter("a");
				String btam = request.getParameter("b");
				String ctam = request.getParameter("c");
			%>
		<br>
		<% if(atam!=null && btam!=null && ctam!=null){ 
			int a = Integer.parseInt(atam);
			int b = Integer.parseInt(btam);
			int c = Integer.parseInt(ctam);
			int delta = b*b-4*a*c;
			float x = (float) -b/(2*a);
		%>
			<div>
				Ta có PTB2:&nbsp;&nbsp; <strong><%=a %>x<span style="font-size: 10px; position: absolute;">2</span> + <%=b %>x + <%=c %> = 0</strong><br>
				<div>
					
					<img alt="" src="<%=request.getContextPath()%>/img/delta1.PNG" height="20px"> 
					= b<span style="font-size: 10px; position: absolute;">2</span> - 4ac = <%=delta %>
					<% if(delta < 0) {%>
						< 0<br>Vậy phương trình vô nghiệm
					<%}
					else if(delta == 0) {
					%>
						= 0<br>Vậy phương trình có 1 nghiệm kép: x = <%=x %>
					<%}
					else if(delta > 0) {
						float x1 = (float) (-b+Math.sqrt(delta)/(2*a));
						float x2 = (float) (-b+Math.sqrt(delta)/(2*a));
					%>
						> 0<br>Vậy phương trình có 2 nghiệm: x1 = <%=x1 %>, x2 = <%=x2 %>
					<%} %>
				</div>
			</div>
		<%} %>
	</div>
	
</body>
</html>