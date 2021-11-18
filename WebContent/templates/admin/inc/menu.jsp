
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
   <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="<%=request.getContextPath()%>/admin/index" class="brand-link">
      <img src="<%=request.getContextPath() %>/templates/admin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">Nhà sách Minh Khai</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<%=request.getContextPath() %>/templates/admin/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="hoten" style="color: #fff;	padding: 7px;"> ${adminInfor.hoten}</div>
      </div>
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/QuanLySach" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Quản lý Sách
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/QuanLyLoaiSach" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Quản lý Loại sách
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/QuanLyDonHang" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Quản lý Đơn hàng
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/QuanLyKhachHang" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Quản lý Khách hàng
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Người dùng
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/taikhoan" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Tài khoản</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/admin/logout" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Đăng xuất</p>
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>