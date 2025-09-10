<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Admin Dashboard</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background: #f8f9fa;
        color: #333;
      }

      /* Header */
      .header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      }

      .header h1 {
        font-size: 24px;
        font-weight: 600;
      }

      .user-info {
        display: flex;
        align-items: center;
        gap: 15px;
      }

      .user-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.2);
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .logout-btn {
        background: #dc3545;
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 5px;
        text-decoration: none;
        font-size: 14px;
        transition: all 0.3s ease;
      }

      .logout-btn:hover {
        background: #c82333;
        transform: translateY(-1px);
      }

      /* Layout */
      .container {
        display: flex;
        min-height: calc(100vh - 70px);
      }

      /* Sidebar */
      .sidebar {
        width: 250px;
        background: #2c3e50;
        color: white;
        padding: 0;
        box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
      }

      .sidebar-profile {
        padding: 20px;
        text-align: center;
        border-bottom: 1px solid #34495e;
      }

      .profile-img {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 15px;
        font-size: 30px;
        color: white;
      }

      .profile-name {
        font-size: 16px;
        font-weight: 600;
        margin-bottom: 5px;
      }

      .profile-role {
        font-size: 12px;
        color: #bdc3c7;
      }

      .sidebar-menu {
        list-style: none;
        padding: 20px 0;
      }

      .sidebar-menu > li {
        margin-bottom: 5px;
      }

      .sidebar-menu > li > a {
        color: #ecf0f1;
        text-decoration: none;
        padding: 15px 20px;
        display: block;
        transition: all 0.3s ease;
        border-left: 3px solid transparent;
      }

      .sidebar-menu > li > a:hover,
      .sidebar-menu > li > a.active {
        background: #34495e;
        border-left-color: #3498db;
        transform: translateX(5px);
      }

      .sidebar-menu .submenu {
        background: #34495e;
        list-style: none;
        padding: 0;
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.3s ease;
      }

      .sidebar-menu > li:hover .submenu {
        max-height: 200px;
      }

      .submenu li a {
        color: #bdc3c7;
        text-decoration: none;
        padding: 12px 40px;
        display: block;
        font-size: 14px;
        transition: all 0.3s ease;
      }

      .submenu li a:hover {
        background: #3498db;
        color: white;
        transform: translateX(5px);
      }

      /* Main content */
      .main-content {
        flex: 1;
        padding: 30px;
      }

      .page-header {
        background: white;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        margin-bottom: 30px;
      }

      .page-title {
        color: #e74c3c;
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 8px;
      }

      .page-subtitle {
        color: #7f8c8d;
        font-size: 14px;
      }

      /* Dashboard cards */
      .dashboard-cards {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 20px;
        margin-bottom: 30px;
      }

      .dashboard-card {
        background: white;
        border-radius: 10px;
        padding: 25px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        transition: all 0.3s ease;
        cursor: pointer;
      }

      .dashboard-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
      }

      .card-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
      }

      .card-title {
        font-size: 18px;
        font-weight: 600;
        color: #2c3e50;
      }

      .card-icon {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 20px;
        color: white;
      }

      .card-icon.category {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      }

      .card-icon.product {
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
      }

      .card-icon.user {
        background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
      }

      .card-number {
        font-size: 36px;
        font-weight: 700;
        color: #2c3e50;
        margin-bottom: 10px;
      }

      .card-description {
        color: #7f8c8d;
        font-size: 14px;
      }

      .card-link {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        color: #3498db;
        text-decoration: none;
        font-size: 14px;
        font-weight: 500;
        margin-top: 15px;
        transition: all 0.3s ease;
      }

      .card-link:hover {
        color: #2980b9;
        transform: translateX(5px);
      }

      /* Quick actions */
      .quick-actions {
        background: white;
        border-radius: 10px;
        padding: 25px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      }

      .quick-actions h3 {
        color: #2c3e50;
        margin-bottom: 20px;
        font-size: 20px;
      }

      .actions-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 15px;
      }

      .action-btn {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 15px 20px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        text-decoration: none;
        border-radius: 8px;
        transition: all 0.3s ease;
        font-weight: 500;
      }

      .action-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
      }

      /* Responsive */
      @media (max-width: 768px) {
        .container {
          flex-direction: column;
        }

        .sidebar {
          width: 100%;
          height: auto;
        }

        .main-content {
          padding: 15px;
        }

        .dashboard-cards {
          grid-template-columns: 1fr;
        }

        .actions-grid {
          grid-template-columns: 1fr;
        }
      }
    </style>
  </head>
  <body>
    <!-- Header -->
    <div class="header">
      <h1>Dashboard</h1>
      <div class="user-info">
        <span>Xin chào Võ Thanh Sang - Gymer Quận 9</span>
        <div class="user-avatar">
          <i class="fas fa-user"></i>
        </div>
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn"
          >Đăng xuất</a
        >
      </div>
    </div>

    <div class="container">
      <!-- Sidebar -->
      <div class="sidebar">
        <div class="sidebar-profile">
          <div class="profile-img">
            <i class="fas fa-user-tie"></i>
          </div>
          <div class="profile-name">Võ Thanh Sang</div>
          <div class="profile-role">Gymer Quận 9</div>
        </div>

        <ul class="sidebar-menu">
          <li>
            <a
              href="${pageContext.request.contextPath}/admin/home"
              class="active"
            >
              <i
                class="fas fa-tachometer-alt"
                style="margin-right: 10px; color: #e74c3c"
              ></i>
              Dashboard
            </a>
          </li>
          <li>
            <a href="#">
              <i class="fas fa-folder-open" style="margin-right: 10px"></i>
              Quản lý Danh mục
            </a>
            <ul class="submenu">
              <li>
                <a href="${pageContext.request.contextPath}/admin/category/add">
                  <i class="fas fa-plus" style="margin-right: 8px"></i>
                  Thêm danh mục mới
                </a>
              </li>
              <li>
                <a
                  href="${pageContext.request.contextPath}/admin/category/list"
                >
                  <i class="fas fa-list" style="margin-right: 8px"></i>
                  Danh sách danh mục
                </a>
              </li>
            </ul>
          </li>
          <li>
            <a href="#">
              <i class="fas fa-box" style="margin-right: 10px"></i>
              Quản lý Sản phẩm
            </a>
          </li>
          <li>
            <a href="#">
              <i class="fas fa-user-friends" style="margin-right: 10px"></i>
              Quản lý Tài khoản
            </a>
          </li>
        </ul>
      </div>

      <!-- Main content -->
      <div class="main-content">
        <div class="page-header">
          <h2 class="page-title">Dashboard</h2>
          <p class="page-subtitle">
            Chào mừng bạn đến với trang quản trị hệ thống
          </p>
        </div>

        <!-- Dashboard cards -->
        <div class="dashboard-cards">
          <div class="dashboard-card">
            <div class="card-header">
              <div>
                <h3 class="card-title">Danh mục</h3>
              </div>
              <div class="card-icon category">
                <i class="fas fa-folder-open"></i>
              </div>
            </div>
            <div class="card-number">0</div>
            <div class="card-description">Tổng số danh mục trong hệ thống</div>
            <a
              href="${pageContext.request.contextPath}/admin/category/list"
              class="card-link"
            >
              Xem chi tiết <i class="fas fa-arrow-right"></i>
            </a>
          </div>

          <div class="dashboard-card">
            <div class="card-header">
              <div>
                <h3 class="card-title">Sản phẩm</h3>
              </div>
              <div class="card-icon product">
                <i class="fas fa-box"></i>
              </div>
            </div>
            <div class="card-number">0</div>
            <div class="card-description">Tổng số sản phẩm trong hệ thống</div>
            <a href="#" class="card-link">
              Xem chi tiết <i class="fas fa-arrow-right"></i>
            </a>
          </div>

          <div class="dashboard-card">
            <div class="card-header">
              <div>
                <h3 class="card-title">Người dùng</h3>
              </div>
              <div class="card-icon user">
                <i class="fas fa-user-friends"></i>
              </div>
            </div>
            <div class="card-number">0</div>
            <div class="card-description">Tổng số người dùng đã đăng ký</div>
            <a href="#" class="card-link">
              Xem chi tiết <i class="fas fa-arrow-right"></i>
            </a>
          </div>
        </div>

        <!-- Quick actions -->
        <div class="quick-actions">
          <h3>
            <i class="fas fa-bolt" style="margin-right: 8px; color: #f39c12"></i
            >Thao tác nhanh
          </h3>
          <div class="actions-grid">
            <a
              href="${pageContext.request.contextPath}/admin/category/add"
              class="action-btn"
            >
              <i class="fas fa-plus"></i>
              Thêm danh mục mới
            </a>
            <a
              href="${pageContext.request.contextPath}/admin/category/list"
              class="action-btn"
            >
              <i class="fas fa-list"></i>
              Quản lý danh mục
            </a>
            <a href="#" class="action-btn">
              <i class="fas fa-plus-circle"></i>
              Thêm sản phẩm mới
            </a>
            <a href="#" class="action-btn">
              <i class="fas fa-users-cog"></i>
              Quản lý tài khoản
            </a>
          </div>
        </div>
      </div>
    </div>

    <script>
      // Sidebar menu toggle
      document.querySelectorAll(".sidebar-menu > li > a").forEach((item) => {
        item.addEventListener("click", function (e) {
          const parent = this.parentNode;
          const submenu = parent.querySelector(".submenu");

          if (submenu) {
            e.preventDefault();
            // Remove active from all menu items
            document.querySelectorAll(".sidebar-menu > li").forEach((li) => {
              li.classList.remove("active");
            });
            // Add active to current menu item
            parent.classList.add("active");
          }
        });
      });

      // Dashboard card click animations
      document.querySelectorAll(".dashboard-card").forEach((card) => {
        card.addEventListener("click", function () {
          const link = this.querySelector(".card-link");
          if (link) {
            link.click();
          }
        });
      });
    </script>
  </body>
</html>
