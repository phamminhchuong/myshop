<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="/templates/taglib.jsp" %>
    <div class="container">
					<div class="row">
					
                    <div style="padding: 2px 2px;
					    border: 1px solid #b7a3a3;
					    margin: 50px 40px;" class="col-md-6">
					    
                        <div>
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active">
                                    <a href="#home" aria-controls="home" role="tab" data-toggle="tab">Đăng nhập</a>
                                </li>
                                <li role="presentation">
                                    <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Đăng kí tài khoản</a>
                                </li>
                               
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="home">
                                    
									 <div class="col-md-12">
									  
										<div class="registered-customers">
										
											<h6 style=" margin-top: 25px;" class="widget-title border-left mb-50">ĐĂNG NHẬP</h6>
											<form id="form1" action="javascript:void(0)">
												<div class="login-account p-30 box-shadow">
												<div style="display: inline;" id="my-signin2"></div>
													<div style="font-size: 20px;margin-left: 267px;margin-top: -50px;">
														<div style="display: inline;" >
														    <div onclick="fbLogin();" style="height:50px;width:240px;" class="abcRioButton abcRioButtonBlue">
														        <div class="abcRioButtonContentWrapper">
														            <div class="abcRioButtonIcon" style="padding:15px">
														                <div style="width:18px;height:18px;color: #1616cadb;" class="abcRioButtonSvgImageWithFallback abcRioButtonIconImage abcRioButtonIconImage18">
														                 <i class="fab fa-facebook-f"></i>
														                </div>
														            </div><span style="font-size:16px;line-height:48px;" class="abcRioButtonContents"><span>Signed in with Facebook</span><span style="display:none">Signed in with Facebook</span></span>
														        </div>
														    </div>
														</div>
													</div>
													<p>Nếu bạn có tài khoản vui lòng đăng nhập</p>
													<input required="required" data-parsley-required-message='Bạn phải nhập tài khoản' type="text" id="username" name="username" placeholder="Tên tài khoản...">
													<input required="required" data-parsley-required-message='Bạn phải nhập mật khẩu' type="password" id="password" name="password" placeholder="Mật khẩu...">
													<p><small><a href="#">Bạn quên mật khẩu ?</a></small></p>
													<p style="color: red" id="kq"></p>
													<button onclick="shopLogin()" class="submit-btn-1 btn-hover-1" type="submit">Đăng nhập</button>
													
												</div>
											</form>
										</div>
									</div>
									
            						<script type="text/javascript">
            						function shopLogin() {
            							$('#form1').parsley();
                            			var user = document.getElementById("username").value;
                            			var pass = document.getElementById("password").value;
                            			if($('#form1').parsley().isValid()) {
                                		$.ajax({
                                  			url: '${pageContext.request.contextPath}/shop/login',
                                  			type: 'POST',
                                  			cache: false,
                                  			data: {
                                  					//Dữ liệu gửi đi
                                  				
                                  				username: user,
                                  				password: pass,
                                  					},
                                  			success: function(data){
                                  				alert("thành công !");
                                  				location.reload(true);
                                  			},
                                  			error: function (jqXHR,error, errorThrown){
                                  				if(jqXHR.status&&jqXHR.status==400){
                                  					$('#kq').html(jqXHR.responseText);
                                               }else{
                                                   alert("Something went wrong");
                                               }
                                  			}
                                  		});
									}
            						}
            						function sendEmail() {
                            			var email = document.getElementById("email").value;
                            			$('#email').parsley();
                            			if($('#email').parsley().isValid()){
                                		$.ajax({
                                  			url: '${pageContext.request.contextPath}/shop/checkmail',
                                  			type: 'POST',
                                  			cache: false,
                                  			data: {
                                  					//Dữ liệu gửi đi
                                  				email: email,
                                  				},
                                  			success: function(data){
                                  				//alert("thành công !");
                                  				$('#kq2').html(data);
                                  				//location.reload(true);
                                  			},
                                  			error: function (jqXHR,error, errorThrown){
                                  				if(jqXHR.status&&jqXHR.status==400){
                                  					$('#kq2').html(jqXHR.responseText);
                                               }else{
                                                   alert("Something went wrong");
                                               }
                                  			}
                                  		});
									}else{
										document.getElementById("kq2").innerHTML = "Vui lòng nhập đúng đinh dạng email";
									}
            						}
            						function sendinfoUser() {
            							var email = document.getElementById("email").value;
            							var name = document.getElementById("name").value;
            							var username = document.getElementById("username2").value;
            							var password = document.getElementById("password2").value;
            							var phone = document.getElementById("phone").value;
            							var gioitinh = document.querySelector('input[name="gioitinh"]:checked').value;
            							var ngaysinh = document.getElementById("ngaysinh").value;
            							var code = document.getElementById("code").value;
            							if($('#form2').parsley().isValid()){
                                		$.ajax({
                                  			url: '${pageContext.request.contextPath}/shop/register',
                                  			type: 'POST',
                                  			cache: false,
                                  			data: {
                                  					//Dữ liệu gửi đi
                                  				email: email,
                                  				name: name,
                                  				username: username,
                                  				password: password,
                                  				phone: phone,
                                  				gioitinh: gioitinh,
                                  				ngaysinh: ngaysinh,
                                  				code: code
                                  				},
                                  			success: function(data){
                                  				//alert("thành công !");
                                  				$('#form2').html(data);
                                  				//location.reload(true);
                                  			},
                                  			error: function (jqXHR,error, errorThrown){
                                  				if(jqXHR.status&&jqXHR.status==400){
                                  					$('#kq3').html(jqXHR.responseText);
                                               }else if(jqXHR.status&&jqXHR.status==401){
                                            	   $('#kq4').html(jqXHR.responseText);
                                               }else{
                                                   alert("Something went wrong");
                                               }
                                  			}
                                  		});
									}
            						}
            						</script>
							   </div>
                                <div role="tabpanel" class="tab-pane" id="profile">
									
									<div class="col-md-12">
                            <div class="new-customers">
                            <style>
                            	.parsley-errors-list{
                            		color: red;
								    font-size: 11px;
								    margin-top: -13px;
                            	
                            	}
                            	input[type="date"]{
                            	background: #fff none repeat scroll 0 0;
							    border: 1px solid #00000000;
							    box-shadow: 0 0 4px 0px rgb(2, 2, 2);
							    color: #635e5e;
							    font-size: 13px;
							    height: 40px;
							    margin-bottom: 20px;
							    padding-left: 20px;
							    width: 100%;
                            	}
                            	
                            	.span-input{
                            	margin-left: 9px;
                            	}
                            	.product-new-label {
											position: absolute;
											margin-top: -445px;
											margin-left: 0px;
											background-color: red;
											color: white;
											padding-left: 7px;
											padding-right: 7px;
										}
										.product-discount-label{
											position: absolute;
											margin-top: -445px;
											margin-left: 225px;
											background-color: red;
											color: white;
											padding-left: 7px;
											padding-right: 7px;
										}
									li.disabled {
								  pointer-events: none;
								  cursor: default;
								}
                            </style>
                                <form id="form2" action="javascript:void(0)">
                                    <h6 style=" margin-top: 25px;" class="widget-title border-left mb-50">KHÁCH HÀNG MỚI</h6>
                                    <div class="login-account p-30 box-shadow">
                                        <div class="row">
                                                <input id="username2" required="required" data-parsley-required-message="Bạn phải nhập trường này" name="username" class="form-control" type="text" placeholder="Tên tài khoản">
                                                <p id="kq4" style="font-size: 11px;color: red;"></p>
                                            <div class="col-sm-6">
                                                <input id='pass2' type='password' name="password" required='required' data-parsley-required-message='Bạn phải nhập trường này' class="form-control" data-parsley-minlength='6' data-parsley-minlength-message='Mật khẩu trên 6 kí tự'  placeholder='Mật khẩu'>
                                            </div>
                                            <div class="col-sm-6">
                                                <input id='password2' placeholder="Nhập lại mật khẩu" type='password' data-parsley-equalto='#pass2' class="form-control" data-parsley-equalto-message='Mật khẩu chưa giống' >
											
                                            </div>
                                            
                                                <input id="name" required="required" data-parsley-required-message="Bạn phải nhập trường này" class="form-control" name="name" placeholder="Họ và tên" value="" type="text" >
                                           <div class="row">
	                                           <div class="col-sm-8">
												<input id="email" required="required" data-parsley-type="email" data-parsley-type-message="Chưa đúng định dạng email" data-parsley-required-message="Bạn phải nhập trường này" value="" name="email" type="text" class="form-control" placeholder="Email" >
	                                            </div>
	                                            <div class="col-sm-4">
	                                            	<a href="javascript:void(0)" style="height: 39px;" onclick="sendEmail()" class="btn btn-warning">Gửi xác nhận</a>
	                                            </div>
	                                            <p id="kq2" style="font-size: 11px;color: green;"></p>
                                            </div>
                                            <input id="code" value="" name="code" type="text" class="form-control" placeholder="Mã xác nhận">
                                            <p id="kq3" style="font-size: 11px;color: red;"></p>
                                            <input id="phone" required="required" min="100000000" max="1000000000" data-parsley-range-message="số điện thoại gồm 10 chữ số" data-parsley-required-message="Bạn phải nhập trường này" value="" name="phone" type="text" class="form-control" placeholder="Số điện thoại">
                                            <div class="row">
                                            	<div class="col-sm-8">
		                                            <label class="mr-20">
		                                                <input type="radio" data-required="true" data-required-message="Bạn phải chọn giới tính" name="gioitinh" value="1"  checked="checked" ><span class="span-input">Nam</span>
		                                            </label>
		                                            <label class="mr-20">
		                                                <input type="radio" name="gioitinh" value="0" ><span class="span-input">Nữ</span>
		                                            </label>
		                                        </div>
                                            </div>
                                            <input id="ngaysinh" required="required" data-parsley-required-message="Bạn phải nhập trường này" required="required" data-parsley-maximumage="80" data-parsley-maximumage-message="Ngày sinh phải nhỏ hơn 80 tuổi" data-parsley-minimumage="14" data-parsley-minimumage-message="Ngày sinh phải lớn hơn 15 tuổi" name="ngaysinh" type="date" class="form-control" placeholder="Địa chỉ">
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <button class="submit-btn-1 mt-20 btn-hover-1" type="submit" onclick="sendinfoUser()" value="register">Đăng kí</button>
                                            </div>
                                            <div class="col-md-6">
                                                <button class="submit-btn-1 mt-20 btn-hover-1 f-right" type="reset">làm mới</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                
                            </div>
                        </div>
									
								</div>
                                
                            </div>
                        </div>            
                    </div>
                    
                    <div class="col-md-5">
                    	 <div class="payment-details pl-10 mb-50">
                                                        <h6 class="widget-title border-left mb-20">ĐƠN HÀNG CỦA BẠN</h6>
                                                        <table>
                                                        <c:forEach items="${listCart }" var="obj">
                                                        	<c:forEach items="${listProduct }" var="objp">
                                                        		<c:if test="${obj.id_product eq objp.id_pro}">
                                                        			<c:set value="${objp.namepro}" var="namePro"></c:set>
                                                        			<c:if test="${objp.giakm > 0 }">
                                                        			<c:set value="${objp.giakm}" var="Gia"></c:set>
                                                        			</c:if>
                                                        			<c:if test="${objp.giakm == 0 }">
                                                        			<c:set value="${objp.gia}" var="Gia"></c:set>
                                                        			</c:if>
                                                        			
                                                        		</c:if>
                                                        	</c:forEach>
                                                        	<c:if test="${obj.size != '0'}">
                                                        			<c:set value="Size: ${obj.size}" var="Size"></c:set>
                                                        	</c:if>
                                                        	<c:forEach items="${listColor }" var="objcl">
                                                        		<c:if test="${obj.id_color eq objcl.id_color}">
                                                        			<c:set value="Màu: ${objcl.namecolor}" var="Mau"></c:set>
                                                        	</c:if>
                                                        	</c:forEach>
                                                            <tr>
                                                                <td class="td-title-1">${namePro } x ${obj.amount } , ${Size },${Mau } </td>
                                                                <td class="td-title-2"><span onclick="changevnd(this)" class="money-change">${Gia }</span>đ</td>
                                                            </tr>
                                                        </c:forEach> 
                                                            <tr>
                                                                <td class="td-title-1">Tổng sản phẩm</td>
                                                                <td class="td-title-2"><span onclick="changevnd(this)" class="money-change">${ThanhTien }</span>đ</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Phí vận chuyển</td>
                                                                <td class="td-title-2">50.000đ</td>
                                                            </tr>
                                                          
                                                            <tr>
                                                                <td class="order-total">TỔNG HÓA ĐƠN</td>
                                                                <td class="order-total-price"><span onclick="changevnd(this)" class="money-change">${ThanhTien + 50000}</span>đ</td>
                                                            </tr>
                                                        </table>
                                                    </div> 
                    </div>
                    
                    </div>
                    </div>