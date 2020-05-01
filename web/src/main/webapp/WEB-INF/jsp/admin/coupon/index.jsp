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
                            <h2 class="pageheader-title">Danh sách mã giảm giá</h2>
                            <p class="pageheader-text"></p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Sản phẩm</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">MÃ giảm giá</li>
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
                                <h4><a href="${pageContext.request.contextPath }/admin/coupon/add/${objPro.id_pro }" title="Thêm" class="btn btn-success">Thêm <i class="fas fa-plus-square"></i></a></h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	
                                    <table id="example" class="table table-striped table-bordered second" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Mã</th>
                                                <th>Phần trăm giảm giá</th>
                                                <th>Ngày hết hạn</th>
                                                <th>Sản phẩm Áp dụng</th>
                                                <th>Trạng thái</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${listCuopon }" var="objcb">
                                            <tr>
                                                <td>${objcb.id_salecode }</td>
                                                <td>${objcb.namecode }</td>
                                                <td>${objcb.percent}</td>
                                                <fmt:parseDate  value="${objcb.expiry_date}"  type="date" pattern="yyyy-MM-dd" var="parsedDate" />
												<fmt:formatDate value="${parsedDate}" type="date" pattern="yyyy-MM-dd" var="stdDatum" />
                                                <td><c:out value = "${stdDatum}" /></td>
                                                
                                                <td>
                                                	${objPro.namepro }
                                                </td>
                                                <td style="text-align: center;">
                                                	<c:if test="${stdDatum < now }">
                                                		<button style="padding: 0px 0px;" class="btn btn-danger">Hết</button>
                                                		
                                                	</c:if>
                                                	<c:if test="${stdDatum >= now }">
                                                			<button style="padding: 0px 0px;" class="btn btn-success">Còn</button>
                                                	</c:if>
                                                </td>
                                                <td>
                                                	<a href="${pageContext.request.contextPath }/admin/coupon/edit/${objcb.id_salecode}" title="Sửa" class="badge badge-info"><i class="fas fa-edit"></i></a>
                                           			<a onclick="return confirm('Bạn có chắc muốn xóa không?')" href="${pageContext.request.contextPath }/admin/coupon/del/${objPro.id_pro }/${objcb.id_salecode}" title="Xóa" class="badge badge-danger"><i class="fas fa-trash"></i></a>
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