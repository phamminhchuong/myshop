<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<!doctype html>
<html class="no-js" lang="en">


<!-- Mirrored from demo.hasthemes.com/subas-preview/subas/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 27 Jun 2019 07:20:54 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Subas || Home-3</title>
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
    <!-- header checkout -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/mycss.css">
    
    <!-- Responsive css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/responsive.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/templates/admin/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
      	<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/public/font-awesome.min.css">
    <!-- User style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/custom.css">
    
    <!-- Style customizer (Remove these two lines please) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/style-customizer.css">
    <link href="#" data-style="styles" rel="stylesheet">
	
	    <script src="${pageContext.request.contextPath }/templates/public/js/vendor/jquery-3.1.1.min.js"></script>
		  <script src="${pageContext.request.contextPath }/templates/public/jquery.bootstrap-touchspin.js"></script>
    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath }/templates/public/js/vendor/modernizr-2.8.3.min.js"></script>
    

    
    <script src="https://www.paypalobjects.com/api/checkout.js"></script> 
    
</head>

<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v6.0&appId=2825838157463355&autoLogAppEvents=1"></script>

    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->  

    <!-- Body main wrapper start -->
    <div class="wrapper">
				<style>
				
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
                            	
                            	input[type="radio"]{
                            	 width: 5%;
                            	 height: 40px;
                            	}
                            	select{
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
        <!-- START HEADER AREA -->
        <!-- START HEADER AREA -->
        <header class="header-area header-wrapper">
            <!-- header-top-bar -->
            <div class="header-top-bar plr-185">
                <div class="container-fluid">
                    <div class="row">
					
					
					
					
					
					
					</div>
				</div>
            </div>
            <!-- header-middle-area -->
            <div class="header-middle-area plr-185">
                <div class="container-fluid">
                    <div class="full-width-mega-dropdown">
                        <div class="col-md-2 col-sm-6 col-xs-12">
                                <div style="padding: 8px 0;" class="logo">
                                    <a href="${pageContext.request.contextPath }">
                                        <img style="width: 109px;height: 91px;" src="${pageContext.request.contextPath }/templates/icon1.png" alt="main logo">
                                    </a>
                                </div>
                            </div>
						<div class="row bs-wizard" style="border-bottom:0;">
							  <div class="col-xs-3 bs-wizard-step ${loginDone }"><!-- complete -->
							  <div class="text-center bs-wizard-stepnum">Đăng nhập</div>
							  <div class="progress"><div class="progress-bar"></div></div>
							  <a href="#" class="bs-wizard-dot"></a>
							  </div>
							
							<div class="col-xs-3 bs-wizard-step ${addressDone }"><!-- complete -->
							  <div class="text-center bs-wizard-stepnum">Địa chỉ giao hàng</div>
							  <div class="progress"><div class="progress-bar"></div></div>
							  <a href="#" class="bs-wizard-dot"></a>
							  </div>
							
							<div class="col-xs-3 bs-wizard-step ${ttDone }"><!-- active -->
							  <div class="text-center bs-wizard-stepnum">Thanh toán</div>
							  <div class="progress"><div class="progress-bar"></div></div>
							  <a href="#" class="bs-wizard-dot"></a>
							 </div>
						</div>
				
					</div>
                </div>
            </div>
        </header>
        <!-- END HEADER AREA -->
