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
            <h1 class="m-0">Quản lý Đơn hàng</h1>
            <p>${Loaisach.size()}</p>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
              <li class="breadcrumb-item active">Đơn hàng</li>
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
	
	<br><br>
	<table class="table table-bordered" id="datatable">
	  <thead class="thead-CCFFFF">
	    <tr class="list-header">
	      <th scope="col">#</th>
	      <th scope="col">Mã hóa đơn</th>
	      <th scope="col">Họ tên</th>
	      <th scope="col">Ngày mua</th>
	      <th scope="col">Số lượng</th>
	      <th scope="col">Thành tiền</th>
	      <th scope="col">Tình trạng</th>
	      <th scope="col">Chức năng</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach  items="${DonHanglist}" var="donhang">
	  
		  	<tr class="tr-hover">
			     <th scope="row"><input type="checkbox" name="vehicle1" value="Bike"></th>
			     <td>${donhang.mahoadon }</td>
			     <td>${donhang.hoten }</td>
			     <td>${donhang.ngaymua }</td>
			     <td>${donhang.soluongmua}</td>
			     <td><fmt:formatNumber type="number" groupingUsed="true" value="${donhang.thanhtien}" />đ</td>
			     <td>
			     	<a href="<%=request.getContextPath()%>/QuanLyDonHang?xacnhan=${donhang.mahoadon}" type="button" class="btn btn-success suaMenu">
						Xác nhận
					 </a>
				</td>
			     <td>
			    	 <a href="<%=request.getContextPath()%>/ChiTietHoaDon?mahoadon=${donhang.mahoadon}" type="button" class="btn btn-warning suaMenu" id="editButton">
						Xem
					 </a>
			     	 <a href="<%=request.getContextPath()%>/QuanLyDonHang?delete=${donhang.mahoadon}" type="button" class="btn btn-danger"id="deleteButton">Hủy</a> 
			  		
			  	</td>
		    </tr>
		    
	  </c:forEach>
	  <c:forEach  items="${DonHangXacNhanlist}" var="donhang">
	  
		  	<tr class="tr-hover">
			     <th scope="row"><input type="checkbox" name="vehicle1" value="Bike"></th>
			     <td>${donhang.mahoadon }</td>
			     <td>${donhang.hoten }</td>
			     <td>${donhang.ngaymua }</td>
			     <td>${donhang.soluongmua}</td>
			     <td><fmt:formatNumber type="number" groupingUsed="true" value="${donhang.thanhtien}" />đ</td>
			     <td>
			     	<a href="<%=request.getContextPath()%>/QuanLyDonHang?daxacnhan=${donhang.mahoadon}" type="button" class="btn btn-primary suaMenu">
						Đã xác nhận
					 </a>
				</td>
			     <td>
			    	 <a href="<%=request.getContextPath()%>/ChiTietHoaDon?mahoadon=${donhang.mahoadon}" type="button" class="btn btn-warning suaMenu" id="editButton">
						Xem
					 </a>
			     	 
			  	</td>
		    </tr>
		    
	  </c:forEach>
		
	  </tbody>
	</table>
	
			      	
      </div><!-- /.container-fluid -->
    </section>

<!-- Modal ADD-->
	
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

    