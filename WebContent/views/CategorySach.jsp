<%@page import="bean.Loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.Loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Loaibo loaibo = new Loaibo();
	ArrayList<Loaibean> LoaiList = loaibo.getLoai();
%>
<div class="col-sm-3">
	<div class="left-sidebar">
		<div class=" category-products" id="accordian">
			<div class="panel panel-default">
				<div class="danhmuc">DANH MỤC SẢN PHẨM</div>
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordian" href="#womens">
							<span class="badge pull-right"><i class="fa fa-plus"></i></span>
							Womens
						</a>
					</h4>
				</div>
				<div id="womens" class="panel-collapse collapse">
					<div class="panel-body">
						<ul>
							<li><a href="#">Fendi</a></li>
						</ul>
					</div>
				</div>
			</div>
			<%
				for (Loaibean loai : LoaiList) {
			%>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="<%=request.getContextPath()%>/Sach?ml=<%=loai.getMaloai()%>"><%=loai.getTenloai()%></a>
					</h4>
				</div>
			</div>
			<%
				}
			%>


		</div>
	</div>
</div>