<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <%@include file="/views/header/head.jsp" %>
</head><!--/head-->

<body style="background: #fff">
	<%@include file="/views/header/header.jsp" %>
	
	<%
		Sachbean sachbean = null;
		Loaibean loaibean = null;
		if(request.getAttribute("itemSach")!=null) {
			sachbean = (Sachbean)request.getAttribute("itemSach");
		}
		if(request.getAttribute("itemLoai")!=null) {
			loaibean = (Loaibean)request.getAttribute("itemLoai");
		}	
	%>
	<section class="detail">
        <div class="container">
        	<%@include file="/views/CategorySach.jsp" %>
        	<div class="col-sm-9 tieudeDetail">
				<div class="breadcrumb" style="margin-left: -15px;">
					  <li>TRANG CHỦ</li>
					  <li><%=loaibean.getTenloai() %></li>
					  <li><%=sachbean.getTensach() %></li>
				</div>
			</div>
        	<div class="col-sm-9 pull-right chitietanh">
        		<div class="">
        			<div class="left1">
		                <img src="<%=request.getContextPath()%>/asset/<%=sachbean.getAnh() %>" alt="<%=sachbean.getTensach() %>" width="230px" height="250px">
		            </div>
		            <div class="left2">
		                <div>
		                    <h2><%=sachbean.getTensach() %></h2>
		                    <p>Tác giả: <%=sachbean.getTacgia() %></p>
		                    <p>Nhà xuất bản: NXB Kim Đồng</p>
		                    <p>Thể loại: <%=loaibean.getTenloai() %></p>
		                    <p>Hình thức bìa: Bìa mềm</p>
		                    <p class="dongia"><%=sachbean.getGia() %>đ</p>
		                    <p>Chính sách đổi trả: Đổi trả trong vòng 30 ngày</p>
		                </div>
		                <div class="nut">
		                    <a class="themgiohang" href="<%=request.getContextPath() %>/Cart?AddCart=1&itemCart=<%=sachbean.getMasach()%>">
		                        <i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng
		                    </a>
		                    <a class="muangay" href="v">
		                        Mua ngay
		                    </a>
		                </div>
		            </div>
        		</div>
        	</div>
            
        </div>
    </section>
</body>
</html>