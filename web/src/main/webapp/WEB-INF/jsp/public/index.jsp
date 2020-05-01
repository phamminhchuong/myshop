<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="/templates/taglib.jsp" %>
 <!-- Start page content -->
        <section id="page-content" class="page-wrapper">
            <!-- FEATURED PRODUCT SECTION START -->
            <div class="featured-product-section mb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-title text-center mb-50">
                                <h2 class="uppercase">SẢN PHẨM GIÁ TỐT</h2>
                            </div>
                        </div>
                    </div>
                    <div class="featured-product">
                        <div class="row active-featured-product slick-arrow-2">
                            <!-- product-item start -->
                             
                            <c:forEach items="${listMostDiscountProduct }" var="objnewpro">
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
                                        <h3 class="pro-price"><span style="color:red" onclick="changevnd(this)" class="money-change">${objnewpro.giakm }</span><span style="color:red">đ</span>
                                        <span style="font-size: 20px;text-decoration: line-through;"><span onclick="changevnd(this)" class="money-change">${objnewpro.gia }</span>đ</span></h3>
                                        </c:if>
                                        <c:if test="${objnewpro.giakm == 0 }">
                                        <h3 class="pro-price"><span onclick="changevnd(this)" class="money-change">${objnewpro.gia }</span>đ</h3>
                                        </c:if>
                                        <!-- <ul class="action-button">
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
									<span class="product-discount-label">-${phantram}%</span>
									</c:if>
                                </div>
                            </div>
                            <!-- product-item end -->
                            </c:forEach>
                            <!-- product-item start -->
                           
                        </div>
                    </div>          
                </div>            
            </div>
            <!-- FEATURED PRODUCT SECTION END -->




            <!-- PRODUCT TAB SECTION START -->
            <div class="product-tab-section mb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="section-title text-center mb-0">
                                <h2 class="uppercase">TỔNG HỢP SẢN PHẨM</h2>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="pro-tab-menu text-center">
                                <!-- Nav tabs -->
                                <ul class="" >
                                    <li class="active"><a href="#popular-product" data-toggle="tab">SẢN PHẨM MỚI</a></li>
                                    <li><a href="#new-arrival" data-toggle="tab">SẢN PHẨM BÁN CHẠY</a></li>
                                    <li><a href="#best-seller"  data-toggle="tab">SẢN PHẨM GẦN HẾT HÀNG</a></li>
                                </ul>
                            </div>                       
                        </div>
                    </div>
                    <div class="product-tab">
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <!-- popular-product start -->
                            <div class="tab-pane active" id="popular-product">
                                <div class="row">
                                <c:forEach items="${listnewpro }" var="objnewpro">
                                    <!-- product-item start -->
                                    <div class="col-md-3 col-sm-4 col-xs-12">
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
                                        <h3 class="pro-price"><span style="color:red" onclick="changevnd(this)" class="money-change">${objnewpro.giakm }</span><span style="color:red">đ</span>
                                        <span style="font-size: 20px;text-decoration: line-through;"><span onclick="changevnd(this)" class="money-change">${objnewpro.gia }</span>đ</span></h3>
                                        </c:if>
                                        <c:if test="${objnewpro.giakm == 0 }">
                                        <h3 class="pro-price"><span onclick="changevnd(this)" class="money-change">${objnewpro.gia }</span>đ</h3>
                                        </c:if>
                                        <!-- <ul class="action-button">
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
									<span class="product-discount-label">-${phantram}%</span>
									</c:if>
                                </div>
                                    </div>
                                    <!-- product-item end -->
                       </c:forEach>
                                </div>
                            </div>
                            <!-- popular-product end -->
                            <!-- new-arrival start -->
                            <div class="tab-pane" id="new-arrival">
                                <div class="row">
                                    
                                    
                                    
                                    <c:forEach items="${listProductBestSeller }" var="objnewpro">
                                    <!-- product-item start -->
                                    <div class="col-md-3 col-sm-4 col-xs-12">
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
                                        <h3 class="pro-price"><span style="color:red" onclick="changevnd(this)" class="money-change">${objnewpro.giakm }</span><span style="color:red">đ</span>
                                        <span style="font-size: 20px;text-decoration: line-through;"><span onclick="changevnd(this)" class="money-change">${objnewpro.gia }</span>đ</span></h3>
                                        </c:if>
                                        <c:if test="${objnewpro.giakm == 0 }">
                                        <h3 class="pro-price"><span onclick="changevnd(this)" class="money-change">${objnewpro.gia }</span>đ</h3>
                                        </c:if>
                                        <!-- <ul class="action-button">
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
									<span class="product-discount-label">-${phantram}%</span>
									</c:if>
                                </div>
                                    </div>
                                    <!-- product-item end -->
                       </c:forEach>
                               
                                </div>                                        
                            </div>
                            <!-- new-arrival end -->
                            <!-- best-seller start -->
                            <div class="tab-pane" id="best-seller">
                                <div class="row">
                                    <!-- product-item start -->
                                    <c:forEach items="${listProductAlmostOver }" var="objnewpro">
                                    <!-- product-item start -->
                                    <div class="col-md-3 col-sm-4 col-xs-12">
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
                                        <h3 class="pro-price"><span style="color:red" onclick="changevnd(this)" class="money-change">${objnewpro.giakm }</span><span style="color:red">đ</span>
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
									<span class="product-discount-label">-${phantram}%</span>
									</c:if>
                                </div>
                                    </div>
                                    <!-- product-item end -->
                       </c:forEach>
                                </div>                                        
                            </div>
                            <!-- best-seller end -->
                            
                        </div>
                        <style>
                        .mybutton{				padding-left: 71px;
    padding-right: 71px;
    /* font-weight: bold; */
    margin-left: 480px;
                                            	font-weight: bold;
											    background: #fff;
											    border: 1px solid #ffaa34;
											    font-size: 12px;
											    color: #ffaa34;
											    /* width: 99px; */
											    margin-top: -5px;
											    border-radius: 4px;
                                            	}
                                            	.mybutton:hover{
											    background: #ffaa34;
											    color: white;
                                            	}
                        </style>
                        <button class="btn mybutton" onclick="location.href='${pageContext.request.contextPath }/san-pham/danh-muc/0'"> XEM THÊM </button>
                    </div>
                </div>
            </div>
            <!-- PRODUCT TAB SECTION END -->
			
            <!-- BLOG SECTION START -->
            <div class="blog-section mb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="section-title text-center mb-50">
                                <h2 class="uppercase">Bài viết mới nhất</h2>
                                <h6>Các bài viết về thể thao, sức khỏe, chia sẻ kiến thức</h6>
                            </div>
                        </div>
                    </div>
                    <div id="valuea" class="blog">
                        <div class="row">
                        <c:forEach items="${listBlog }" var="objBlog">
                            	<!-- blog-item start -->
							<div class="col-sm-6 col-xs-12">
								<div class="blog-item-2">
									<div id="dataview" class="row">
										<div class="col-md-6 col-xs-12">
											<div class="blog-image">
												<a href="${pageContext.request.contextPath}/blogs/${slugUtil.makeSlug(objBlog.namebl) }/${objBlog.id_blog}"><img width="262px" height="212px" src="${pageContext.request.contextPath}/files/${objBlog.image}" alt="${objBlog.image}"></a>
											</div>
										</div>
										<div class="col-md-6 col-xs-12">
											<div class="blog-desc">
												<ul class="blog-meta">
													<li>
														<a href="#"><i style="color:red" class="zmdi zmdi-eye"></i>${objBlog.count_view } lượt xem</a>
													</li>
													<li><c:set value="" var="count_comment"></c:set>
															<c:forEach items="${mapComment }" var="objmc">
																<c:if test="${objmc.key eq objBlog.id_blog }">
																<c:set var="count_comment" value="${objmc.value }"></c:set>
																</c:if>
															</c:forEach>
														<a href="#"><i style="color:green" class="zmdi zmdi-comments"></i>${count_comment } Bình luận</a>
													</li>
												</ul>		
												<h5 class="blog-title-2"><a href="${pageContext.request.contextPath}/blogs/${slugUtil.makeSlug(objBlog.namebl) }/${objBlog.id_blog}">${objBlog.namebl }</a></h5>
												<p >${objBlog.content}</p>
												<div class="read-more">
													<a href="${pageContext.request.contextPath}/blogs/${slugUtil.makeSlug(objBlog.namebl) }/${objBlog.id_blog}">Read more</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- blog-item end -->
						</c:forEach>
						
                        </div>
                        </div>
                    <button id="btn" class="btn mybutton" onclick="moreViewBlog()"><i class="fas fa-angle-double-down">    </i> XEM THÊM <i class="fas fa-angle-double-down">    </i></button>
                   	
                   <script type="text/javascript">
                   		var dataRe = 1;
                   		function moreViewBlog() {
                   			document.getElementById("btn").innerHTML = "Loading...";
                   			$.ajax({
                      			url: '${pageContext.request.contextPath}/moreViewBLog',
                      			type: 'POST',
                      			cache: false,
                      			data: {
                      					//Dữ liệu gửi đi
                      					dataRe:dataRe,
                      					},
                      			success: function(data){
                      				//alert("thành công !");
                      				//$('#valuea').html(data);
                      				dataRe = dataRe + 1;
                      				$('#valuea').append(data);
                      				document.getElementById("btn").innerHTML = "<i class='fas fa-angle-double-down'>    </i> XEM THÊM <i class='fas fa-angle-double-down'>    </i>";
                      				
                      			},
                      			error: function (){
                      			alert("Lỗi rồi!");
                      			}
                      		});
						}
                   </script>
                    
                </div>
            </div>
            <!-- BLOG SECTION END -->                
        </section>
        <!-- End page content -->