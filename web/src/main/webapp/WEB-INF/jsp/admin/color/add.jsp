<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="container-fluid dashboard-content">
			<div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="page-header" id="top">
                                    <h2 class="pageheader-title">Thêm Màu</h2>
                                    <div class="page-breadcrumb">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Trang chủ</a></li>
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Màu sắc</a></li>
                                                <li class="breadcrumb-item active"><a href="#" class="breadcrumb-link">Thêm màu</a></li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                <div class="row">
					
                    <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
                        
					 <div class="card">
					        <h5 class="card-header"></h5>
                                    <div class="card-body">
                                        <form id="form" action="${pageContext.request.contextPath}/admin/color/add" method="post">
                                  
                                            <div class='form-group'>
												<label for='percent'>Tên màu</label>
												<input id='percent' type="text" name="namecolor" required='required' data-parsley-required-message='Bạn phải nhập trường này' placeholder='Nhập tên màu ...' class='form-control'>
												
											</div>
											<div class="form-group row text-left">
												<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
													<button type="submit" class="btn btn-space btn-primary">Xác nhận</button>
													<button class="btn btn-space btn-secondary">Xóa</button>
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