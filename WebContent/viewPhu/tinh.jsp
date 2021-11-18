<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tính</title>
</head>
<body>
	<%
		String tama=request.getParameter("txta");
		String tamb=request.getParameter("txtb");
		int kq = 0;
		if(tama!=null && tamb!=null) {
			int a = Integer.parseInt(tama);
			int b = Integer.parseInt(tamb);
			if(request.getParameter("butcong")!=null){
				kq = a + b;
			}
			
			if(request.getParameter("buttru")!=null){
				kq = a - b;
			}
			
			if(request.getParameter("butnhan")!=null){
				kq = a * b;
			}
			
			if(request.getParameter("butchia")!=null){
				kq = a / b;
			}
			//out.print("Kết quả: "+kq.toString());
			response.sendRedirect("maytinh.jsp?kq="+kq);
		}
	%>
</body>
</html>