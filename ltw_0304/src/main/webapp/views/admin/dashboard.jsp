<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Admin Dashboard</title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/global/css/admin-dashboard.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/global/plugins/font-awesome/css/font-awesome.min.css"
    />
  </head>
  <body style="margin: 0; padding: 0">
    <%@ include file="header.jsp" %>
    <div class="dashboard-container">
      <div class="dashboard-header">
        <h1>
          Dashboard
          <span
            style="
              font-size: 1.1rem;
              font-weight: 400;
              color: #888;
              margin-left: 10px;
            "
            >Trang quản trị admin</span
          >
        </h1>
      </div>
      <div class="dashboard-cards">
        <a
          class="dashboard-card"
          href="${pageContext.request.contextPath}/admin/category/list"
        >
          <div class="card-title">Quản lý danh mục</div>
          <div class="card-value"><i class="fa fa-list card-icon"></i></div>
        </a>
        <a
          class="dashboard-card"
          href="${pageContext.request.contextPath}/admin/user/list"
        >
          <div class="card-title">Quản lý người dùng</div>
          <div class="card-value"><i class="fa fa-users card-icon"></i></div>
        </a>
        <a
          class="dashboard-card"
          href="${pageContext.request.contextPath}/admin/profile"
        >
          <div class="card-title">Hồ sơ cá nhân</div>
          <div class="card-value"><i class="fa fa-user card-icon"></i></div>
        </a>
        <a
          class="dashboard-card"
          href="${pageContext.request.contextPath}/logout"
        >
          <div class="card-title">Đăng xuất</div>
          <div class="card-value"><i class="fa fa-sign-out card-icon"></i></div>
        </a>
      </div>
      <div style="margin-top: 32px">
        <div
          style="
            background: #eaf6ff;
            border-radius: 8px;
            padding: 24px 32px;
            box-shadow: 0 1px 8px rgba(79, 140, 255, 0.07);
          "
        >
          <h2
            style="
              margin: 0 0 10px 0;
              font-size: 1.3rem;
              color: #2c3e50;
              font-weight: 600;
            "
          >
            Chào mừng đến với trang quản trị
          </h2>
          <p style="margin: 0; color: #555; font-size: 1.08rem">
            Chọn chức năng bạn muốn quản lý từ các thẻ điều khiển bên trên.
          </p>
        </div>
      </div>
    </div>
    <%@ include file="footer.jsp" %>
  </body>
</html>
