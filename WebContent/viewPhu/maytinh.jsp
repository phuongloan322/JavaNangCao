<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Máy tính</title>
</head>
<body>
	<%String kq=request.getParameter("kq"); 
	String a=request.getParameter("a"); 
	String b=request.getParameter("b"); %>
	<form action="maytinh.jsp" method="post">
		a= <input name="txta" value="<%=(a == null ? "0" : a)%>" type="number">
		<br> b= <input name="txtb" value="<%=(b == null ? "0" : b)%>"
			type="number"> <br> Kết quả:
		<%=(kq == null ? "0" : kq)%><br> <input name="butcong"
			type="submit" value="+"> <input name="buttru" type="submit"
			value="-"> <input name="butnhan" type="submit" value="*">
		<input name="butchia" type="submit" value="/">
	</form>
	<%
		String tama = request.getParameter("txta");//Lay ve gia tri cua txta
		String tamb = request.getParameter("txtb");//Lay ve gia tri cua txtb
		Double kq1 = (double) 0;
		if (tama != null && tamb != null) {
			Long aa = Long.parseLong(tama);//Doi chuoi a sang so
			Long bb = Long.parseLong(tamb);
			if (request.getParameter("butcong") != null)//Neu nguoi dung kich vao nuts cong
				kq1 = (double) aa + bb;
			if (request.getParameter("buttru") != null)//Neu nguoi dung kich vao nuts cong
				kq1 = (double) aa - bb;
			if (request.getParameter("butnhan") != null)//Neu nguoi dung kich vao nuts cong
				kq1 = (double) aa * bb;
			if (request.getParameter("butchia") != null)//Neu nguoi dung kich vao nuts cong
				kq1 = (double) aa / bb;
			response.sendRedirect("maytinh.jsp?kq=" + kq1.toString() + "&a=" + aa + "&b=" + bb);
		}
	%>
</body>
</html>