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
            <h1 class="m-0">Quản lý Loại sách</h1>
            <p>${Loaisach.size()}</p>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
              <li class="breadcrumb-item active">Loại sách</li>
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
	      <th scope="col">Mã loại</th>
	      <th scope="col">Tên loại</th>
	      <th scope="col">Chức năng</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach  items="${Loailist}" var="loai">
	  
		  	<tr class="tr-hover">
			     <th scope="row"><input type="checkbox" name="vehicle1" value="Bike"></th>
			     <td>${loai.maloai }</td>
			     <td>${loai.tenloai}</td>
			     <td>
			    	 <a href="<%=request.getContextPath()%>/FindById?itemLoai=${loai.maloai}" type="button" class="btn btn-warning suaMenu" id="editButton">
						Cập nhật
					 </a>
			     	 <a href="<%=request.getContextPath()%>/QuanLyLoaiSach?kt=Delete&itemDeleteLoai=${loai.maloai}" type="button" class="btn btn-danger"id="deleteButton">Xóa</a> 
			  		
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
	        <h5 class="modal-title" id="exampleModalLabel">Thêm loại Sách</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<%=request.getContextPath() %>/QuanLyLoaiSach?kt=Add" method="post">
	        
	        	<div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Mã loại</label>
				    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="maloai">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Tên loại</label>
				    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="tenloai">
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
	
<!-- MODAL EDIT -->	

	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Thông tin Loại sách</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<%=request.getContextPath()%>/QuanLyLoaiSach?kt=Edit" method="post">
	        
	        	<div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Mã loại</label>
				    <input type="text" class="form-control-file col-sm-8" id="maloai" name="maloai"  readonly>
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Tên loại</label>
				    <input type="text" class="form-control-file col-sm-8" id="tenloai" name="tenloai" >
				  </div>
				  
				<div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Thoát</button>
			        <button type="submit" class="btn btn-primary">Cập nhật</button>
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
	  
	  $('table #editButton').on('click', function(event){
			event.preventDefault();
			
			var href= $(this).attr('href')
			 $.get(href, function(loaiInfor, status){
				$('#maloai').val(loaiInfor.maloai);
				$('#tenloai').val(loaiInfor.tenloai);
			});  
			
			$('#editModal').modal();
		});
	  $('table #deleteButton').on('click', function() {
			event.preventDefault();
			var href = $(this).attr('href');
			$('#confirmDeleteButton').attr('href', href);
			$('#deleteModal').modal();
		});
  });	  
</script>
  
  
<%@include file="/templates/admin/inc/footer.jsp" %>

    