<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - <sitemesh:write property="title">Default Title</sitemesh:write></title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <!-- Custom Admin CSS -->
    <link href="${pageContext.request.contextPath}/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css">
    
    <sitemesh:write property="head"/>
</head>
<body class="page-container-bg-solid page-header-fixed page-sidebar-closed-hide-logo">
    
    <!-- BEGIN HEADER -->
    <div class="page-header navbar navbar-fixed-top">
        <div class="page-header-inner">
            <div class="page-logo">
                <a href="${pageContext.request.contextPath}/admin/dashboard">
                    <img src="${pageContext.request.contextPath}/assets/admin/layout/img/logo.png" alt="logo" class="logo-default" />
                </a>
            </div>
            
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown dropdown-user">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                            <img alt="" class="img-circle" src="${pageContext.request.contextPath}/assets/admin/layout/img/avatar.png" />
                            <span class="username username-hide-on-mobile">Admin</span>
                            <i class="fa fa-angle-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-default">
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/profile">
                                    <i class="icon-user"></i> Hồ sơ cá nhân </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/logout">
                                    <i class="icon-key"></i> Đăng xuất </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- END HEADER -->
    
    <div class="clearfix"></div>
    
    <!-- BEGIN CONTAINER -->
    <div class="page-container">
        <!-- BEGIN SIDEBAR -->
        <div class="page-sidebar-wrapper">
            <div class="page-sidebar navbar-collapse collapse">
                <ul class="page-sidebar-menu page-header-fixed" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link">
                            <i class="icon-home"></i>
                            <span class="title">Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/category/list" class="nav-link">
                            <i class="icon-list"></i>
                            <span class="title">Quản lý danh mục</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/user/list" class="nav-link">
                            <i class="icon-users"></i>
                            <span class="title">Quản lý người dùng</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/profile" class="nav-link">
                            <i class="icon-user"></i>
                            <span class="title">Hồ sơ cá nhân</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- END SIDEBAR -->
        
        <!-- BEGIN CONTENT -->
        <div class="page-content-wrapper">
            <div class="page-content">
                <sitemesh:write property="body"/>
            </div>
        </div>
        <!-- END CONTENT -->
    </div>
    <!-- END CONTAINER -->

    <!-- BEGIN FOOTER -->
    <div class="page-footer">
        <div class="page-footer-inner"> 2024 &copy; Admin Panel by IoT Star Team.
        </div>
        <div class="scroll-to-top">
            <i class="icon-arrow-up"></i>
        </div>
    </div>
    <!-- END FOOTER -->

    <!-- BEGIN CORE PLUGINS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
    
    <sitemesh:write property="page.script"/>
</body>
</html>