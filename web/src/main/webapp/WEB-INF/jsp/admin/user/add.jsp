<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="container-fluid dashboard-content">
			<div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="page-header" id="top">
                                    <h2 class="pageheader-title">Thêm người dùng</h2>
                                    <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                                    <div class="page-breadcrumb">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Người dùng</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Thêm người dùng</li>
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
                                        <form id="form" action="${pageContext.request.contextPath}/admin/user/add" method="post">
                                         <div class="form-group">
                                                <label for="inputText4" class="col-form-label">Tài khoản</label>
                                                <input id="inputText4" required="required" data-parsley-required-message="Bạn phải nhập trường này" name="username" type="text" class="form-control" placeholder="Địa chỉ">
                                            </div>
                                  
                                            <div class='form-group'>
												<label for='pass2'>Mật khẩu</label>
												<input id='pass2' type='password' name="password" required='required' data-parsley-required-message='Bạn phải nhập trường này' data-parsley-minlength='6' data-parsley-minlength-message='Mật khẩu trên 6 kí tự'  placeholder='lớn hơn 6 kí tự' class='form-control'>"
												
											</div>
											<div class='form-group'>
												<label for='inputText4' class='col-form-label'>Nhập lại mật khẩu</label>
												<input id='inputText4' type='password' data-parsley-equalto='#pass2' data-parsley-equalto-message='Mật khẩu chưa giống' class='form-control' >
											</div>
                                            <div class="form-group">
                                                <label for="name" class="col-form-label">Họ và tên</label>
                                                <input id="name" name="name" required="required" data-parsley-required-message="Bạn phải nhập trường này" name="name" value="" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail">Email</label>
                                                <input id="inputEmail" required="required"data-parsley-type="email" data-parsley-type-message="Chưa đúng định dạng email" data-parsley-required-message="Bạn phải nhập trường này" value="" name="email" type="email" placeholder="name@example.com" class="form-control">
                                                
                                            </div>
                                            <div class="form-group">
                                                <label for="inputText4" class="col-form-label">Số điện thoại</label>
                                                <input id="inputText4" required="required" min="100000000" max="1000000000" data-parsley-range-message="số điện thoại gồm 10 chữ số" data-parsley-required-message="Bạn phải nhập trường này" value="" name="phone" type="number" class="form-control" placeholder="Numbers">
                                            </div>
                                            
											<h5>Giới tính</h5>
                                            <label class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" data-required="true" data-required-message="Bạn phải chọn giới tính" name="gioitinh" value="1" checked="" class="custom-control-input"><span class="custom-control-label">Nam</span>
                                            </label>
                                            <label class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" name="gioitinh" value="0" class="custom-control-input"><span class="custom-control-label">Nữ</span>
                                            </label>
											
                                            
											<div class="form-group">
                                                <label for="inputText4" class="col-form-label">Ngày sinh</label>
                                                <input id="inputText4" required="required" data-parsley-required-message="Bạn phải nhập trường này" required="required" data-parsley-required-message="Bạn phải nhập trường này" name="ngaysinh" type="date" class="form-control" placeholder="Địa chỉ">
                                            </div>
											<div class="form-group">
                                                <label for="inputText4" class="col-form-label">Phân quyền</label>
                                                <select class="form-control" name="roles_id">
                                                    <option value="3">User</option>
                                                    <option value="2">Editer</option>
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