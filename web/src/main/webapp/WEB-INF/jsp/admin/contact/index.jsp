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
                            <h2 class="pageheader-title">Danh sách Liên hệ</h2>
                            <p class="pageheader-text"></p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Trang chủ</a></li>
                                        <li class="breadcrumb-item active"><a href="#" class="breadcrumb-link">Liên hệ</a></li>
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
                        <div class="card">
                        <c:if test="${msg eq 1}">
                        	<div class="alert alert-success" role="alert">
                                                Thao tác thành công!
                                            </div>
                        </c:if>
                         <c:if test="${msg eq 0}">
                        	<div class="alert alert-danger" role="alert">
                                                Thao tác thất bại!
                                            </div>
                        </c:if>
                            <div class="card-header">
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	
                                    <table id="example" class="table table-striped table-bordered second" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tiêu đề</th>
                                                <th>Email</th>
                                                <th>Ngày gửi</th>
                                                <th>Trạng thái</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${listContact }" var="objct">
                                            <tr>
                                                <td>${objct.id_ct }</td>
                                                <td>${objct.name }</td>
                                                <td>${objct.email}</td>
                                                <fmt:parseDate  value="${objct.ngaygui}"  type="date" pattern="yyyy-MM-dd HH:mm" var="parsedDate" />
												<fmt:formatDate value="${parsedDate}" type="date" pattern="yyyy-MM-dd HH:mm" var="stdDatum" />
                                                <td><c:out value = "${stdDatum}" /></td>
                                                <td style="text-align: center;">
                                                	<c:if test="${objct.view == true }">
                                                		<button style="padding: 0px 0px;" class="btn btn-success">Đã xem</button>
                                                		
                                                	</c:if>
                                                	<c:if test="${objct.view == false }">
                                                			<button style="padding: 0px 0px;" class="btn btn-danger">Chưa xem</button>
                                                	</c:if>
                                                </td>
                                                <td>
                                                	<a href="${pageContext.request.contextPath }/admin/contact/view/${objct.id_ct }" title="Xem" class="badge badge-info"><i class="fas fa-eye"></i></a>
                                           			<a onclick="return confirm('Bạn có chắc muốn xóa không?')" href="${pageContext.request.contextPath }/admin/contact/del/${objct.id_ct }" title="Xóa" class="badge badge-danger"><i class="fas fa-trash"></i></a>
                                                </td>
                                            </tr>
                                          </c:forEach>
                                        </tbody>
                                        
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end data table  -->
                    <!-- ============================================================== -->
                </div>
               
                 
                </div>
      </div>     