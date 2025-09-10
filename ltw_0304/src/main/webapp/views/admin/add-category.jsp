<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Thêm danh mục mới</title>
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
        max-height: 200px;
        overflow: hidden;
      }

      .submenu li a {
        color: #bdc3c7;
        text-decoration: none;
        padding: 12px 40px;
        display: block;
        font-size: 14px;
        transition: all 0.3s ease;
      }

      .submenu li a:hover,
      .submenu li a.active {
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

      /* Form */
      .form-container {
        background: white;
        border-radius: 10px;
        padding: 30px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      }

      .form-group {
        margin-bottom: 25px;
      }

      .form-label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: #2c3e50;
        font-size: 14px;
      }

      .form-input {
        width: 100%;
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 14px;
        transition: all 0.3s ease;
        background: #fff;
      }

      .form-input:focus {
        outline: none;
        border-color: #3498db;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
      }

      .file-input-wrapper {
        position: relative;
        display: inline-block;
        width: 100%;
      }

      .file-input {
        position: absolute;
        opacity: 0;
        width: 100%;
        height: 100%;
        cursor: pointer;
      }

      .file-input-display {
        display: flex;
        align-items: center;
        padding: 12px 15px;
        border: 2px dashed #ddd;
        border-radius: 8px;
        background: #f8f9fa;
        cursor: pointer;
        transition: all 0.3s ease;
      }

      .file-input-display:hover {
        border-color: #3498db;
        background: #e3f2fd;
      }

      .file-input-icon {
        margin-right: 10px;
        color: #3498db;
        font-size: 20px;
      }

      .file-input-text {
        color: #666;
        font-size: 14px;
      }

      .preview-container {
        margin-top: 15px;
        padding: 15px;
        border: 1px solid #e9ecef;
        border-radius: 8px;
        background: #f8f9fa;
        display: none;
      }

      .preview-image {
        max-width: 200px;
        max-height: 200px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      }

      .form-buttons {
        display: flex;
        gap: 15px;
        margin-top: 30px;
      }

      .btn {
        padding: 12px 30px;
        border: none;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 8px;
        transition: all 0.3s ease;
      }

      .btn-primary {
        background: #3498db;
        color: white;
      }

      .btn-primary:hover {
        background: #2980b9;
        transform: translateY(-2px);
        box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
      }

      .btn-secondary {
        background: #95a5a6;
        color: white;
      }

      .btn-secondary:hover {
        background: #7f8c8d;
        transform: translateY(-2px);
      }

      .alert {
        padding: 15px;
        margin-bottom: 20px;
        border: 1px solid transparent;
        border-radius: 8px;
      }

      .alert-success {
        color: #155724;
        background-color: #d4edda;
        border-color: #c3e6cb;
      }

      .alert-danger {
        color: #721c24;
        background-color: #f8d7da;
        border-color: #f5c6cb;
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

        .form-buttons {
          flex-direction: column;
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
                <a
                  href="${pageContext.request.contextPath}/admin/category/add"
                  class="active"
                >
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
          <h2 class="page-title">Thêm danh mục mới</h2>
          <p class="page-subtitle">Tạo danh mục mới cho hệ thống</p>
        </div>

        <!-- Alert messages -->
        <c:if test="${not empty message}">
          <div class="alert alert-success">
            <i class="fas fa-check-circle" style="margin-right: 8px"></i>
            ${message}
          </div>
        </c:if>

        <c:if test="${not empty error}">
          <div class="alert alert-danger">
            <i class="fas fa-exclamation-circle" style="margin-right: 8px"></i>
            ${error}
          </div>
        </c:if>

        <div class="form-container">
          <form
            action="${pageContext.request.contextPath}/admin/category/add"
            method="post"
            enctype="multipart/form-data"
          >
            <div class="form-group">
              <label class="form-label">
                <i class="fas fa-tag" style="margin-right: 5px"></i>
                Tên danh mục *
              </label>
              <input
                type="text"
                name="name"
                class="form-input"
                placeholder="Nhập tên danh mục..."
                required
                value="${param.name}"
              />
            </div>

            <div class="form-group">
              <label class="form-label">
                <i class="fas fa-image" style="margin-right: 5px"></i>
                Hình ảnh danh mục
              </label>
              <div class="file-input-wrapper">
                <input
                  type="file"
                  name="icon"
                  class="file-input"
                  accept="image/*"
                  id="imageInput"
                />
                <div class="file-input-display">
                  <i class="fas fa-cloud-upload-alt file-input-icon"></i>
                  <span class="file-input-text"
                    >Chọn file hình ảnh (JPG, PNG, GIF)</span
                  >
                </div>
              </div>
              <div class="preview-container" id="previewContainer">
                <p style="margin-bottom: 10px; font-weight: 600">Xem trước:</p>
                <img id="previewImage" class="preview-image" alt="Preview" />
              </div>
            </div>

            <div class="form-buttons">
              <button type="submit" class="btn btn-primary">
                <i class="fas fa-plus"></i>
                Thêm danh mục
              </button>
              <a
                href="${pageContext.request.contextPath}/admin/category/list"
                class="btn btn-secondary"
              >
                <i class="fas fa-arrow-left"></i>
                Quay lại danh sách
              </a>
            </div>
          </form>
        </div>
      </div>
    </div>

    <script>
      // File input preview
      document
        .getElementById("imageInput")
        .addEventListener("change", function (e) {
          const file = e.target.files[0];
          const previewContainer = document.getElementById("previewContainer");
          const previewImage = document.getElementById("previewImage");
          const fileInputText = document.querySelector(".file-input-text");

          if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
              previewImage.src = e.target.result;
              previewContainer.style.display = "block";
            };
            reader.readAsDataURL(file);

            fileInputText.textContent = file.name;
          } else {
            previewContainer.style.display = "none";
            fileInputText.textContent = "Chọn file hình ảnh (JPG, PNG, GIF)";
          }
        });

      // Form validation
      document.querySelector("form").addEventListener("submit", function (e) {
        const nameInput = document.querySelector('input[name="name"]');

        if (!nameInput.value.trim()) {
          e.preventDefault();
          alert("Vui lòng nhập tên danh mục!");
          nameInput.focus();
        }
      });
    </script>
  </body>
</html>
