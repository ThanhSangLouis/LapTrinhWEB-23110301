<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Đăng Nhập - Admin</title>
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
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        margin: 0;
      }

      .login-container {
        background: white;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
      }

      .login-header {
        text-align: center;
        margin-bottom: 30px;
      }

      .login-header h2 {
        color: #333;
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 10px;
      }

      .login-header p {
        color: #666;
        font-size: 14px;
      }

      .form-group {
        margin-bottom: 20px;
      }

      label {
        display: block;
        margin-bottom: 8px;
        font-weight: 500;
        color: #333;
      }

      input[type="text"],
      input[type="password"] {
        width: 100%;
        padding: 15px;
        border: 2px solid #e1e1e1;
        border-radius: 8px;
        font-size: 16px;
        transition: all 0.3s ease;
      }

      input[type="text"]:focus,
      input[type="password"]:focus {
        border-color: #667eea;
        outline: none;
        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
      }

      .checkbox-container {
        display: flex;
        align-items: center;
        margin: 20px 0;
      }

      .checkbox-container input[type="checkbox"] {
        margin-right: 10px;
      }

      .checkbox-container label {
        margin: 0;
        font-weight: normal;
        color: #666;
      }

      .login-btn {
        width: 100%;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 15px;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-top: 10px;
      }

      .login-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
      }

      .alert {
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 8px;
        text-align: center;
        font-weight: 500;
      }

      .alert-danger {
        background-color: #fee;
        border: 1px solid #fcc;
        color: #c33;
      }

      .alert-success {
        background-color: #efe;
        border: 1px solid #cfc;
        color: #363;
      }

      .links {
        text-align: center;
        margin-top: 20px;
        padding-top: 20px;
        border-top: 1px solid #eee;
      }

      .links a {
        color: #667eea;
        text-decoration: none;
        margin: 0 15px;
        font-size: 14px;
        transition: all 0.3s ease;
      }

      .links a:hover {
        color: #764ba2;
        text-decoration: underline;
      }
    </style>
  </head>
  <body>
    <div class="login-container">
      <div class="login-header">
        <h2>Đăng Nhập</h2>
        <p>Hệ thống quản lý Admin</p>
      </div>

      <c:if test="${alert != null}">
        <div class="alert alert-danger">${alert}</div>
      </c:if>

      <c:if test="${param.reset == 'success'}">
        <div class="alert alert-success">
          Mật khẩu đã được cập nhật thành công!
        </div>
      </c:if>

      <form action="login" method="post">
        <div class="form-group">
          <label for="username">Tên đăng nhập</label>
          <input
            type="text"
            id="username"
            name="username"
            placeholder="Nhập tên đăng nhập..."
            required
          />
        </div>

        <div class="form-group">
          <label for="password">Mật khẩu</label>
          <input
            type="password"
            id="password"
            name="password"
            placeholder="Nhập mật khẩu..."
            required
          />
        </div>

        <div class="checkbox-container">
          <input type="checkbox" id="remember" name="remember" />
          <label for="remember">Ghi nhớ đăng nhập</label>
        </div>

        <button type="submit" class="login-btn">Đăng Nhập</button>
      </form>

      <div class="links">
        <a href="${pageContext.request.contextPath}/forget-password">
          <i class="fas fa-key"></i> Quên mật khẩu?
        </a>
        <a href="${pageContext.request.contextPath}/register">
          <i class="fas fa-user-plus"></i> Đăng ký
        </a>
      </div>
    </div>
  </body>
</html>
