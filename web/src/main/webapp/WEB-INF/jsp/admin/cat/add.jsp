<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="container-fluid dashboard-content">
         <%@include file="/templates/taglib.jsp" %>
			<div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="page-header" id="top">
                                    <h2 class="pageheader-title">Thêm danh mục</h2>
                                    <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                                    <div class="page-breadcrumb">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Danh mục</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Thêm danh mục</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                <div class="row">
					
                    <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
                        
					 <div class="card">
					        <h5 class="card-header">Basic Form</h5>
                                    <div class="card-body">
                                        <form id="form" action="${pageContext.request.contextPath}/admin/cat/add" method="post">
                                         <div class="form-group">
                                                <label for="inputText4" class="col-form-label">Tên danh mục</label>
                                                <input id="inputText4" data-parsley-minlength='6' data-parsley-minlength-message='Tên trên 6 kí tự' required="required" data-parsley-required-message="Bạn phải nhập trường này" name="namec" type="text" class="form-control" placeholder="Tên danh mục	">
                                            </div>
                                  
                                            
											<div class="form-group">
                                                <label for="inputText4" class="col-form-label">Thuộc danh mục</label>
                                                <select class="form-control" name="id_parent">
                                                <option value="0">Không</option>
                                               <c:forEach items="${listCat }" var="objc">
                                               			<option value="${objc.id_cat}">${objc.namec}</option>
                                                </c:forEach>
                                                </select>
                                            </div>
											
											<div class="form-group row text-left">
												<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
													<button type="submit" class="btn btn-space btn-primary">Submit</button>
													<button class="btn btn-space btn-secondary">Cancel</button>
												</div>
											</div>
										
											
                                        </form>
                                    </div>
                                    <div class="card-body border-top">
                                      
                                    </div>
                                </div>
                            
						
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->