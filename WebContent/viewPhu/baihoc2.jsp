<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<%
	 	Calendar c = Calendar.getInstance();
		int thu = c.get(Calendar.DAY_OF_WEEK);
		int ngay = c.get(Calendar.DAY_OF_MONTH);
		int thang = c.get(Calendar.MONTH) + 1;
		int nam = c.get(Calendar.YEAR);          	
    %>		
	<div align="right">
           <p>Thứ <%=thu %>, ngày <%=ngay %> tháng <%=thang %> năm <%=nam %></p>
    </div>
    Chọn ngày: 
    	<select name="sngay">
    		<%for(int i = 1; i <= 31; i++) {%>
	    			<option value="<%=i%>" <%=i==ngay?"selected":"" %>><%=i %></option>
	    		<%}%>
    	</select>
    tháng: 
    	<select name="sthang">
    		<%for(int i = 1; i <= 12; i++) {%>
	    			<option value="<%=i%>" <%= i==thang?"selected":"" %>><%=i %></option>
	    		<%}%>
    	</select>
     năm: 
    	<select name="snam">
    		<%for(int i = nam; i <= nam+10; i++) {%>
	    			<option value="<%=i%>"  <%= i==nam?"selected":"" %>><%=i %></option>
	    		<%}%>
    	</select>
	</div>
    
    <div class="container" align="center">
		  <h2>Bảng cửu chương</h2>           
		  <table class="table table-bordered">
		  	
		    <thead>
			      <tr>
				      	<%for(int i=1;i<=10;i++){ %>
				        	<th><%=i %></th>
				        <%} %>
			      </tr>
		    </thead>
		    <tbody>
			    <%for(int i=1;i<=10;i++){ %>
			      <tr>
			      	 <%for(int j=1;j<=10;j++){ %>
			        	<td><%=i %> x <%=j %> = <%=i*j %></td>
			         <%} %>
			      </tr>
			     
			    <%} %>
		    </tbody>
		  </table>
	</div>
</body>
</html>