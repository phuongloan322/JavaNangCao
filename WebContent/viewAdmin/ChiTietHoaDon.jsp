<%@page import="beanAdmin.ChiTietDonHangbean"%>
<%@page import="bean.ChiTietHoaDon"%>
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
            <h1 class="m-0">Thông tin Chi tiết hóa đơn</h1>
            
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
	<h5 style="padding-left:25px"><b>Mã hóa đơn</b> : ${ChiTietDonHang[0].mahoadon }</h5>
	<h5 style="padding-left:25px"><b>Họ tên</b> : ${ChiTietDonHang[0].hoten }</h5>
	<%-- <%long Tong = 0, soluong = 0; 
	List<ChiTietDonHangbean> ds = (List<ChiTietDonHangbean>)request.getAttribute("ChiTietDonHang");
	 for(ChiTietDonHangbean chitiet : ds){
		 Tong += chitiet.getTongtien();
		 soluong += chitiet.getSoluongmua();
	 }
	 %>
	<h5 style="padding-left:25px"><b>Tổng số lượng mua</b> : <%=soluong %></h5> 
	<h5 style="padding-left:25px"><b>Tổng hóa đơn</b> : <fmt:formatNumber type="number" groupingUsed="true" value="<%=Tong %>" />đ</h5>  --%>
    <!-- Main content -->
    <section class="content">
    <div class="container-fluid">

	
	<br><br>
	<table class="table table-bordered" id="datatable">
	  <thead class="thead-CCFFFF">
	    <tr class="list-header">
	      <th scope="col">#</th>
	      <th scope="col" width="5%">Mã CTHD</th>
	      <th scope="col">Họ tên</th>
	      <th scope="col" width="10%">Ảnh</th>
	      <th scope="col" width="18%">Chi tiết sản phẩm</th>
	      <th scope="col" width="5%">Số lượng</th>
	      <th scope="col">Tổng giá</th>
	      <th scope="col" width="10%">Ngày mua</th>
	      <th scope="col">Tình trạng</th>
	      <th scope="col">Chức năng</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach  items="${ChiTietDonHang}" var="chitiet">
	  
		  	<tr class="tr-hover">
			     <th scope="row"><input type="checkbox" name="vehicle1" value="Bike"></th>
			     <td>${chitiet.machitiet }</td>
			     <td>${chitiet.hoten }</td>
			     <td>
		      		<a href="#"><img
					src="<c:url value="/asset/${chitiet.anh }" />"
					width="100px"></a>
			  </td>
			      <td>
		      		<b class="tensach">${chitiet.tensach}</b><br>
		      		Tác giả: <i> ${chitiet.tacgia }</i><br>
		      		Đơn giá: <fmt:formatNumber type="number" groupingUsed="true" value="${chitiet.gia}" />đ 
		      </td>
			     <td>${chitiet.soluongmua}</td>
			     <td><fmt:formatNumber type="number" groupingUsed="true" value="${chitiet.tongtien}" />đ</td>
			     <td>${chitiet.ngaymua}</td>
			     
			     <td>
			     	
					 <c:choose>
					    <c:when test="${chitiet.damua == 'false'}">
					        <a href="<%=request.getContextPath()%>/ChiTietHoaDon?mahd=${chitiet.mahoadon }&xacnhan=${chitiet.machitiet}" type="button" class="btn btn-success suaMenu">
								Xác nhận
							 </a>
					        <br />
					    </c:when>    
					    <c:otherwise>
					        <a href="#" type="button" class="btn btn-primary suaMenu">
								Đã xác nhận
							 </a> 
					        <br />
					    </c:otherwise>
					</c:choose>
				</td>
			     <td>
			     	 <a href="<%=request.getContextPath()%>/FindById?itemchitiet=${chitiet.machitiet}" type="button" class="btn btn-warning suaMenu" id="editButton">
						Sửa
					 </a>
					 <c:if test="${chitiet.damua == 'false' }">
			     	 <a href="<%=request.getContextPath()%>/ChiTietHoaDon?kt=Delete&itemDeleteCTHD=${chitiet.machitiet}" type="button" class="btn btn-danger"id="deleteButton">Hủy</a> 
			  		 </c:if>
			  	</td>
		    </tr>
		    
	  </c:forEach>
	  </tbody>
	</table>
	
			      	
      </div><!-- /.container-fluid -->
    </section>

<!-- Modal EDIT-->
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Cập nhật Chi tiết đơn hàng</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action ="<%=request.getContextPath()%>/ChiTietHoaDon?kt=Edit" method="post">
	        
	        	<div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Mã CTHD</label>
				    <input type="text" class="form-control-file col-sm-8" id="machitiet" name="machitiet"  readonly>
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Mã sách</label>
				    <input type="text" class="form-control-file col-sm-8" id="masach" name="masach" readonly>
				  </div>
				  <div class="form-group row">
				    <label for="exampleFormControlFile1" class="col-sm-3">Số lượng mua</label>
				    <input type="number" class="form-control-file col-sm-8" id="soluong" name="soluong" focus>
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
			 $.get(href, function(chitietInfor, status){
				 $('#machitiet').val(chitietInfor.MaChiTietHD);
				 $('#masach').val(chitietInfor.MaSach);
				 $('#soluong').val(chitietInfor.SoLuongMua);
				
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

    