<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách danh mục</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        table, th, td { border: 1px solid #ccc; }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th { background: #f0f0f0; }
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
    <h2>Danh sách danh mục</h2>
    <table>
        <tr>
            <th>STT</th>
            <th>Icon</th>
            <th>Tên</th>
            <th>Hành động</th>
        </tr>
        <c:forEach var="cate" items="${cateList}" varStatus="st">
            <tr>
                <td>${st.index + 1}</td>
                <td><img src="${pageContext.request.contextPath}/images/${cate.icon}" alt="icon" width="40" /></td>
                <td>${cate.name}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/category/edit?id=${cate.id}">Sửa</a> |
                    <a href="${pageContext.request.contextPath}/admin/category/delete?id=${cate.id}" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
