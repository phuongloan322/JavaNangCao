<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="Sach_header.jsp" %>   
<head>
<title>Giỏ hàng</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/user/css/bootstrap_styleb.css">
<script src="https://kit.fontawesome.com/yourcode.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="row">
	<div class="span12">
	<div class="well well-small">
		<h2>Giỏ hàng <small class="pull-right"> ${ TotalQuantyCart } Sản phẩm trong giỏ hàng </small></h2>
	<hr class="soften"/>	

	<table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th>Hình ảnh</th>
                  <th>Mô tả</th>
                  <th>Màu sắc</th>
                  <th>Giá bán</th>
                  <th>Số lượng </th>
                  <th>Chỉnh sửa </th>
                  <th>Xóa </th>
                  <th>Tổng tiền</th>
				</tr>
              </thead>
              <tbody>
              
				
                
				</tbody>
            </table><br/>
			
	<a href=""  class="shopBtn btn-large"><span class="icon-arrow-left"></span> Tiếp tục mua sắm </a>
	<a href="" class="shopBtn btn-large pull-right">Thanh toán <span class="icon-arrow-right"></span></a>

</div>
</div>
</div>

<content tag="script">
	<script>
	$(".edit-cart").on("click", function() {
		var id=$(this).data("a");
		var quanty = $("#quanty-cart-"+id).val();
		window.location = "EditCart/"+id+"/"+quanty;
	});
</script>
</content>

</body>