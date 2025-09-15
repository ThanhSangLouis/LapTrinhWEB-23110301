<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8" />
<!-- header.jsp: dùng chung cho các trang admin -->
<header class="admin-header">
  <div class="header-left">
    <span class="logo"
      ><span style="color: #4f8cff; font-weight: 700">IOT</span
      ><span style="color: #ff5e5e; font-weight: 700">STAR</span>
      <span style="color: #888; font-weight: 400; font-size: 1.1rem"
        >Admin</span
      ></span
    >
  </div>
  <div class="header-right">
    <span class="admin-avatar"><i class="fa fa-user-circle"></i></span>
    <span class="admin-name">${username != null ? username : 'Admin'}</span>
  </div>
</header>
