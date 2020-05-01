
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
                            <h2 class="pageheader-title">Danh sách Bài viết</h2>
                            <p class="pageheader-text"></p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Bài viết</a></li>
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
                                <h4><a href="${pageContext.request.contextPath }/admin/blogs/add" title="Thêm" class="btn btn-success">Thêm <i class="fas fa-plus-square"></i></a></h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	
                                    <table class="table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                               	<th>ID</th>
                                                <th>Tên bài viết</th>
                                                <th class="align-middle">Hình ảnh</th>
                                                <th>Ngày tạo</th>
                                                <th>Số lượt xem</th>
                                                <th>Số lượt bình luận</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${listBlog }" var="objb">
                                       		<tr>
                                       			<td>${objb.id_blog }</td>
                                       			<td>${objb.namebl }</td>
                                       			<td style="text-align: center;">
                                       			<img width="120px" height="80px" alt="${objb.image}" src="${pageContext.request.contextPath }/files/${objb.image}">
                                       			</td>
                                       			<td>${objb.date_create}</td>
                                       			
                                       			<td>1</td>
                                       			<td>1</td>
                                       			<td>
                                       			<a href="${pageContext.request.contextPath }/admin/blogs/edit/${objb.id_blog}" title='Sửa' class='badge badge-info'><i class='fas fa-edit'></i></a>
                                       			<a href="${pageContext.request.contextPath }/admin/comment/${objb.id_blog}" title='Bình luận' class='badge badge-success'><i class='fas fa-comment-dots'></i></a>
                                                
                                                <a onclick="return confirm('Bạn có chắc muốn xóa không?')" href="${pageContext.request.contextPath }/admin/blogs/del/${objb.id_blog}" title='Xóa' class='badge badge-danger'><i class='fas fa-trash'></i></a>
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
										      <span href="${pageContext.request.contextPath }/admin/blogs/${i-1}" class="page-link">Previous</span>
										    </li>
										    <c:forEach begin="${pageMin }" end="${pageMax}" var="i">
											    <c:if test="${curPage == i}"><c:set value="active" var="active"></c:set></c:if>
											    <c:if test="${curPage != i}"><c:set value="" var="active"></c:set></c:if>
											    <li class="page-item ${active }"><a href="${pageContext.request.contextPath }/admin/blogs/${i}" class="page-link">${i}</a></li>
										    </c:forEach>
										    <li class="page-item">
										      <a class="page-link" href="${pageContext.request.contextPath }/admin/blogs/${i+1}">Next</a>
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