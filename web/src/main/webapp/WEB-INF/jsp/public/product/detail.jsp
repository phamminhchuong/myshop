 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- Start page content -->
        <%@include file="/templates/taglib.jsp" %>
         <style type="text/css">
                                            	.mybutton{
                                            	font-weight: bold;
											    background: #fff;
											    border: 1px solid #3a7cdf;
											    font-size: 12px;
											    color: #3584e4;
											    /* width: 99px; */
											    margin-top: -5px;
											    border-radius: 4px;
                                            	}
                                            	.mybutton:hover{
											    background: #3a7cdf;
											    color: white;
                                            	}
                                            	.activebtncolor,.activebtnsize{
                                            	 background: #3a7cdf;
											     color: white;
                                            	}
                                            	
                                            	.avatar-image{
                                            		display: block;
													background-repeat: no-repeat;
													background-size: cover;
													background-position: center center;
													width: 65px;
													height: 65px;
                                            	}
                                            	.avatar-letter{
	                                            	border-radius: 50%;
												    background: #e6d6e6;
												    color: #919090;
												    font-weight: 500;
												    width: 65px;
												    height: 65px;
												    display: inline-block;
												    text-align: center;
												    line-height: 65px;
												    font-size: 18px;
												    font-family: Roboto;
                                            	}
                                            	
                                            </style>
                                            
        <div style="height: 50px"></div>

            <!-- SHOP SECTION START -->
            <div class="shop-section mb-80">
            <section id="page-content" class="page-wrapper">

                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <!-- single-product-area start -->
                            <div class="single-product-area mb-80">
                                <div class="row">
                                    <!-- imgs-zoom-area start -->
                                    <div class="col-md-5 col-sm-5 col-xs-12">
                                        <div class="imgs-zoom-area">
                                            <img style="border: 1px #eeeeee solid;" id="zoom_03" src="${pageContext.request.contextPath}/files/${objimage.nameimg}" data-zoom-image="${pageContext.request.contextPath}/files/${objimage.nameimg}" alt="${objimage.nameimg}">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div id="gallery_01" class="carousel-btn slick-arrow-3 mt-30">
                                                    <c:forEach items="${listImage }" var="objimg">
                                                        <div class="p-c">
                                                            <a href="#" data-image="${pageContext.request.contextPath}/files/${objimg.nameimg}" data-zoom-image="${pageContext.request.contextPath}/files/${objimg.nameimg}">
                                                                <img class="zoom_03" src="${pageContext.request.contextPath}/files/${objimg.nameimg}" alt="${objimg.nameimg}">
                                                            </a>
                                                        </div>
                                                    </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- imgs-zoom-area end -->
                                    <!-- single-product-info start -->
                                    <div class="col-md-7 col-sm-7 col-xs-12"> 
                                        <div class="single-product-info">
                                            <h3 style="color:#211f1f" class="text-black-1">${objProduct.namepro }</h3>
                                            <!-- <h6 class="brand-name-2">brand name</h6> -->
                                            <div class="pro-rating sin-pro-rating f-left">
                                                    <c:forEach var="i" begin="1" end="5" step="1">
	                                                    <c:if test="${i <= objProduct.medium_rating}"> <c:set value="zmdi zmdi-star" var="actRating"></c:set></c:if>
	                                                    <c:if test="${i > objProduct.medium_rating}"> <c:set value="zmdi zmdi-star-outline" var="actRating"></c:set></c:if>
								                           <a href="#" tabindex="0"><i class="${actRating }"></i></a>
								                     </c:forEach>
                                                    <span class="text-black-5">( ${numberrating } đánh giá )</span>
                                                </div>
                                            <!-- hr -->
                                             <hr>
	                                            <!-- single-product-price -->
	                                           <c:if test="${objProduct.giakm > 0 }">
					                                        <h3 style="color:red" class="pro-price"><script>document.write(new Intl.NumberFormat().format(${objProduct.giakm}))</script>đ 
					                                        <span style="color:black;font-size: 20px;text-decoration: line-through;"><script>document.write(new Intl.NumberFormat().format(${objProduct.gia}))</script>đ</span></h3>
					                                        </c:if>
					                                        <c:if test="${objProduct.giakm == 0 }">
					                                        <h3 style="color:red" class="pro-price"><script>document.write(new Intl.NumberFormat().format(${objProduct.gia}))</script>đ</h3>
					                                        </c:if>
	                                            <!--  hr -->
	                                            <c:if test="${not empty listColor}">
                                            <hr>
                                            <!-- single-pro-color-rating -->
                                            <div class="single-pro-color-rating clearfix">
                                                <div class="sin-pro-color f-left">
                                                    <p class="color-title f-left">MÀU</p>
                                                    <div class="widget-color f-left">
                                                    <form id="formcolor">
                                                    <c:set value="1" var="checkcolor"></c:set>
                                                    <c:forEach items="${listColor }" var="objcolor" >
	                                                    <c:if test="${checkcolor eq 1}">
	                                                    	<c:set value="checked='checked'" var="checkc"></c:set>
	                                                    	<c:set value="activebtncolor" var="actc"></c:set>
	                                                    </c:if>
	                                                    <c:if test="${checkcolor eq 0}">
	                                                    	<c:set value="" var="checkc"></c:set>
	                                                    	<c:set value="" var="actc"></c:set>
	                                                    </c:if>
	                                                       <input hidden ${checkc} id="Color-${objcolor.id_color}" name="color" type="radio" value="${objcolor.id_color}" /><span onclick="checkRadioCOLOR(this,'Color-${objcolor.id_color}')" class="btn mybutton ${actc }">${objcolor.namecolor}</span>
	                                                       <c:set value="0" var="checkcolor"></c:set>
                                                    </c:forEach>
                                                    </form>
                                                    </div>
                                                    
                                                </div>
                                                
                                            </div>
                                            	</c:if>
                                            	<c:if test="${not empty listSize}">
                                             <hr>
                                            <div class="single-pro-color-rating clearfix">
                                                <div class="sin-pro-color f-left">
                                                    <p class="color-title f-left">SIZE</p>
                                                    <div class="widget-color f-left">
                                                    <form id="formsize">
	                                                     <c:set value="1" var="checksize"></c:set>
	                                                    <c:forEach items="${listSize }" var="objsize" >
		                                                    <c:if test="${checksize eq 1}">
		                                                    	<c:set value="checked='checked'" var="checks"></c:set>
		                                                    	<c:set value="activebtnsize" var="acts"></c:set>
		                                                    </c:if>
		                                                    <c:if test="${checksize eq 0}">
		                                                    	<c:set value="" var="checks"></c:set>
		                                                    	<c:set value="" var="acts"></c:set>
		                                                    </c:if>
		                                                       <input hidden ${checks} id="Size-${objsize.id_productsize}" name="size" type="radio" value="${objsize.namesize}" /><span onclick="checkRadioSIZE(this,'Size-${objsize.id_productsize}')" class="btn mybutton ${acts }">${objsize.namesize}</span>
		                                                       <c:set value="0" var="checksize"></c:set>
	                                                    </c:forEach>
                                                    </form>
                                                    </div>
                                                    
                                                </div>
                                                
                                            </div>
                                            </c:if>
                                            <script type="text/javascript">
                                                    	function checkRadioCOLOR(a,id) {
                                                    		document.getElementById(id).checked = true;
                                                    		//xóa toàn bộ active
                                                    		var list = document.getElementsByClassName("btn mybutton activebtncolor")
                                                    		for (i = 0; i < list.length; i++) {
                                                    			list[i].className = list[i].className.replace(/\activebtncolor\b/g, "");
                                                    			}
                                                    		//add actice cho button
                                                    		a.classList.add("activebtncolor");
														}
                                                    	function checkRadioSIZE(a,id) {
                                                    		document.getElementById(id).checked = true;
                                                    		//xóa toàn bộ active
                                                    		var list = document.getElementsByClassName("btn mybutton activebtnsize")
                                                    		for (i = 0; i < list.length; i++) {
                                                    			list[i].className = list[i].className.replace(/\activebtnsize\b/g, "");
                                                    			}
                                                    		//add actice cho button
                                                    		a.classList.add("activebtnsize");
														}
                                                    	function showvalue() {
                                                    		
                                                    		var a = document.querySelector('input[name="size"]:checked').value;
                                                    		alert(a);
														}
                                                    </script>
                                            <!-- hr -->
                                            <hr>
                                            <!-- plus-minus-pro-action -->
                                            <div class="clearfix">
                                               
                                                    <p class="color-title f-left">S.lượng</p>
                                                        
                                                        <!-- <input id="amount" type="text" value="1" name="qtybutton" class="cart-plus-minus-box"> -->
                                                        <div  class="form-group row ">
	                                                        <div class="col-xs-2 ">
	                                                        	<input id="hoho" data-bts-boostat="1" type="text" value="1" data-bts-min="1" class="input-sm" name="hoho">
	                                                        </div>
                                                        </div>
														<script>
														    $("input[name='hoho']").TouchSpin();
														</script>
                                              
                                              <div>
                                                    <ul style="    position: absolute;
    margin-top: -214px;
    margin-left: 450px;" class="action-button">
    														
                                                        <li id="like">
	                                                        <c:if test="${not empty haveLike }">
	                                                        	<a href="javascript:void(0)" style="background-color: #ff7f00;color: white;" onclick="addFavorite(${objProduct.id_pro},${userInfo.id_user })" title="Wishlist" tabindex="0"><i class="zmdi zmdi-favorite"></i></a>
	                                                       
	                                                        </c:if>
	                                                        <c:if test="${empty haveLike }">
	                                                        	<a href="javascript:void(0)" onclick="addFavorite(${objProduct.id_pro},${userInfo.id_user })" title="Wishlist" tabindex="0"><i class="zmdi zmdi-favorite"></i></a>
	                                                        </c:if>
                                                        </li>
                                                       
                                                    </ul>
                                                </div>
                                            </div>
                                              	<script type="text/javascript">
                                       			function addFavorite(idpro,iduser) {
													if(iduser == null){
														alertify.error("<i style='font-size:16px' class='fas fa-exclamation-triangle'></i> Bạn phải đăng nhập");
													}else{
														
														$.ajax({
					                              			url: '${pageContext.request.contextPath}/like',
					                              			type: 'POST',
					                              			cache: false,
					                              			data: {
					                              					id_pro: idpro,
					                              					id_user: iduser
					                              					},
					                              			success: function(data){
					                              				alertify.success("Thao tác thành công !");
					                              				$('#like').html(data);
					                              				/* var body = $("html, body");
					                              				body.stop().animate({scrollTop:0}, 500, 'swing', function() { 
					                              				   //alert("Finished animating");
					                              				}); */
					                              			},
					                              			error: function (jqXHR,error, errorThrown){
				                                                   alert("Something went wrong");
					                              			}
					                              		})
														
													}
												}
                                       </script>
                                        
	                                            <hr>
	                                            <p id="pErorr" style="color:red"></p>
												<div>
													<a onclick="addtoCart(${objProduct.id_pro})" href="javascript:void(0)" class="button extra-small button-black" tabindex="-1">
														<i style="background-color: #575757;font-size: 17px;padding-left: 27px;" class="zmdi zmdi-shopping-cart-plus"></i><span class="text-uppercase">Chọn mua sản phẩm</span>
													</a>
												</div>
                                        </div>    
                                    </div>
                                    <!-- single-product-info end -->
                                </div>
                                <div class="row">
                                	<div class="col-md-12">
                                		<hr>
                                            <!-- single-product-tab -->
                                            <div class="single-product-tab">
                                                <ul class="reviews-tab mb-20">
                                                   <li  class="active"><a style="color: #403f3f;font-weight: bold;" href="#description" data-toggle="tab">THÔNG TIN SẢN PHẨM</a></li>
												<li ><a style="color: #403f3f;font-weight: bold;" href="#information" data-toggle="tab">HƯỚNG DẪN</a></li>
												<li ><a style="color: #403f3f;font-weight: bold;" href="#reviews" data-toggle="tab">ĐÁNH GIÁ</a></li>
                                                </ul>
                                                <div class="tab-content">
                                                   <div role="tabpanel" class="tab-pane active" id="description">
													${objProduct.decription}
													</div>
                                                    <div role="tabpanel" class="tab-pane" id="information">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem, neque fugit inventore quo dignissimos est iure natus quis nam illo officiis,  deleniti consectetur non ,aspernatur.</p>
                                                        <p>rerum blanditiis dolore dignissimos expedita consequatur deleniti consectetur non exercitationem.</p>
                                                    </div>
                                                    <div role="tabpanel" class="tab-pane" id="reviews">
                                                        <!-- reviews-tab-desc -->
                                                        <div class="reviews-tab-desc">
	                                                        <c:forEach items="${listComment}" var="objcomment">
	                                                        <c:forEach items="${listUser }" var="objUser">
						                                    	<c:if test="${objcomment.id_user eq objUser.id_user}">
						                                    		<c:set value="${objUser.name }" var="nameUser"></c:set>
						                                    		<c:set value="${objUser.nameImage }" var="nameimage"></c:set>
						                                    	</c:if>
						                                    </c:forEach>
	                                                            <!-- single comments -->
	                                                            <div class="media mt-30">
	                                                                <div class="media-left">
		                                                                <div class="avatar-image" >
		                                                                    <span class="avatar-letter">${nameimage }</span>
		                                                                 </div>
	                                                                </div>
	                                                                <div class="media-body">
	                                                                    <div class="clearfix">
	                                                                        <div class="name-commenter pull-left">
	                                                                            <h6 style="color:#2f2e2e" class="media-heading"><a href="#">${nameUser}</a></h6>
	                                                                            <p class="mb-10">${objcomment.date_create }</p>
	                                                                        </div>
	                                                                        <div style="margin-top: -1px;margin-left: 10px;" class="pull-left">
	                                                                          <div class="pro-rating sin-pro-rating f-left">
	                                                                          <span style="" class="text-black-5">Đánh giá sản phẩm:</span>
	                                                                          		<c:forEach var="i" begin="1" end="5" step="1">
	                                                                          		<c:if test="${i <= objcomment.rating}"> <c:set value="zmdi zmdi-star" var="actRating"></c:set></c:if>
	                                                                          		<c:if test="${i > objcomment.rating}"> <c:set value="zmdi zmdi-star-outline" var="actRating"></c:set></c:if>
								                                                    	<a href="#" tabindex="0"><i class="${actRating }"></i></a>
								                                                    </c:forEach>
								                                                </div>
	                                                                        </div>
	                                                                    </div>
	                                                                    <p style="color:#131212" class="mb-0">${objcomment.content }</p>
	                                                                </div>
	                                                                
	                                                            </div>
	                                                             <c:forEach items="${listCommentSon}" var="objcomments">
	                                                             <c:if test="${objcomment.id_comment == objcomments.id_parent }">
			                                                        <c:forEach items="${listUser }" var="objUser">
								                                    	<c:if test="${objcomments.id_user eq objUser.id_user}">
								                                    		<c:set value="${objUser.name }" var="nameUserS"></c:set>
								                                    		<c:set value="${objUser.nameImage }" var="nameimageS"></c:set>
								                                    	</c:if>
								                                    </c:forEach>
	                                                             <div style="margin-left: 50px;background-color: #efeeeb" class="media mt-30">
	                                                                <div class="media-left">
		                                                                <div class="avatar-image" >
		                                                                    <span style="color: blue" class="avatar-letter">${nameimageS }</span>
		                                                                 </div>
	                                                                </div>
	                                                                <div class="media-body">
	                                                                    <div class="clearfix">
	                                                                        <div class="name-commenter pull-left">
	                                                                            <h6 style="color:#2f2e2e" class="media-heading"><a href="#">${nameUserS}</a></h6>
	                                                                            <p class="mb-10">${objcomments.date_create }</p>
	                                                                        </div>
	                                                                        <div style="margin-top: -1px;margin-left: 10px;" class="pull-left">
	                                                                          <div class="pro-rating sin-pro-rating f-left">
	                                                                          <span style="color: white;" class="btn btn-info">ADMIN</span>
	                                                                          		
								                                                </div>
	                                                                        </div>
	                                                                    </div>
	                                                                    <p style="color:#131212" class="mb-0">${objcomments.content }</p>
	                                                                </div>
	                                                                
	                                                            </div>
	                                                            </c:if>
	                                                           </c:forEach>
	                                                            <!-- single comments -->
	                                                        </c:forEach>
	                                                        
	                                                        
                                                       </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--  hr -->
                                	</div>
                                </div>
                                
                               
                                <div class="row">
                                 <hr>
                                	<div id="commentP">
                                <!-- leave your comment -->
							                                <div style="margin-top: 20px;" class="leave-comment">
							                                    <h4 class="blog-section-title border-left mb-30">ĐÁNH GIÁ CỦA BẠN</h4>
							                                    <div class="row">
							                                     	<span style="margin-left: 16px;">Đánh giá sản phẩm:</span>
								                                    <div style="color: #ff7f00;margin-left: 16px;font-size: 31px;" class="rating">
																	  <span class="zmdi zmdi-star-outline" id="star1" onclick="add(this,1)"></span>
																	  <span class="zmdi zmdi-star-outline" id="star2" onclick="add(this,2)"></span>
																	  <span class="zmdi zmdi-star-outline" id="star3" onclick="add(this,3)"></span>
																	  <span class="zmdi zmdi-star-outline" id="star4" onclick="add(this,4)"></span>
																	  <span class="zmdi zmdi-star-outline" id="star5" onclick="add(this,5)"></span>
																	  <span style="color:#b53030b5;" onclick="detroyRating()"><i class="zmdi zmdi-minus-circle"></i></span>
																	  
																	</div>
																</div>
																<span id="errorRating" style="color: red"></span>
							                                    <div class="row">
							                                    <span style="margin-left: 16px;">Nhận xét:</span>
							                                    <form id="formrating" action="javascript:void(0)">
							                                        <div class="col-md-12">
							                                            <textarea data-parsley-minlength='50' data-parsley-minlength-message='Bạn phải nhập trên 50 kí tự' required='required' data-parsley-required-message='Bạn phải nhập trường này' id="textrating" class="custom-textarea" placeholder="Nhập đánh giá của bạn ở đây..."></textarea>
							                                        </div>
							                                        <button onclick="getData(${objProduct.id_pro})" style="margin-left: 16px;" class="submit-btn-1 black-bg mt-30 btn-hover-2" >GỬI ĐÁNH GIÁ</button>
							                                    </form>
							                                    </div>
							                                </div>
							                                <!--  -->
							                                
							                              
							   </div>
							   </div>
                            </div>
                             			<script>
												function add(ths,sno){
													document.getElementById("errorRating").innerHTML = "";
												for (var i=1;i<=5;i++){
												var cur=document.getElementById("star"+i);
													cur.className="zmdi zmdi-star-outline";
												}
												
												for (var i=1;i<=sno;i++){
													var cur=document.getElementById("star"+i);
													if(cur.className=="zmdi zmdi-star-outline")
													{
														cur.className="zmdi zmdi-star";
													}
												}
												
											}
											
												function detroyRating() {
													for (var i=1;i<=5;i++){
														var cur=document.getElementById("star"+i);
															cur.className="zmdi zmdi-star-outline";
														}
												}
												
												function getData(id_product) {
													var rate = 0;
			                        				for (var i=1;i<=5;i++){
														var cur=document.getElementById("star"+i);
															if(cur.className==="zmdi zmdi-star"){
																rate = i;
															}
														}
			                        				if(rate == 0){
			                        					document.getElementById("errorRating").innerHTML = "Vui lòng chọn sao đánh giá";
			                        				}else{
													//alert(rate);
													$("#formrating").parsley();
				                        			if($("#formrating").parsley().isValid()) {
				                        				var textrating = document.getElementById("textrating").value;
				                        				
				                            		$.ajax({
				                              			url: '${pageContext.request.contextPath}/san-pham/rating',
				                              			type: 'POST',
				                              			cache: false,
				                              			data: {
				                              					//Dữ liệu gửi đi
				                              				rate: rate,
				                              				id_product: id_product,
				                              				textrating: textrating,
				                              					},
				                              			success: function(data){
				                              				alert("thành công !");
				                              				$('#commentP').html(data);
				                              			},
				                              			error: function (jqXHR,error, errorThrown){
				                              				if(jqXHR.status&&jqXHR.status==400){
				                              					document.getElementById("showLogin").click();
			                                               }else{
			                                                   alert("Something went wrong");
			                                               }
				                              			}
				                              		});
				                        			}
												}	
												
												}
												
										</script>
                                		<script type="text/javascript">
                                			function addtoCart(id_pro) {
                                				document.getElementById("pErorr").innerHTML = "";
                                				var amount = document.getElementById("hoho").value;
                                				var mau = 0;
                                				var size = "";
                                				if(document.querySelector('input[name="size"]')!=null){
                                					size = document.querySelector('input[name="size"]:checked').value;
                                				}
                                				if(document.querySelector('input[name="color"]') != null){
                                					mau = document.querySelector('input[name="color"]:checked').value;
                                				}
                                				$.ajax({
			                              			url: '${pageContext.request.contextPath}/addCart',
			                              			type: 'POST',
			                              			cache: false,
			                              			data: {
			                              					//Dữ liệu gửi đi
			                              				mau: mau,
			                              				size: size,
			                              				id_pro: id_pro,
			                              				amount:amount,
			                              					},
			                              			success: function(data){
			                              				//alert("thành công !");
			                              				alertify.success("<i style='font-size:16px' class='fas fa-check'></i> Thêm vào giỏ hàng thành công");
			                              				$.ajax({
					                              			url: '${pageContext.request.contextPath}/updateCountCart',
					                              			type: 'POST',
					                              			cache: false,
					                              			data: {
					                              					
					                              					},
					                              			success: function(data){
					                              				//alert("thành công !");
					                              				$('#cartnum').html(data);
					                              				var body = $("html, body");
					                              				body.stop().animate({scrollTop:0}, 500, 'swing', function() { 
					                              				   //alert("Finished animating");
					                              				});
					                              			},
					                              			error: function (jqXHR,error, errorThrown){
				                                                   alert("Something went wrong");
					                              			}
					                              		})
			                              			},
			                              			error: function (jqXHR,error, errorThrown){
			                              				if(jqXHR.status&&jqXHR.status==400){
			                              					$('#pErorr').html(jqXHR.responseText);
			                              					//document.getElementById("btn-error").click();
		                                               }else{
		                                                   alert("Something went wrong");
		                                               }
			                              			}
			                              		})
											}
                                		</script>
                            <!-- single-product-area end -->
                            <div class="related-product-area">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="section-title text-left mb-40">
                                            <h2 class="uppercase">SẢN PHẨM LIÊN QUAN</h2>
                                            <!-- <h6>There are many variations of passages of brands available,</h6> -->
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="active-related-product">
                                         <!-- product-item start -->
                                         <c:forEach items="${listProRelate }" var="objnewpro">
                                        <div class="col-xs-12">
                                       <div class="product-item" style="border: 1px #f6f6f6 solid;">
                                    <div class="product-img">
                                        <a href="${pageContext.request.contextPath }/san-pham/${slugUtil.makeSlug(objnewpro.namepro)}/${objnewpro.id_pro}">
                                            <c:forEach items="${listimage }" var="objim">
                                       				<c:if test="${objnewpro.id_pro == objim.id_product }">
                                       					<img alt="${objim.nameimg}" src="${pageContext.request.contextPath }/files/${objim.nameimg}">
                                       				</c:if>
                                       		</c:forEach>
                                        </a>
                                    </div>
                                    <div class="product-info">
                                        <h6 class="product-title">
                                            <a href="${pageContext.request.contextPath }/san-pham/${slugUtil.makeSlug(objnewpro.namepro)}/${objnewpro.id_pro}">${objnewpro.namepro}</a>
                                        </h6>
                                        <div class="pro-rating">
                                           <c:forEach var="i" begin="1" end="5" step="1">
	                                                    <c:if test="${i <= objnewpro.medium_rating}"> <c:set value="zmdi zmdi-star" var="actRating"></c:set></c:if>
	                                                    <c:if test="${i > objnewpro.medium_rating}"> <c:set value="zmdi zmdi-star-outline" var="actRating"></c:set></c:if>
								                           <a href="#" tabindex="0"><i class="${actRating }"></i></a>
								                     </c:forEach>
                                        </div>
                                        <c:if test="${objnewpro.giakm > 0 }">
                                        <h3 class="pro-price"><span onclick="changevnd(this)" class="money-change">${objnewpro.giakm }</span>đ 
                                        <span style="font-size: 20px;text-decoration: line-through;"><span onclick="changevnd(this)" class="money-change">${objnewpro.gia }</span>đ</span></h3>
                                        </c:if>
                                        <c:if test="${objnewpro.giakm == 0 }">
                                        <h3 class="pro-price"><span onclick="changevnd(this)" class="money-change">${objnewpro.gia }</span>đ</h3>
                                        </c:if>
                                       <!--  <ul class="action-button">
                                            <li>
                                                <a href="#" title="Wishlist"><i class="zmdi zmdi-favorite"></i></a>
                                            </li>
                                            <li>
                                                <a href="#" data-toggle="modal"  data-target="#productModal" title="Quickview"><i class="zmdi zmdi-zoom-in"></i></a>
                                            </li>
                                            <li>
                                                <a href="#" title="Compare"><i class="zmdi zmdi-refresh"></i></a>
                                            </li>
                                            <li>
                                                <a href="#" title="Add to cart"><i class="zmdi zmdi-shopping-cart-plus"></i></a>
                                            </li>
                                        </ul> -->
                                    </div>
                                   
                                    <!-- <span class="product-new-label">Sale</span> -->
                                    <c:if test="${objnewpro.giakm > 0 }">
                                    <fmt:parseNumber var = "phantram" integerOnly = "true" type = "number" value = "${ 100-(objnewpro.giakm*100)/objnewpro.gia}" />
									<span style="margin-left: 325px;" class="product-discount-label">-${phantram}%</span>
									</c:if>
                                </div>
                                    
                                        </div>
                                        <!-- product-item end -->
                                      </c:forEach>  
                                        
                                    </div>   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           
            <!-- SHOP SECTION END -->             

        </section>
        <!-- End page content -->
        
        </div>
        
        


        
        
        
        
       

        
        
        