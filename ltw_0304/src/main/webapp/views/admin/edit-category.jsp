<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa danh mục</title>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; }
        .sidebar {
            width: 220px;
            height: 100vh;
            background: #111;
            color: #fff;
            float: left;
        }
        .sidebar h3 {
            padding: 20px;
            margin: 0;
            background: #000;
        }
        .sidebar ul { list-style: none; padding: 0; margin: 0; }
        .sidebar ul li { border-bottom: 1px solid #333; }
        .sidebar ul li a {
            display: block;
            color: #fff;
            padding: 12px 20px;
            text-decoration: none;
        }
        .sidebar ul li a:hover { background: #0d6efd; }
        .sidebar ul li ul { background: #0d6efd; }
        .sidebar ul li ul li a { padding-left: 40px; font-size: 14px; }

        .content { margin-left: 220px; padding: 20px; }
        .form-section {
            max-width: 400px;
            background: #f9f9f9;
            padding: 20px;
            border-radius: 6px;
            border: 1px solid #ddd;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"],
        input[type="file"] {
            width: 100%;
            padding: 6px;
            margin-top: 4px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        img.preview {
            width: 100px;
            margin-top: 10px;
            display: block;
        }
        .form-buttons {
            margin-top: 20px;
        }
        .form-buttons button {
            padding: 8px 16px;
            margin-right: 10px;
            border: none;
            border-radius: 4px;
            background-color: #0d6efd;
            color: white;
            cursor: pointer;
        }
        .form-buttons button[type="reset"] {
            background-color: #ccc;
            color: #000;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <ul>
        <li>
            <a href="#">📂 Quản lý Danh mục</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/category/add">➕ Thêm danh mục mới</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/category/list">📋 Danh sách danh mục</a></li>
            </ul>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/logout">🚪 Đăng xuất</a>
        </li>
    </ul>
</div>

<div class="content">
    <h2>Sửa danh mục</h2>
    <div class="form-section">
        <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${category.id}" />

            <label>Tên danh mục:</label>
            <input type="text" name="name" value="${category.name}" required />

            <label>Ảnh đại diện:</label>
            <input type="file" name="icon" accept="image/*" />

            <c:if test="${not empty category.icon}">
                <img src="${pageContext.request.contextPath}/images/${category.icon}" alt="icon hiện tại" class="preview" />
            </c:if>

            <div class="form-buttons">
                <button type="submit">Cập nhật</button>
                <button type="reset">Làm lại</button>
            </div>
        </form>
    </div>
    <br/>
    <a href="${pageContext.request.contextPath}/admin/category/list">← Quay lại danh sách</a>
</div>

</body>
</html>
