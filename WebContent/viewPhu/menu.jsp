<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="tc.jsp">Trang chủ</a></li>
      <li><a href="giohang.jsp">Giỏ hàng</a></li>
      <li><a href="tt.jsp">Thanh toán</a></li>
      <li><a href="lichsu.jsp">Lịch sử mua hàng</a></li>
    </ul>
	<ul class="nav navbar-nav navbar-right">
	      <li><a href="#" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
	      		<span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
	      <li><a href="#" data-toggle="modal" data-target="#myModall">
	      	 <% String kt =request.getParameter("kt");
	      			if(kt!=null && kt.equals("1")) {
	      		%>
	      		<a href="">Xin chào: <%=request.getParameter("un") %></a>
	      		<%} else { %>
	           	<span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
	           	<% if(kt!=null && kt.equals("0")){ %>
	           		<script>alert("Đăng nhập sai!");</script>
	           		<%}} %> 
	    </ul>
  </div>
</nav>

  
  
 
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header" style=background-color:blue>
          <button type="button" class="close" style= color:white data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style= color:white>Đăng ký tài khoản</h4>
        </div>
  <div class="modal-body">
          <form method="post" action="ktdn.jsp">
          <a><button type="button" class="dkfb" style=background-color:rgb>Đăng ký bằng Facebook</button></a>
			<p  style=text-align:center;>Hoặc</p>
             <input type="text" name="txtun" placeholder="Nhập họ và tên" value=""><br><br>
              <input type="text" name="txtun" placeholder="Nhập Username" value=""><br><br>
             <input type="password" name="txtpass" placeholder="Nhập mật khẩu" value=""><br><br> 
             <input type="password" name="txtpass" placeholder="Nhập lại mật khẩu" value=""><br><br>
              <input type="email" name="txtpass" placeholder="Nhập địa chỉ email" value=""><br><br>
              <input type="email" name="txtpass" placeholder="Nhập lại địa chỉ email" value=""><br><br>
             <select name="sqg">
                  	<option selected>
                  		Giới tính
                  	</option>
                  	<option >
                  		Nữ
                  	</option>
                  	<option>
                  		Nam
                  	</option>
                  	
                  </select>
                  <br><br>
             
                  <select name="sqg">
                  	<option selected>
                  		Ngày sinh
                  	</option>       	
                  </select>
                  <br><br>
                  <select name="sqg">
                  	<option selected>
                  		Tháng 
                  	</option>       	
                  </select>
                  <br><br>
                  <select name="sqg">
                  	<option selected>
                  		Năm sinh
                  	</option>       	
                  </select>
                  <br><br>
                  <select name="sqg">
                  	<option selected>
                  		Tỉnh
                  	</option>       	
                  </select>
                  <br><br>
                
               <input type="text" name="txtmxn" placeholder="Nhập mã xác nhận" value=""><br><br>
             <input name="but1" type="submit" value="Đăng ký" class="btn-primary">
         </form>
        </div>
      
      </div>
    </div>
  </div>
  
  <!-- Modal -->
   
  <div class="modal fade" id="myModall" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng nhập hệ thống</h4>
        </div>
  <div class="modal-body">
          <form method="post" action="ktdn.jsp">
             <label> Tên đăng nhập: </label>
             <input name="txtun" type="text" class="form-control">
             <label> Mật khẩu: </label>
             <input name="txtpass" type="password" class="form-control">
             <input name="but1" type="submit" value="Đăng nhập" class="btn-primary">
         </form>
        </div>
      
      </div>
    </div>
  </div>
  
  
  
</body>
</html>