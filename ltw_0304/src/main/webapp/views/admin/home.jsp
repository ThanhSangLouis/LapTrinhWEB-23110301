<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ</title>
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
        .sidebar ul li ul li a {
            padding-left: 40px;
            font-size: 14px;
        }
        .content { margin-left: 220px; padding: 20px; }
    </style>
</head>
<body>

<div class="sidebar">
    <ul>
        <li>
            <a href="#">📂 Quản lý Danh mục</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/views/admin/add-category.jsp">➕ Thêm danh mục mới</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/category/list">📋 Danh sách danh mục</a></li>
            </ul>
        </li>
        <li>
            <a href="<%=request.getContextPath()%>/logout">🚪 Đăng xuất</a>
        </li>
    </ul>
</div>

<div class="content">
    <h2>Trang chủ</h2>
    <p>Đăng nhập thành công, chọn menu bên trái để thao tác.</p>
</div>

</body>
</html>
