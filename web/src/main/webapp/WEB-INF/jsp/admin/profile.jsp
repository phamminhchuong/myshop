<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="/templates/taglib.jsp" %>
     <div class="container-fluid dashboard-content">
			<div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="page-header" id="top">
                                    <h2 class="pageheader-title">Thông tin tài khoản </h2>
                                    <div class="page-breadcrumb">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Trang chủ</a></li>
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Người dùng</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Profile</li>
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
                                        <form id="form" action="${pageContext.request.contextPath}/admin/profile" method="post">
                                        	<div class="form-group">
                                                <label for="name" class="col-form-label">Username</label>
                                                <input readonly="readonly" id="username" name="username" value="${userInfo.username }" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="col-form-label">Họ và tên</label>
                                                <input id="name" name="name" value="${userInfo.name }" type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputEmail">Email</label>
                                                <input readonly="readonly" id="inputEmail" value="${userInfo.email }" name="email" type="email" placeholder="name@example.com" class="form-control">
                                                
                                            </div>
                                            <div class="form-group">
                                                <label for="inputText4" class="col-form-label">Số điện thoại</label>
                                                <input id="inputText4" value="${userInfo.phone }" name="phone" type="number" class="form-control" placeholder="Numbers">
                                            </div>
                                            
											<h5>Giới tính</h5>
											<c:if test="${userInfo.gioitinh eq true}">
												<c:set value="checked='checked'" var="checknam"></c:set>
											</c:if>
											<c:if test="${userInfo.gioitinh eq false
											}">
												<c:set value="checked='checked'" var="checknu"></c:set>
											</c:if>
                                            <label class="custom-control custom-radio custom-control-inline">
                                                <input ${checknam } type="radio" name="gioitinh" value="1"  class="custom-control-input"><span class="custom-control-label">Nam</span>
                                            </label>
                                            <label class="custom-control custom-radio custom-control-inline">
                                                <input ${checknu } type="radio" name="gioitinh" value="0" class="custom-control-input"><span class="custom-control-label">Nữ</span>
                                            </label>
                                            
											<div class="form-group">
                                                <label for="inputText4" class="col-form-label">Ngày sinh</label>
                                                <input id="inputText4" value="${userInfo.ngaysinh }" required="required" data-parsley-required-message="Bạn phải nhập trường này" name="date" type="date" class="form-control" placeholder="Địa chỉ">
                                            </div>
											
                                          
											
											<label class="custom-control custom-checkbox custom-control-inline">
                                                <input type="checkbox" onchange='javascript:handleChange(this)' class="custom-control-input"><span style="font-weight:bold" class="custom-control-label">Đổi mật khẩu</span>
                                            </label>
											<div id="changepass" style="display: none">
												
											</div>
											
											<div class="form-group row text-left">
												<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
													<button type="submit" class="btn btn-space btn-primary">Submit</button>
													<button class="btn btn-space btn-secondary">Cancel</button>
												</div>
											</div>
											<script>
											var html = 
												"<div class='form-group'>"+
												"<label for='inputText3' class='col-form-label'>Mật khẩu cũ</label>"+
												"<input id='inputText3' name='passOld' required='required' data-parsley-required-message='Bạn phải nhập trường này' type='password'  class='form-control'></div>"+
											
											"<div class='form-group'>"+
												"<label for='pass2'>Mật khẩu mới</label>"+
												"<input id='pass2' name='password' type='password' required='required' data-parsley-required-message='Bạn phải nhập trường này' data-parsley-minlength='6' data-parsley-minlength-message='Mật khẩu trên 6 kí tự'  placeholder='lớn hơn 6 kí tự' class='form-control'>"+
												
											"</div>"+
											"<div class='form-group'>"+
												"<label for='inputText4' class='col-form-label'>Nhập lại mật khẩu mới</label>"+
												"<input id='inputText4' type='password' data-parsley-equalto='#pass2' data-parsley-equalto-message='Mật khẩu chưa giống' class='form-control' >"+
											"</div>";
											function handleChange(checkbox){	
											
												if(checkbox.checked == true){
														$('#changepass').append(html);
														$('#changepass').fadeIn('slow');
														
													}else{
														$('#changepass').fadeOut();
														$('#changepass').children().remove();															
												   }
												}						
										</script>			
											
											
                                        </form>
                                    </div>
                                    <div class="card-body border-top">
                                      
                                    </div>
                                </div>
                            
						
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->