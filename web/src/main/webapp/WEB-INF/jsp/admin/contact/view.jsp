<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="dashboard-ecommerce">
    <%@include file="/templates/taglib.jsp" %>
<div class="container-fluid  dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">Liên hệ</h2>
                            <p class="pageheader-text"></p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Liên hệ</a></li>
                                        <li class="breadcrumb-item active"><a href="#" class="breadcrumb-link">Nội dung</a></li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                 <div class="row">
                    <!-- ============================================================== -->
                    <!-- data table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                         <div style="margin-right: 266px;" class="main-content container-fluid p-0">
                        <div class="email-head">
                            <div class="email-head-subject">
                                <div class="title"><a class="active" href="#"><span class="icon"><i class="fas fa-star"></i></span></a> <span style="font-size: 18px">${obj.tieude }</span>
                                    <div class="icons"><a href="mailto:${obj.email }" class="icon"><i class="fas fa-reply">Trả lời</i></a><!-- <a href="#" class="icon"><i class="fas fa-print"></i></a><a href="#" class="icon"><i class="fas fa-trash"></i></a> --></div>
                                </div>
                            </div>
                            <div class="email-head-sender">
                                <div class="date">${obj.ngaygui }</div>
                                <div class="avatar"><img src="${pageContext.request.contextPath }/templates/123.jpg" alt="Avatar" class="rounded-circle user-avatar-md"></div>
                                <div class="sender"><a style="font-size: 13px;"	 href="#">${obj.name }</a> | <a style="font-size: 13px;" href="#">${obj.email }</a>
                                    <!-- <div class="actions"><a class="icon toggle-dropdown" href="#" data-toggle="dropdown"><i class="fas fa-caret-down"></i></a>
                                        <div class="dropdown-menu" role="menu"><a class="dropdown-item" href="#">Mark as read</a><a class="dropdown-item" href="#">Mark as unread</a><a class="dropdown-item" href="#">Spam</a>
                                            <div class="dropdown-divider"></div><a class="dropdown-item" href="#">Delete</a>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                        <div class="email-body">
                            <p>${obj.noidung }</p>
                            <p><strong>Thân,</strong>,
                                <br> ${obj.name }</p>
                        </div>
                       <!--  <div class="email-attachments">
                            <div class="title">Attachments <span>(2 files, 16,24 KB)</span></div>
                            <ul>
                                <li><a href="#"><span class="icon mdi mdi-attachment-alt"></span> new-release.zip <span>(5.12 KB)</span></a></li>
                                <li><a href="#"><span class="icon mdi mdi-attachment-alt"></span> guidelines.pdf <span>(11.3 MB)</span></a></li>
                            </ul>
                        </div> -->
                    </div>
                
                    </div>
                    <!-- ============================================================== -->
                    <!-- end data table  -->
                    <!-- ============================================================== -->
                </div>
               
                 
                </div>
      </div>     