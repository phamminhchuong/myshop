
<%@page import="model.bean.Cat"%>
<%@page import="java.util.ArrayList"%>
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
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Trang chủ</a></li>
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
                                <h4 ><a href="${pageContext.request.contextPath }/admin/product/add" title="Thêm" class="btn btn-success">Thêm <i class="fas fa-plus-square"></i></a></h4>
                                <div class="" style="margin-left: 65%">
                                	<form action="${pageContext.request.contextPath }/admin/product" method="get">
                                		<span>Tìm kiếm</span>
                                		<input name="search" type="text">
                                		<button type="submit"><i class="fas fa-search"></i> </button>
                                	</form>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	
                                    <table class="table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                               	<th>ID</th>
                                                <th>Tên sản phẩm</th>
                                                <th class="align-middle">Hình ảnh</th>
                                                <th>Giá</th>
                                                <th>Giá khuyến mãi</th>
                                                <th>Màu</th>
                                                <th>Size</th>
                                                <th>Thuộc danh mục</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${listPro }" var="objp">
                                       		<tr>
                                       			<td>${objp.id_pro }</td>
                                       			<td>${objp.namepro }</td>
                                       			<td style="text-align: center;">
                                       			<c:forEach items="${listimage }" var="objim">
                                       				<c:if test="${objp.id_pro == objim.id_product }">
                                       					<img width="80px" height="80px" alt="${objim.nameimg}" src="${pageContext.request.contextPath }/files/${objim.nameimg}">
                                       				</c:if>
                                       			</c:forEach>
                                       			</td>
                                       			<td>${objp.gia }</td>
                                       			<td>${objp.giakm }</td>
                                       			<td>
                                       			
		                                        		<c:forEach items="${listproductcolor }" var="objprocl">
		                                        		<c:if test="${objprocl.id_product eq  objp.id_pro}">
			                                        		<c:forEach items="${listcolor }" var="objcl">
			                                        		<c:if test="${objcl.id_color eq  objprocl.id_color}">
			                                        			<p>${objcl.namecolor }</p>
			                                        		</c:if>
			                                        		</c:forEach>
			                                        	</c:if>
		                                       	 		</c:forEach>
                                       			</td>
                                       			<td>
                                       			<c:forEach items="${listsize }" var="objz">
                                       				<c:if test="${objp.id_pro == objz.id_product }"><p>${objz.namesize}<p/>
                                       				</c:if>
                                       			</c:forEach>
                                       			</td>
                                       			<td>
                                       			<c:forEach items="${listcat }" var="objcat">
                                       				<c:if test="${objp.id_cat == objcat.id_cat }">${objcat.namec}
                                       				</c:if>
                                       			</c:forEach>
                                       			</td>
                                       			<td>
                                       			<a href="${pageContext.request.contextPath }/admin/product/edit/${objp.id_pro}" title='Sửa' class='badge badge-info'><i class='fas fa-edit'></i></a>
                                       			<a href="${pageContext.request.contextPath }/admin/product/amount/${objp.id_pro}" title='Số lượng' class='badge badge-success'><i class='fas fa-plus-square'></i></a>
                                       			<a href="${pageContext.request.contextPath }/admin/coupon/${objp.id_pro}" title='Mã giảm giá' class='badge badge-warning'><i class='fas fa-hand-holding-usd'></i></a>
                                       			<a href="${pageContext.request.contextPath }/admin/product/comment/${objp.id_pro}" title='Bình luận' class='badge badge-secondary'><i class='fas fa-comment-dots'></i></a>
                                                <a onclick="return confirm('Bạn có chắc muốn xóa không?')" href="${pageContext.request.contextPath }/admin/product/del/${objp.id_pro}" title='Xóa' class='badge badge-danger'><i class='fas fa-trash'></i></a>
                                       			</td>
                                       		</tr>
                                           </c:forEach>
                                        </tbody>
                                        
                                    </table>
                                </div>
		                               
                            </div>
                             <nav style="margin-left: 5%" aria-label="Page navigation example">
										  <ul class="pagination pg-blue">
										    <li class="page-item disabled">
										      <span class="page-link">Previous</span>
										    </li>
										   
										    <c:forEach begin="1" end="${numPage}" var="i">
											    <c:if test="${curPage == i}"><c:set value="active" var="active"></c:set></c:if>
											    <c:if test="${curPage != i}"><c:set value="" var="active"></c:set></c:if>
											    <c:if test="${not empty Search }">
											    	<c:set value="?search=${Search }" var="urlSearch"></c:set>
											    </c:if>
											    <li class="page-item ${active }"><a href="${pageContext.request.contextPath }/admin/product/${i}${urlSearch}" class="page-link">${i }</a></li>
										    </c:forEach>
										    <li class="page-item">
										      <a class="page-link">Next</a>
										    </li>
										  </ul>
										</nav>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end data table  -->
                    <!-- ============================================================== -->
                </div>
               
                 
                </div>
      </div>     