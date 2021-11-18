<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/templates/admin/inc/header.jsp" %>

  <!-- Main Sidebar Container -->
  <%@include file="/templates/admin/inc/menu.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Quản lý Khách Hàng</h1>
            <p>${Loaisach.size()}</p>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
              <li class="breadcrumb-item active">Khách Hàng</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
    <div class="container-fluid">
	<%@include file="/viewAdmin/message.jsp" %>
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalThem">Thêm</button>
	<br><br>
	<table class="table table-bordered" id="datatable">
	  <thead class="thead-CCFFFF">
	    <tr class="list-header">
	      <th scope="col">#</th>
	      <th scope="col">Mã khách</th>
	      <th scope="col">Họ tên</th>
	      <th scope="col">Địa chỉ</th>
	      <th scope="col">Số điện thoại</th>
	      <th scope="col">Email</th>
	      <th scope="col">Tên đăng nhập</th>
	      <th scope="col">Chức năng</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach  items="${Acclist}" var="account">
	  
		  	<tr class="tr-hover">
		      <th scope="row"><input type="checkbox" name="vehicle1" value="Bike"></th>
		      <td>${account.makh }</td>
		      <td>${account.hoten }</td>
		      <td>${account.diachi }</td>
		      <td>${account.sodt }</td>
		      <td>${account.email }</td>
		      <td>${account.username }</td>
		       <td>
			    	 <%-- <a href="<%=request.getContextPath()%>/FindById?itemLoai=${loai.maloai}" type="button" class="btn btn-warning suaMenu" id="editButton">
						Cập nhật
					 </a> --%>
			     	 <a href="<%=request.getContextPath()%>/QuanLyKhachHang?kt=Delete&itemDeleteKhachHang=${account.makh}" type="button" class="btn btn-danger"id="deleteButton">Xóa</a> 
			  		
			  	</td>
		    </tr>
		    
	  </c:forEach>
		
	  </tbody>
	</table>
	
			      	
      </div><!-- /.container-fluid -->
    </section>

<!-- Modal ADD-->
	<div class="modal fade" id="modalThem" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Thêm Khách hàng</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<%=request.getContextPath() %>/QuanLyKhachHang?kt=Add" method="post">
	        
	        	<div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Tên đăng nhập</label>
				    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="username" required>
				  	<p>${ExistsUsername }</p>
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Họ tên</label>
				    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="hoten" required>
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Địa chỉ</label>
				    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="diachi" required>
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Số điện thoại</label>
				    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="sodt" required>
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Email</label>
				    <input type="email" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="email" required>
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Password</label>
				    <input type="password" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="password" required>
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Re-password</label>
				    <input type="password" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="repassword"required>
				  </div>
				  
				<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
			        <button type="submit" class="btn btn-primary">Thêm</button>
			      </div>        
	        </form>
	      </div>
	    </div>
	  </div>
	</div>

 <!-- DELETE MODAL -->
 
 <div class="modal" id="deleteModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Confirm Delete</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>Are you sure you want to delete this record?</p>
	      </div>
	      <div class="modal-footer">
	        <a class="btn btn-primary" id="confirmDeleteButton" href="">Yes, delete</a>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
	      </div>
	    </div>
	  </div>
	</div>
	
 <!-- JAVASCRIPT -->
 
 <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
 <script type="text/javascript">
  $(document).ready(function(){
	  $('table #deleteButton').on('click', function() {
			event.preventDefault();
			var href = $(this).attr('href');
			$('#confirmDeleteButton').attr('href', href);
			$('#deleteModal').modal();
		});
  });	  
</script>
  
  
<%@include file="/templates/admin/inc/footer.jsp" %>

    