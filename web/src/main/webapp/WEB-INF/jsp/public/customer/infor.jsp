<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/templates/taglib.jsp" %>
    <div style="height: 50px"></div>
<div class="col-md-9 col-md-push-3 col-xs-12">
                            <div class="row">
                                <!-- blog-option start -->
                                <div class="col-md-12">
                                    <div class="blog-option box-shadow mb-30  clearfix">
                                        <!-- categories -->
                                        
                                            <button class="option-btn">
                                                THÔNG TIN TÀI KHOẢN
                                                
                                            </button>
                                            
                                      
                                      
                                    </div>
                                </div>
                                <!-- blog-option end -->
                            </div>
                            <div class="row">
                            <c:if test="${not empty userInfo}">
                                <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
                        
								<div class="card">
					                                    <div id="alertaddUser"></div>
					                                    <div class="card-body">
					                                        <form id="form3" action="javascript:void(0)">
					                                        <div class="form-group">
					                                                <label for="username3" class="col-form-label">Tên tài khoản</label>
					                                                <input id="username3" readonly="readonly" value="${userInfo.username }" required="required" data-parsley-required-message="Bạn phải nhập trường này" class="form-control" name="username3" placeholder="Họ và tên" type="text" >
                                          
					                                            </div>
					                                            <div class="form-group">
					                                                <label for="name1" class="col-form-label">Họ và tên</label>
					                                                <input id="name1" value="${userInfo.name }" required="required" data-parsley-required-message="Bạn phải nhập trường này" class="form-control" name="name" placeholder="Họ và tên" type="text" >
                                          
					                                            </div>
					                                            <div class="form-group">
					                                                <label for="inputEmail">Email</label>
					                                                <input readonly="readonly" id="inputEmail" value="${userInfo.email }" name="mail" type="text" placeholder="name@example.com" class="form-control">
					                                                
					                                            </div>
					                                            <div class="form-group">
					                                                <label for="phone1" class="col-form-label">Số điện thoại</label>
					                                                <input id="phone1" required="required" min="100000000" max="1000000000" data-parsley-range-message="số điện thoại gồm 10 chữ số" data-parsley-required-message="Bạn phải nhập trường này" value="${userInfo.phone }" name="phone" type="text" class="form-control" placeholder="Số điện thoại">
					                                            </div>
					                                            
																<h5>Giới tính</h5>
																<c:if test="${userInfo.gioitinh eq true}"> <c:set value="checked='checked'" var="checknam"></c:set>
																</c:if>
																<c:if test="${userInfo.gioitinh eq false}"> <c:set value="checked='checked'" var="checknu"></c:set>
																</c:if>
					                                            <label class="custom-control custom-radio custom-control-inline">
					                                                <input type="radio" ${checknam } name="gioitinh1" value="1" data-required="true" data-required-message="Bạn phải chọn giới tính" class="custom-control-input"><span class="custom-control-label">Nam</span>
					                                            </label>
					                                            <label class="custom-control custom-radio custom-control-inline">
					                                                <input type="radio" ${checknu } name="gioitinh1" value="0" class="custom-control-input"><span class="custom-control-label">Nữ</span>
					                                            </label>
																
																<div class="form-group">
					                                                <label for="inputText4" class="col-form-label">Ngày sinh</label>
					                                                <input id="ngaysinh1" value="${userInfo.ngaysinh }" required="required" data-parsley-required-message="Bạn phải nhập trường này" required="required" data-parsley-maximumage="80" data-parsley-maximumage-message="Ngày sinh phải nhỏ hơn 80 tuổi" data-parsley-minimumage="14" data-parsley-minimumage-message="Ngày sinh phải lớn hơn 15 tuổi" name="ngaysinh" type="date" class="form-control" placeholder="ngày sinh">
                                        						</div>
																
					                                          
																
																<label class="custom-control custom-checkbox custom-control-inline">
					                                                <input type="checkbox" onchange='javascript:handleChange(this)' id="checkpass" class="custom-control-input"><span style="font-weight:bold" class="custom-control-label">Đổi mật khẩu</span>
					                                            </label>
																<div id="changepass" style="display: none">
																	
																</div>
																
																<div class="form-group row text-left">
																	<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
																		<button onclick="sendinfo()" type="submit" class="submit-btn-1 black-bg btn-hover-2">Cập Nhật</button>
																	</div>
																</div>
																<script>
																var html = 
																	"<div class='form-group'>"+
																	"<label for='oldpass' class='col-form-label'>Mật khẩu cũ</label>"+
																	"<input id='oldpass' required='required' data-parsley-required-message='Bạn phải nhập trường này' type='password'  class='form-control'></div>"+
																
																"<div class='form-group'>"+
																	"<label for='pass3'>Mật khẩu mới</label>"+
																	"<input id='pass3' type='password' required='required' data-parsley-required-message='Bạn phải nhập trường này' data-parsley-minlength='6' data-parsley-minlength-message='Mật khẩu trên 6 kí tự'  placeholder='lớn hơn 6 kí tự' class='form-control'>"+
																	
																"</div>"+
																"<div class='form-group'>"+
																	"<label for='inputText5' class='col-form-label'>Nhập lại mật khẩu mới</label>"+
																	"<input id='inputText5' type='password' data-parsley-equalto='#pass3' data-parsley-equalto-message='Mật khẩu chưa giống' class='form-control' >"+
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
																
																
																function sendinfo() {
							            							var name = document.getElementById("name1").value;
							            							var password = "";
							            							if(document.getElementById("checkpass").checked ==true){
							            								password= document.getElementById("pass3").value;
							            							}
							            							var phone = document.getElementById("phone1").value;
							            							var gioitinh = document.querySelector('input[name="gioitinh1"]:checked').value;
							            							var ngaysinh = document.getElementById("ngaysinh1").value;
							            							
							            							if($('#form3').parsley().isValid()){
							                                		$.ajax({
							                                  			url: '${pageContext.request.contextPath}/customer/infor',
							                                  			type: 'POST',
							                                  			cache: false,
							                                  			data: {
							                                  					//Dữ liệu gửi đi
							                                  				name: name,
							                                  				password: password,
							                                  				phone: phone,
							                                  				gioitinh: gioitinh,
							                                  				ngaysinh: ngaysinh,
							                                  				},
							                                  			success: function(data){
							                                  				//alert("thành công !");
							                                  				$('#alertaddUser').html(data);
							                                  				$('#changepass').fadeOut();
																			$('#changepass').children().remove();
																			document.documentElement.scrollTop = 0;
							                                  				//location.reload(true);
							                                  			},
							                                  			error: function (jqXHR,error, errorThrown){
							                                  				//if(jqXHR.status&&jqXHR.status==400){
							                                  				//	$('#kq3').html(jqXHR.responseText);
							                                              // }else if(jqXHR.status&&jqXHR.status==401){
							                                            	//   $('#kq4').html(jqXHR.responseText);
							                                               //}else{
							                                                   alert("Something went wrong");
							                                              // }
							                                  			}
							                                  		});
																}
							            						}
															</script>			
																
																
					                                        </form>
					                                    </div>
					                                    <div class="card-body border-top">
					                                      
					                                    </div>
					                                </div>
					                            
											
                    			</div>
  </c:if> 
                            </div>
                            
                          
                            <c:if test="${empty userInfo }">
                            	<p>Bạn cần đăng nhập để sử dụng chức năng này</p>
                            	<button onclick="showbtLogin()" class="btn btn-warning">Đăng Nhập</button>
                            </c:if> 
                            <script type="text/javascript">
                            	function showbtLogin() {
                            		document.getElementById("showLogin").click();
								}
                            </script>                    
                        </div>
                        