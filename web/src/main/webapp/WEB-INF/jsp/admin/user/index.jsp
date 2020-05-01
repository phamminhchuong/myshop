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
                            <h2 class="pageheader-title">Data Tables</h2>
                            <p class="pageheader-text"></p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Tables</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Data Tables</li>
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
                                <h4><a href="${pageContext.request.contextPath }/admin/user/add" title="Thêm" class="btn btn-success">Thêm <i class="fas fa-plus-square"></i></a></h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	
                                    <table id="example" class="table table-striped table-bordered second" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Tài khoản</th>
                                                <th>Họ và tên</th>
                                                <th>SĐT</th>
                                                <th>Email</th>
                                                <th>Phân Quyền</th>
                                                <th>Trạng thái</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${listUser }" var="obju">
                                            <tr>
                                                <td>${obju.username }</td>
                                                <td>${obju.name }</td>
                                                <td>${obju.phone}</td>
                                                <td>${obju.email }</td>
                                                <td>
                                                	<c:forEach items="${listRole }" var="objr">
                                                		<c:if test="${obju.roles_id == objr.roles_id}">
                                                			<c:if test="${objr.nameR eq 'ADMIN' }">
                                                			<button style="padding: 0px 0px;" class="btn btn-danger">ADMIN</button>
                                                			</c:if>
                                                			<c:if test="${objr.nameR eq 'EDITER' }">
                                                			<button style="padding: 0px 0px;" class="btn btn-warning">EDITER</button>
                                                			</c:if>
                                                			<c:if test="${objr.nameR eq 'USER' }">
                                                			<button style="padding: 0px 0px;" class="btn btn-success">USER</button>
                                                			</c:if>
                                                			<c:set value="${objr.nameR}" var="namer"></c:set>
                                                		</c:if>
                                                		
                                                	</c:forEach>
                                                </td>
                                                <td>
                                                <c:if test="${obju.enable}">Bình thường</c:if>
                                                <c:if test="${not obju.enable}">Khóa</c:if>
                                                </td>
                                                <td>
                                                	<c:if test="${namer != 'ADMIN'}">
                                                		<a href="${pageContext.request.contextPath }/admin/user/edit/${obju.id_user}" title="Sửa" class="badge badge-info"><i class="fas fa-edit"></i></a>
                                                	</c:if>
                                           			<a  href="${pageContext.request.contextPath }/admin/user/address/${obju.id_user}" title="Địa chỉ" class="badge badge-warning"><i class="fas fa-map-marker-alt"></i></a>
                                           			<c:if test="${namer != 'ADMIN'}">
                                           			<a onclick="return confirm('Bạn có chắc muốn xóa không?')" href="${pageContext.request.contextPath }/admin/user/del/${obju.id_user}" title="Xóa" class="badge badge-danger"><i class="fas fa-trash"></i></a>
                                              		 </c:if>
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