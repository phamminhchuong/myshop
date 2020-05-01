
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
                            <h2 class="pageheader-title">Danh sách sản phẩm</h2>
                            <p class="pageheader-text"></p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Sản phẩm</a></li>
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
                                <h4><a href="${pageContext.request.contextPath }/admin/product/add" title="Thêm" class="btn btn-success">Thêm <i class="fas fa-plus-square"></i></a></h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	
                                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>	
                                               	<th>Mã đơn hàng</th>
                                                <th>Ngày mua</th>
                                                <th>Tổng đơn hàng</th>
                                                <th>Trạng thái</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${listOrder }" var="objo">
                                       		<tr>
                                       			<td>${objo.id_order}</td>
                                       			<td>${objo.date}</td>
                                       			<td style="text-align: center;">
                                       				<span onclick="changevnd(this)" class="money-change">${objo.tongtien}</span>đ
                                       			</td>
                                       			<td>
	                                       			<c:if test="${objo.confirm eq false}">
	                                       				<p>Đang chờ xác nhận</p>
	                                       			</c:if>
	                                       			<c:if test="${objo.confirm eq true}">
	                                       				<p>Đã xác nhận</p>
	                                       			</c:if>
                                       			</td>
                                       			
                                       			<td>
	                                       			<a href="${pageContext.request.contextPath }/admin/order/view/${objo.id_order}" title='Xem đơn hàng' class='badge badge-info'><i class='fas fa-eye'></i></a>
	                                                <a onclick="return confirm('Bạn có chắc muốn xóa không?')" href="${pageContext.request.contextPath }/admin/order/del/${objo.id_order}" title='Xóa' class='badge badge-danger'><i class='fas fa-trash'></i></a>
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