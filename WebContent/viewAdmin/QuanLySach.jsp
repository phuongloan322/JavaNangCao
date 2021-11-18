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
            <h1 class="m-0">Quản lý Sách</h1>
            <p>${Loaisach.size()}</p>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
              <li class="breadcrumb-item active">Sách</li>
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
	
	
	<div class="float-left"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalThem">Thêm</button></div>
	<div class="float-right">
		<!-- <input class="form-control" type="text" placeholder="Search" aria-label="Search"> -->
		<form class="form-inline d-flex justify-content-center md-form form-sm active-cyan-2 mt-2">
		  <input class="form-control form-control-sm mr-3" type="text" placeholder="Search"
		    aria-label="Search" name="search">
		  <i class="fas fa-search" aria-hidden="true"></i>
		</form>
	</div>
	<br><br>
	<table class="table table-bordered" id="datatable">
	  <thead class="thead-CCFFFF">
	    <tr class="list-header">
	      <th scope="col">#</th>
	      <th scope="col" width="10%">Ảnh</th>
	      <th scope="col" width="25%">Chi tiết</th>
	      <th scope="col">Đơn giá</th>
	      <th scope="col">Số lượng</th>
	      <th scope="col">Ngày nhập</th>
	      <th scope="col">Chức năng</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach  items="${Sachlist}" var="sach">
	  
		  	<tr class="tr-hover">
		      <th scope="row"><input type="checkbox" name="vehicle1" value="Bike"></th>
		      <td>
		      		<a href="#"><img
					src="<c:url value="/asset/${sach.anh }" />"
					width="100px"></a>
			  </td>
		      <td>
		      		<b class="tensach">${sach.tensach}</b><br>
		      		Mã sách: ${sach.masach} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      		Mã loại: ${sach.maloai }<br>
		      		Số tập:  ${sach.sotap }	<br>
		      		Tác giả: <i> ${sach.tacgia }</i><br>
		      </td>
		      <td><fmt:formatNumber type="number" groupingUsed="true" value="${sach.gia}" />đ</td>
		      <td><fmt:formatNumber type="number" groupingUsed="true" value="${sach.soluong}" /></td>
		      <td>${sach.ngaynhap }</td>
		     <td>
		    	 <a href="<%=request.getContextPath()%>/FindById?item=${sach.masach}" type="button" class="btn btn-warning suaMenu" id="editButton">
					Cập nhật
				 </a>
		     	 <a href="<%=request.getContextPath()%>/QuanLySach?kt=Delete&itemDelete=${sach.masach}" type="button" class="btn btn-danger"id="deleteButton">Xóa</a> 
		  		
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
	        <h5 class="modal-title" id="exampleModalLabel">Thêm Sách</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<%=request.getContextPath() %>/QuanLySach?kt=Add" method="post" enctype= "multipart/form-data">
	        
	        	<div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Mã sách</label>
				    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="masach">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Tên sách</label>
				    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="tensach">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Ảnh:</label>
				    <input type="file" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="anh" stye="padding-left:-7px" accept="image/*">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Tác giả</label>
				    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="tacgia">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Số tập</label>
				    <input type="number" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="sotap">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Đơn giá</label>
				    <input type="text" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="gia">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Số lượng</label>
				    <input type="number" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="soluong">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Ngày nhập</label>
				    <input type="datetime-local" class="form-control-file col-sm-8" id="exampleFormControlFile1" name="ngaynhap">
				  	 </div>
				  
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Mã loại</label>
				    <select class="form-control" id="exampleFormControlSelect1" name="maloai">
					    <c:forEach items="${Loailist}" var="loai">
					    	<option value="${loai.maloai}">${loai.maloai}</option>
					    </c:forEach>
				    </select>
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
	        <h5 class="modal-title" id="exampleModalLabel">Thông tin Sách</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<%=request.getContextPath()%>/QuanLySach?kt=Edit" method="post">
	        
	        	<div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Mã sách</label>
				    <input type="text" class="form-control-file col-sm-8" id="masach" name="masach"  readonly>
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Tên sách</label>
				    <input type="text" class="form-control-file col-sm-8" id="tensach" name="tensach" >
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Ảnh:</label>
				    <input type="text" class="form-control-file col-sm-8" id="anh" name="anh">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Tác giả</label>
				    <input type="text" class="form-control-file col-sm-8" id="tacgia" name="tacgia">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Số tập</label>
				    <input type="number" class="form-control-file col-sm-8" id="sotap" name="sotap">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Đơn giá</label>
				    <input type="text" class="form-control-file col-sm-8" id="gia" name="gia">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Số lượng</label>
				    <input type="number" class="form-control-file col-sm-8" id="soluong" name="soluong">
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Ngày nhập</label>
				    <input type="datetime-local" class="form-control-file col-sm-8" id="ngaynhap" name="ngaynhap">
				  	 </div>
				   
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Mã loại</label>
				    <select class="form-control" id="exampleFormControlSelect1" name="maloai">
					    <c:forEach items="${Loailist}" var="loai">
					    	<option value="${loai.maloai}">${loai.maloai}</option>
					    </c:forEach>
				    </select>
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
			 $.get(href, function(sachInfor, status){
				$('#masach').val(sachInfor.masach);
				$('#tensach').val(sachInfor.tensach);
				$('#soluong').val(sachInfor.soluong);
				$('#tacgia').val(sachInfor.tacgia);
				$('#gia').val(sachInfor.gia);
				$('#sotap').val(sachInfor.sotap);
				$('#anh').val(sachInfor.anh);
				$('#maloai').val(sachInfor.maloai);
				var s = sachInfor.ngaynhap;
		        var st = s.substring(0,10) + "T" + s.substring(11);
		        $('#ngaynhap').val(st);
		        Console.log(st);
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

    