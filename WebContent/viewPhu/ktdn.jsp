<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
     String dn=request.getParameter("txtun");
     String pass=request.getParameter("txtpass");
     if(dn!=null && pass!=null && dn.equals("abc")&&pass.equals("123")){
    	 response.sendRedirect("Sach.jsp?kt=1&&un="+dn);
     }else{
    	 response.sendRedirect("Sach.jsp?kt=0");
     }
    	 
  %>
</body>
</html>