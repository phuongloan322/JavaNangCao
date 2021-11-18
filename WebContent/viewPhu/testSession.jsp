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
		//kiem tra xem da tao bien session chua
    	if(session.getAttribute("ss")==null)//chua tao bien session
    	    session.setAttribute("ss", (long)0);//tao bien session:ss
    	String tamn=request.getParameter("txtn");
     	 if(tamn!=null){
     		 //b1: gan sesion vao bien
     		 long s=(long) session.getAttribute("ss");
			 //b2 thay doi gia tri cua bien
    		  s=s +Long.parseLong(tamn);
     		 //b3: Luu bien vao session
     		 session.setAttribute("ss", s);
    	 }
    	%>
    		<form method="post" action="testSession.jsp">
             n: <input type="text" name="txtn" class="form-control"> <br>
            <input type="submit" name="but1" value="Tong"">
          	</form>
    	Tong:<%=session.getAttribute("ss")  %>
</body>
</html>