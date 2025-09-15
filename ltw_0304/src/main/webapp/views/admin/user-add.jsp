<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Thêm người dùng</title>
  </head>
  <body>
    <h2>Thêm người dùng</h2>
    <form
      action="${pageContext.request.contextPath}/admin/user/add"
      method="post"
    >
      <label>UserName:</label
      ><input type="text" name="userName" required /><br />
      <label>FullName:</label
      ><input type="text" name="fullName" required /><br />
      <label>Email:</label><input type="email" name="email" required /><br />
      <label>Password:</label
      ><input type="password" name="passWord" required /><br />
      <label>Role:</label>
      <select name="roleid">
        <option value="1">Người dùng</option>
        <option value="2">Admin</option></select
      ><br />
      <label>Phone:</label><input type="text" name="phone" /><br />
      <button type="submit">Thêm</button>
      <a href="${pageContext.request.contextPath}/admin/user/list">Quay lại</a>
    </form>
  </body>
</html>
