<%@page import="model.bean.Cat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/templates/taglib.jsp" %>
<!doctype html>
<html class="no-js" lang="en">


<!-- Mirrored from demo.hasthemes.com/subas-preview/subas/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 27 Jun 2019 07:20:54 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shop</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	 <meta name="google-signin-client_id" content="898148680750-3jqbdki12smq2enqghonup9mgkdf1l3p.apps.googleusercontent.com">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/public/img/icon/favicon.png">

    <!-- All CSS Files -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/bootstrap.min.css">
    <!-- Nivo-slider css -->
    
      <link href="${pageContext.request.contextPath }/templates/public/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" media="all">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/lib/css/nivo-slider.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/custom.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templates/admin/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <!-- Style customizer (Remove these two lines please) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/style-customizer.css">
    <link href="#" data-style="styles" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/public/font-awesome.min.css">
   <style type="text/css">
.ajs-dialog{
	margin: 15% auto;
}
</style>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/templates/public/alertify.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/public/default.css">





	    <script src="${pageContext.request.contextPath }/templates/public/js/vendor/jquery-3.1.1.min.js"></script>
		  <script src="${pageContext.request.contextPath }/templates/public/jquery.bootstrap-touchspin.js"></script>
    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath }/templates/public/js/vendor/modernizr-2.8.3.min.js"></script>
    
    
    <!-- Bootstrap framework js -->
    <script src="${pageContext.request.contextPath }/templates/public/js/bootstrap.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/templates/public/alertify.js"></script>
    </head>

