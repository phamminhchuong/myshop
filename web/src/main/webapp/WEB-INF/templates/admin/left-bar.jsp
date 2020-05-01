<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/templates/taglib.jsp" %>
         <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Trang chủ</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                Menu
                            </li>
                            <style>
                            	.show{
                            	display: inline-block;
                            	}
                            </style>
                            
                            <li class="nav-item ">
                                <a class="nav-link ${actIndex }" href="${pageContext.request.contextPath }/admin/"><i class="fa fa-fw fa-user-circle"></i>Trang chủ </a>
                            </li>
                            <c:if test="${userInfo.roles_id eq '1'}">
                             <li class="nav-item">
                                <a class="nav-link ${actStatis }" href="${pageContext.request.contextPath }/admin/thong-ke"><i class="fa fa-fw fa-chart-line"></i>Thống kê</a>
                                
                            </li>
                            <li class="nav-item">
                                <a class="nav-link ${actUser }" href="${pageContext.request.contextPath }/admin/user"><i class="fa fa-fw fa-user"></i>Người dùng</a>
                                
                            </li>
                           
                            
                            </c:if>
                            <c:if test="${userInfo.roles_id eq '1'}">
                            <li class="nav-item">
                                <a class="nav-link ${actCat }" href="${pageContext.request.contextPath }/admin/cat"><i class="fas fa-fw fa-chart-pie"></i>Danh mục</a>
                               
                            </li>
                            </c:if>
                           <li class="nav-item">
                                <a class="nav-link ${actPro}" href="${pageContext.request.contextPath }/admin/product"><i class="fas fa-fw fa-box-open"></i>Sản phẩm</a>
                               
                            </li>
                            <li class="nav-item">
                                <a class="nav-link ${actOrder}" href="${pageContext.request.contextPath }/admin/order"><i class="fas fa-fw fa-shopping-cart"></i>Đơn hàng <c:if test="${numOrderNotSeen > 0 }"><span style="display: inline-block;" class="badge badge-danger float-right">${numOrderNotSeen }</span></c:if> </a>
                               
                            </li>
                            <li class="nav-item">
                                <a class="nav-link ${actBlog }" href="${pageContext.request.contextPath }/admin/blogs"><i class="fas fa-fw fa-newspaper"></i>Bài viết</a>
                               
                            </li>
                            <li class="nav-item">
                                <a class="nav-link ${actContact }" href="${pageContext.request.contextPath }/admin/contact"><i class="fas fa-fw fa-envelope"></i>Liên hệ <c:if test="${numContactNotSeen > 0 }"> <span style="display: inline-block;" class="badge badge-danger float-right">${numContactNotSeen }</span></c:if></a>
                               
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="#"><i class="fas fa-fw fa-dollar-sign"></i>Quảng cáo</a>
                               
                            </li>
                            <li class="nav-item">
                                 <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-6" aria-controls="submenu-6"><i class="fas fa-fw fa-plus-square"></i>Khác</a>
                                <div id="submenu-6" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="${pageContext.request.contextPath }/admin/color"><i class="fas fa-fw fa-paint-brush"></i>Màu sắc</a>
                                        </li>
                                    </ul>
                                </div>
                            
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>