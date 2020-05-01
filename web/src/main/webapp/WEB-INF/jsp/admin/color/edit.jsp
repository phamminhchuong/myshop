<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="container-fluid dashboard-content">
			<div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="page-header" id="top">
                                    <h2 class="pageheader-title">Sửa mã giảm giá</h2>
                                    <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                                    <div class="page-breadcrumb">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Trang chủ</a></li>
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Sản phẩm</a></li>
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Mã giảm giá</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Sửa mã</li>
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
                                        <form id="form" action="${pageContext.request.contextPath}/admin/color/edit" method="post">
                                        <input type="hidden" name="id_color" value="${objColor.id_color}">
                                         <div class="form-group">
                                                <label for="namecolor" class="col-form-label">Tên màu</label>
                                                <input id="namecolor" value="${objColor.namecolor }" required="required" data-parsley-required-message="Bạn phải nhập trường này" name="namecolor" type="text" class="form-control" placeholder="Tên màu...">
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