<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v6.0&appId=2825838157463355&autoLogAppEvents=1"></script>
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->  

    <!-- Body main wrapper start -->
    <div class="wrapper">

			
								
        <!-- START HEADER AREA -->
        <header class="header-area header-wrapper">
            <!-- header-top-bar -->
            <div class="header-top-bar plr-185">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-3 hidden-xs">
                            <div class="call-us">
                                <p class="mb-0 roboto"><c:if test="${not empty userInfo }">Chào ${userInfo.name }</c:if>
                                <c:if test="${empty userInfo }">Chào Khách</c:if>
                                </p>
                            </div>
                        </div>
                        <div style="position: relative;">
                        <div  class="col-sm-6 hidden-xs">
                            <div class="call-us">
                            <form id="formheader" action="javascript:void(0)" method="get">
                                <input id="txtsearch" style="margin-bottom: 0px;padding-right: 242px;" id="txtsearch" placeholder="Tìm kiếm theo danh mục ..." type="text">
                                 <select id="id_cat" style="position: absolute;margin-left: -230px;
    margin-top: 5px;" id="id_cat">
                                     <option value="0" selected="selected">Danh mục</option>
                                                    	<c:forEach items="${listcatbeaty }" var="objc">
                                                    		<option value="${objc.id_cat}">${objc.namec }</option>
                                                    	</c:forEach>
                                  </select>
                                <button onclick="changeSearch()" type="submit" style="position: absolute;
    margin-left: -37px;
    margin-top: 6px;"><i style="font-size: 24px;" class="zmdi zmdi-search"></i></button>
    </form>
                            </div>
                        </div>
                        </div>
                       
                        
                        
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->
						      	 <div class="row">
                    <div class="col-md-12">
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
												<!-- <a href="https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email&redirect_uri=
												http://localhost:8080/web/login-google&response_type=code
    											&client_id=898148680750-3jqbdki12smq2enqghonup9mgkdf1l3p.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>  

												 -->	<p>Nếu bạn có tài khoản vui lòng đăng nhập</p>
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
            						function reload() {
            							//location.reload(true);
            							//alert("OK");
									}
            						function shopLogin() {
            							$('#form1').parsley();
                            			var user = document.getElementById("username").value;
                            			var pass = document.getElementById("password").value;
                            			var check = false;
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
                                  				//alertify.success("<i style='font-size:16px' class='fas fa-check'></i> Đăng nhập thành công");
                                  				//setInterval(reload(), 50000);
                                  				//check = true;
                                  				//setTimeout(reload(), 5000);
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
                            <style type="text/css">
                            	.parsley-errors-list{
                            		color: red;
								    font-size: 11px;
								    margin-top: -13px;
                            	
                            	}
                            	input[type="date"]{
                            	background: #fff none repeat scroll 0 0;
							    border: 1px solid #00000000;
							    box-shadow: 0 0 2px 1px rgba(2, 2, 2, 0.1);
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
                  
                </div>
            
						      
						      
						      <!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->
							      <div class="modal-footer">
							        <button type="button" id="closelogin" class="btn btn-success" data-dismiss="modal">Close</button>
							      </div>
						      
						    </div>
						  </div>
						</div>
                        <button id="btn" style="display: none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
				  
				</button>
                        
                        <div class="col-sm-3 col-xs-12">
                            <div class="top-link clearfix">
                            	
                                <ul class="link f-right">
                                    <li>
                                        <a class="ola" href="${pageContext.request.contextPath}/customer/history">
                                            <i class="zmdi zmdi-assignment"></i>
                                            Đơn hàng của bạn
                                        </a>
                                    </li>
                                    
                                    <li><c:if test="${empty userInfo }">
                                        <a  id="showLogin" href="#" data-toggle="modal" data-target="#exampleModal">
                                            <i class="zmdi zmdi-lock"></i>Đăng nhập
                                        </a></c:if>
                                        <c:if test="${not empty userInfo }">
                                        <a class="ola" onclick="signOut()" href="${pageContext.request.contextPath}/shop/logout">
                                            <i class="zmdi zmdi-sign-in"></i>Đăng xuất
                                        </a></c:if>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- header-middle-area -->
            <div style="border-bottom: 1px solid #9a9090;" class="header-middle-area plr-185">
                <div class="container-fluid">
                    <div class="full-width-mega-dropdown">
                        <div class="row">
                            <!-- logo -->
                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <div class="logo">
                                    <a href="${pageContext.request.contextPath }">
                                        <img style="width: 109px;height: 91px;" src="${pageContext.request.contextPath }/templates/icon1.png" alt="main logo">
                                    </a>
                                </div>
                            </div>
                            <!-- primary-menu -->
                            <div class="col-md-8">
                                <div id="primary-menu">
                                    <ul class="main-menu text-center">
                                        <li><a href="${pageContext.request.contextPath }">Trang chủ</a></li>
                                        <li class="mega-parent"><a href="#">Danh mục</a>
                                            <div class="mega-menu-area clearfix">
                                                <div class="mega-menu-link mega-menu-link-4  f-left">
                                                <%
                                                String url = request.getContextPath()+"/san-pham/danh-muc/";
                                                %>	
                                                	<%!
                                        		//ArrayList<String> lcheck = new ArrayList();
                                        		public void CreatCat(List<Cat> arr,int id_parent,JspWriter outt,int stt,String url) throws java.io.IOException{
                                        			ArrayList<Cat> listcon = new ArrayList<Cat>();
                                        			for(int i =0; i < arr.size() ; i++){
                                        				if(arr.get(i).getId_parent() == id_parent){
                                        					listcon.add(arr.get(i));
                                        				}
                                        			}
                                        			if(!listcon.isEmpty()){
                                            			
                                        			for(Cat obj:listcon){
														if(stt == 0){
															outt.println("<ul class=\"single-mega-item\">");
                                            				outt.println("<li class=\"menu-title\"><a class=\"menu-title\" href=\""+url+obj.getId_cat()+"\">");
                                            			}
														else if(stt == 1){
															outt.println("<ul>");
                                        					outt.println("<li><a href=\""+url+obj.getId_cat()+"\">");
                                        				}
                                        				outt.println(obj.getNamec()+"</a>");
                                        				outt.println("</li>");
                                        				CreatCat(arr,obj.getId_cat(),outt,stt + 1,url);
                                        				outt.println("</ul>");
                                        			}
                                        			}
                                         		}
                                        	%>
                                        	<%
                                        		ArrayList<Cat> list = (ArrayList<Cat>) request.getAttribute("listCat");
                                        		CreatCat(list, 0,out,0,url);
                                        	%>
                                                    <ul class="single-mega-item">
                                                        <li class="menu-title"><a class="menu-title" href="">Elements 1</a></li>
                                                        <ul>
                                                        <li><a href="elements-header-1-sticky.html">header-1-sticky</a></li> </ul>
                                                        <ul><li><a href="elements-header-1-sticky.html">header-1-sticky</a></li>
                                                		 </ul>
                                                		 <ul>
                                                        <li><a href="elements-header-1-sticky.html">header-1-sticky</a></li> </ul>
                                                        <ul>
                                                        <li><a href="elements-header-1-sticky.html">header-1-sticky</a></li> </ul>
                                                    </ul>
                                                    
                                                     <ul class="single-mega-item">
                                                        <li class="menu-title">Elements 2</li>
                                                       <ul>
                                                        <li><a href="elements-header-1-sticky.html">header-1-sticky</a></li> </ul>
                                                        <ul>
                                                        <li><a href="elements-header-1-sticky.html">header-1-sticky</a></li> </ul>
                                                        <ul>
                                                        <li><a href="elements-header-1-sticky.html">header-1-sticky</a></li> </ul>
                                                        <ul>
                                                        <li><a href="elements-header-1-sticky.html">header-1-sticky</a></li> </ul>
                                                        
                                                    </ul>
                                                
                                                </div>
                                            </div>
                                        </li>
                                      	<li><a href="${pageContext.request.contextPath }/blogs">Kiến thức</a></li>
                                        
                                        <li><a href="blog.html">Sức khỏe</a>
                                            <ul class="dropdwn">
                                                
                                                <li>
                                                    <a href="${pageContext.request.contextPath }/bodyfat">Body Fat</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath }/foodnutrient">Bảng Dinh Dưỡng</a>
                                                </li>
                                                
                                            </ul>
                                        </li>
                                        
                                        
                                        <li>
                                            <a href="${pageContext.request.contextPath }/policy"">Chính sách</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath }/contact"">Liên hệ</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <style>
                            
                            	.top-search-box > select{
                            	background: #ffffff none repeat scroll 0 0;
								    border: medium none;
								    color: #999999;
								    float: left;
								    font-size: 13px;
								    height: 46%;
								    margin-top: 16px;
								    padding: 0;
								    position: absolute;
								    right: 62px;
								    width: 115px;
                            	}
                            	
                            	
                            </style>
                            
                            <!-- header-search & total-cart -->
                            <div class="col-md-2 col-sm-6 col-xs-12">
                                <div class="search-top-cart  f-right">
                                    <!-- header-search -->
                                    <%-- <div class="header-search f-left">
                                        <div class="header-search-inner">
                                           <button class="search-toggle">
                                            <i class="zmdi zmdi-search"></i>
                                           </button>
                                            <form action="javascript:void(0)" method="get">
                                                <div class="top-search-box">
                                                    <input type="text" id="txtsearch" name="search" placeholder="Tìm kiếm theo danh mục ...">
                                                    <select id="id_cat">
                                                    	<option value="0" selected="selected">Danh mục</option>
                                                    	<c:forEach items="${listcatbeaty }" var="objc">
                                                    		<option value="${objc.id_cat}">${objc.namec }</option>
                                                    	</c:forEach>
                                                    </select>
                                                    <button onclick="changeSearch()" type="submit">
                                                        <i class="zmdi zmdi-search"></i>
                                                    </button>
                                                </div>
                                            </form> 
                                        </div>
                                    </div>
                                     --%><script type="text/javascript">
                                    	function changeSearch() {
                                    		
                                    		var search = document.getElementById("txtsearch").value;
                                    		var id_cat = document.getElementById("id_cat").value;
                                    		//var urll = "${pageContext.request.contextPath}/san-pham/danh-muc/"+id_cat;
                                    		location.href = "${pageContext.request.contextPath}/san-pham/danh-muc/"+id_cat+"?search="+search;
										}
                                    </script>
                                    <style>
                                    	.vung1{
                                    	position: absolute;
										    background-color: #f90000db;
										    width: 21px;
										    border-radius: 23%;margin-left: 25px;margin-left: 117px;
										    margin-top: 17px;
                                    	}
                                    	#vung2{
                                    	padding-left: 4px;
										    color: #fbfbfb;
										    font-weight: bold;
                                    	
                                    	}
                                    </style>
                                    <!-- total-cart -->
                                    <div class="total-cart f-left">
                                        <div class="total-cart-in">
                                            <div class="cart-toggler">
                                            <div id="cartnum">
                                            <c:if test="${countCart > 0}">
                                           	<div class="vung1"><span id="vung2">${countCart }</span></div>
                                           	</c:if>
                                            </div>
                                                <a href="${pageContext.request.contextPath }/checkout/cart">
                                                    <span style="" class="cart-quantity"></span><br>
                                                    <span class="cart-icon">
                                                        <i class="zmdi zmdi-shopping-cart"> Giỏ hàng</i>
                                                                                     </span>
                                                </a>                            
                                            </div>
                                           </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- END HEADER AREA -->
        <!-- Button trigger modal -->
				
			