<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Quản lý người dùng</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/global/css/components.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/global/plugins/font-awesome/css/font-awesome.min.css"
    />
    <style>
      table {
        width: 100%;
        border-collapse: collapse;
      }
      th,
      td {
        padding: 8px 12px;
        border: 1px solid #ddd;
      }
      th {
        background: #f5f5f5;
      }
      .action-btns a {
        margin: 0 4px;
      }
    </style>
  </head>
  <body>
    <h2>Quản lý người dùng</h2>
    <a
      href="${pageContext.request.contextPath}/admin/user/add"
      class="btn btn-success"
      ><i class="fa fa-plus"></i> Thêm người dùng</a
    >
    <br /><br />
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Email</th>
          <th>UserName</th>
          <th>FullName</th>
          <th>Role</th>
          <th>Phone</th>
          <th>Ngày tạo</th>
          <th>Avatar</th>
          <th>Hành động</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="user" items="${userList}">
          <tr>
            <td>${user.id}</td>
            <td>${user.email}</td>
            <td>${user.userName}</td>
            <td>${user.fullName}</td>
            <td>
              <c:choose
                ><c:when test="${user.roleid == 2}">Admin</c:when
                ><c:otherwise>Người dùng</c:otherwise></c:choose
              >
            </td>
            <td>${user.phone}</td>
            <td>${user.createdDate}</td>
            <td>
              <c:if test="${not empty user.avatar}">
                <img
                  src="${pageContext.request.contextPath}/uploads/${user.avatar}"
                  alt="avatar"
                  width="40"
                  height="40"
                  style="object-fit: cover; border-radius: 50%"
                />
              </c:if>
            </td>
            <td class="action-btns">
              <a
                href="${pageContext.request.contextPath}/admin/user/edit?id=${user.id}"
                class="btn btn-primary"
                ><i class="fa fa-pencil"></i> Sửa</a
              >
              <a
                href="${pageContext.request.contextPath}/admin/user/delete?id=${user.id}"
                class="btn btn-danger"
                onclick="return confirm('Bạn có chắc muốn xóa?');"
                ><i class="fa fa-trash"></i> Xóa</a
              >
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </body>
</html>
