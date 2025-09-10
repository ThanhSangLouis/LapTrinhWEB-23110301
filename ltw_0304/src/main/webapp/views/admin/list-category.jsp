<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Quản lý danh mục</title>
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

      .sidebar-menu > li:hover .submenu,
      .sidebar-menu > li.active .submenu {
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

      /* Category management */
      .category-controls {
        background: #ecf0f1;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .category-title {
        font-size: 18px;
        font-weight: 600;
        color: #2c3e50;
      }

      .controls-group {
        display: flex;
        align-items: center;
        gap: 15px;
      }

      .records-select {
        padding: 8px 12px;
        border: 1px solid #bdc3c7;
        border-radius: 5px;
        background: white;
      }

      .search-box {
        padding: 8px 12px;
        border: 1px solid #bdc3c7;
        border-radius: 5px;
        width: 200px;
      }

      /* Table */
      .category-table {
        background: white;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      }

      table {
        width: 100%;
        border-collapse: collapse;
      }

      th {
        background: #f8f9fa;
        padding: 15px;
        text-align: left;
        font-weight: 600;
        color: #2c3e50;
        border-bottom: 2px solid #e9ecef;
      }

      td {
        padding: 15px;
        border-bottom: 1px solid #e9ecef;
        vertical-align: middle;
      }

      tr:hover {
        background: #f8f9fa;
      }

      .category-image {
        width: 60px;
        height: 60px;
        object-fit: cover;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }

      .action-links {
        display: flex;
        gap: 10px;
      }

      .btn {
        padding: 6px 12px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        font-size: 12px;
        font-weight: 500;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        gap: 5px;
      }

      .btn-edit {
        background: #3498db;
        color: white;
      }

      .btn-edit:hover {
        background: #2980b9;
        transform: translateY(-1px);
      }

      .btn-delete {
        background: #e74c3c;
        color: white;
      }

      .btn-delete:hover {
        background: #c0392b;
        transform: translateY(-1px);
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

        .category-controls {
          flex-direction: column;
          gap: 15px;
          align-items: stretch;
        }

        .controls-group {
          justify-content: space-between;
        }

        .search-box {
          width: auto;
          flex: 1;
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
            <a href="${pageContext.request.contextPath}/admin/home">
              <i
                class="fas fa-tachometer-alt"
                style="margin-right: 10px; color: #e74c3c"
              ></i>
              Dashboard
            </a>
          </li>
          <li class="active">
            <a href="#" class="active">
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
          <h2 class="page-title">Quản lý danh mục</h2>
          <p class="page-subtitle">Nơi bạn có thể quản lý danh mục của mình</p>
        </div>

        <div class="category-controls">
          <h3 class="category-title">Danh sách danh mục</h3>
          <div class="controls-group">
            <select class="records-select">
              <option value="10">10 records per page</option>
              <option value="25">25 records per page</option>
              <option value="50">50 records per page</option>
            </select>
            <input type="text" class="search-box" placeholder="Search..." />
          </div>
        </div>

        <div class="category-table">
          <table>
            <thead>
              <tr>
                <th>STT</th>
                <th>Hình ảnh</th>
                <th>Tên danh mục</th>
                <th>Hành động</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="cate" items="${cateList}" varStatus="st">
                <tr>
                  <td>${st.index + 1}</td>
                  <td>
                    <c:choose>
                      <c:when test="${cate.icon.startsWith('http')}">
                        <img
                          src="${cate.icon}"
                          alt="icon"
                          class="category-image"
                        />
                      </c:when>
                      <c:otherwise>
                        <img
                          src="${pageContext.request.contextPath}/uploads/${cate.icon}"
                          alt="icon"
                          class="category-image"
                        />
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td>
                    <strong>${cate.name}</strong>
                  </td>
                  <td>
                    <div class="action-links">
                      <a
                        href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.id}"
                        class="btn btn-edit"
                      >
                        <i class="fas fa-edit"></i> Sửa
                      </a>
                      <a
                        href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.id}"
                        class="btn btn-delete"
                        onclick="return confirm('Bạn có chắc muốn xóa danh mục này?')"
                      >
                        <i class="fas fa-trash"></i> Xóa
                      </a>
                    </div>
                  </td>
                </tr>
              </c:forEach>
              <c:if test="${empty cateList}">
                <tr>
                  <td
                    colspan="4"
                    style="text-align: center; padding: 40px; color: #7f8c8d"
                  >
                    <i
                      class="fas fa-inbox"
                      style="
                        font-size: 48px;
                        margin-bottom: 15px;
                        display: block;
                      "
                    ></i>
                    Chưa có danh mục nào.
                    <a
                      href="${pageContext.request.contextPath}/admin/category/add"
                      style="color: #3498db"
                      >Thêm danh mục đầu tiên</a
                    >
                  </td>
                </tr>
              </c:if>
            </tbody>
          </table>
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
            parent.classList.toggle("active");
          }
        });
      });

      // Search functionality
      document
        .querySelector(".search-box")
        .addEventListener("keyup", function () {
          const searchTerm = this.value.toLowerCase();
          const tableRows = document.querySelectorAll("tbody tr");

          tableRows.forEach((row) => {
            const categoryName = row
              .querySelector("td:nth-child(3)")
              .textContent.toLowerCase();
            if (categoryName.includes(searchTerm)) {
              row.style.display = "";
            } else {
              row.style.display = "none";
            }
          });
        });

      // Records per page functionality
      document
        .querySelector(".records-select")
        .addEventListener("change", function () {
          // This would typically be handled by server-side pagination
          console.log("Records per page changed to:", this.value);
        });
    </script>
  </body>
</html>
