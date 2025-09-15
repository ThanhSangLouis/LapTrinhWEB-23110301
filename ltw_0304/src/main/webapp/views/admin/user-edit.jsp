<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Sửa người dùng</title>
</head>
<body>
    <h2>Sửa người dùng</h2>
    <form action="${pageContext.request.contextPath}/admin/user/edit" method="post">
        <input type="hidden" name="id" value="${user.id}"/>
        <label>UserName:</label><input type="text" name="userName" value="${user.userName}" required/><br/>
        <label>FullName:</label><input type="text" name="fullName" value="${user.fullName}" required/><br/>
        <label>Email:</label><input type="email" name="email" value="${user.email}" required/><br/>
        <label>Password:</label><input type="password" name="passWord" value="${user.passWord}" required/><br/>
        <label>Role:</label>
        <select name="roleid">
            <option value="1" ${user.roleid == 1 ? 'selected' : ''}>Người dùng</option>
            <option value="2" ${user.roleid == 2 ? 'selected' : ''}>Admin</option>
        </select><br/>
        <label>Phone:</label><input type="text" name="phone" value="${user.phone}"/><br/>
        <button type="submit">Cập nhật</button>
        <a href="${pageContext.request.contextPath}/admin/user/list">Quay lại</a>
    </form>
</body>
</html>
