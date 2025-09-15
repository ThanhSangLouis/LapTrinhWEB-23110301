<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
<div class="row">
    <div class="col-md-12">
        <!-- BEGIN PAGE TITLE-->
        <h1 class="page-title">Dashboard
            <small>Trang quản trị admin</small>
        </h1>
        <!-- END PAGE TITLE-->
        <div class="row margin-top-10">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <a class="dashboard-stat dashboard-stat-v2 blue" href="${pageContext.request.contextPath}/admin/category/list">
                    <div class="visual">
                        <i class="fa fa-list"></i>
                    </div>
                    <div class="details">
                        <div class="number">
                            <span data-counter="counterup" data-value="1349">0</span>
                        </div>
                        <div class="desc"> Quản lý danh mục </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <a class="dashboard-stat dashboard-stat-v2 red" href="${pageContext.request.contextPath}/admin/user/list">
                    <div class="visual">
                        <i class="fa fa-users"></i>
                    </div>
                    <div class="details">
                        <div class="number">
                            <span data-counter="counterup" data-value="12,5">0</span>
                        </div>
                        <div class="desc"> Quản lý người dùng </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <a class="dashboard-stat dashboard-stat-v2 green" href="${pageContext.request.contextPath}/admin/profile">
                    <div class="visual">
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="details">
                        <div class="number">
                            <span data-counter="counterup" data-value="549">0</span>
                        </div>
                        <div class="desc"> Hồ sơ cá nhân </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <a class="dashboard-stat dashboard-stat-v2 purple" href="${pageContext.request.contextPath}/logout">
                    <div class="visual">
                        <i class="fa fa-sign-out"></i>
                    </div>
                    <div class="details">
                        <div class="number">
                            <span data-counter="counterup" data-value="423">0</span>
                        </div>
                        <div class="desc"> Đăng xuất </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="clearfix"></div>
        <!-- BEGIN DASHBOARD STATS 1-->
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="portlet light ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-bar-chart font-dark hide"></i>
                            <span class="caption-subject font-dark bold uppercase">Chào mừng đến với trang quản trị</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="note note-info">
                            <p> Chọn chức năng bạn muốn quản lý từ các tùy chọn bên trên. </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
