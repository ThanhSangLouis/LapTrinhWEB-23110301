<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>
<html>
<head>
    <title>Admin Profile</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title">Profile
            <small>Hồ sơ cá nhân admin</small>
        </h1>
        <!-- END PAGE TITLE-->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-user font-dark hide"></i>
                            <span class="caption-subject font-dark bold uppercase">Cập nhật thông tin cá nhân</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <!-- Display messages -->
                        <c:if test="${not empty message}">
                            <div class="alert alert-success alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <i class="icon fa fa-check"></i> ${message}
                            </div>
                        </c:if>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <i class="icon fa fa-ban"></i> ${error}
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/admin/profile" method="post"
                              enctype="multipart/form-data" role="form" id="profileForm">

                            <!-- Avatar Section -->
                            <div class="form-group">
                                <label for="avatar">Ảnh đại diện</label>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="thumbnail" style="width: 150px;">
                                            <img src="${pageContext.request.contextPath}/${user.avatar != null ? user.avatar : 'global/img/avatar-placeholder.png'}"
                                                 alt="Current Avatar" id="currentAvatar"
                                                 style="width: 100%; height: 150px; object-fit: cover;"
                                                 onerror="this.src='${pageContext.request.contextPath}/global/img/avatar-placeholder.png'">
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="file" name="avatar" id="avatar" accept="image/*" class="form-control">
                                        <p class="help-block">Chọn file ảnh mới để thay đổi avatar (jpg, png, gif, jpeg)</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Full Name -->
                            <div class="form-group">
                                <label for="fullname">Họ và tên*</label>
                                <input type="text" name="fullname" id="fullname"
                                       class="form-control" placeholder="Nhập họ và tên"
                                       value="${user.fullName}" required>
                                <div class="help-block with-errors"></div>
                            </div>

                            <!-- Phone -->
                            <div class="form-group">
                                <label for="phone">Số điện thoại*</label>
                                <input type="tel" name="phone" id="phone"
                                       class="form-control" placeholder="Nhập số điện thoại"
                                       value="${user.phone}" required>
                                <div class="help-block with-errors"></div>
                            </div>

                            <!-- Display only fields -->
                            <div class="form-group">
                                <label>Tài khoản:</label>
                                <p class="form-control-static">${user.username}</p>
                            </div>

                            <div class="form-group">
                                <label>Email:</label>
                                <p class="form-control-static">${user.email}</p>
                            </div>

                            <!-- Hidden fields for user ID (if needed) -->
                            <input type="hidden" name="userId" value="${user.id}">

                            <!-- Submit Buttons -->
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fa fa-save"></i> Cập nhật thông tin
                                </button>
                                <button type="reset" class="btn btn-default" onclick="resetForm()">
                                    <i class="fa fa-refresh"></i> Đặt lại
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function resetForm() {
    document.getElementById('profileForm').reset();
    document.getElementById('currentAvatar').src = '${pageContext.request.contextPath}/${user.avatar != null ? user.avatar : "global/img/avatar-placeholder.png"}';
    // Clear any error states
    $('.form-group').removeClass('has-error');
    $('.help-block').text('');
}

// File input preview
document.getElementById('avatar').addEventListener('change', function(e) {
    var file = e.target.files[0];
    if (file) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('currentAvatar').src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
});
</script>

<!-- Include necessary JS libraries if not loaded globally -->
<script src="${pageContext.request.contextPath}/global/plugins/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/global/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
