<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- Start page content -->
        <%@include file="/templates/taglib.jsp" %>
        <div style="height: 50px"></div>
        <div id="page-content" class="page-wrapper">

            <!-- SHOP SECTION START -->
            <div class="shop-section mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-md-push-3 col-xs-12">
                            <div class="shop-content">
                            <c:if test="${not empty search }">
                            <h3>Kết quả tìm kiếm cho '${search }': <span style="color:#08040466">${totalPro } Kết quả</span></h3>
                            </c:if>
                             <c:if test="${empty search }">
                            <h3>Kết quả : <span style="color:#08040466">${totalPro } Kết quả</span></h3>
                            </c:if>
                                <!-- shop-option start -->
                                <div class="shop-option box-shadow mb-30 clearfix">
                                    <!-- Nav tabs -->
                                    <ul class="shop-tab f-left" role="tablist">
                                        <li class="active">
                                            <a href="#grid-view" data-toggle="tab"><i class="zmdi zmdi-view-module"></i></a>
                                        </li>
                                        <li>
                                            <a href="#list-view" data-toggle="tab"><i class="zmdi zmdi-view-list-alt"></i></a>
                                        </li>
                                    </ul>
                                    <!-- short-by -->
                                    <div class="short-by f-left text-center">
                                      <form id="formSort" action="${pageContext.request.contextPath}/san-pham/danh-muc/${id_cat}" method="get">
                                        <span>Sắp xếp :</span>
                                        <c:if test="${not empty search }">
                                        <input type="hidden" name="search" value="${search }"></c:if>
                                        <c:if test="${not empty from }">
                                        <input type="hidden" name="slidefrom" value="${from }"></c:if>
                                        <c:if test="${not empty to }">
                                        <input type="hidden" name="slideto" value="${to }"></c:if>
                                        <select id="sort" name="sort" onchange="submitSort()" onchange="submitSort()">
                                        	<option value="">--Chọn--</option>
                                            <option value="newItem">Sản phẩm mới</option>
                                            <option value="bestSell">Sản phẩm bán chạy</option>
                                            <option value="bestSale">Sản phẩm giảm giá nhiều</option>
                                            <option value="lowPrice">Sản phẩm giá thấp</option>
                                            <option value="highPrice">Sản phẩm giá cao</option>
                                        </select>
                                        </form>
                                        <input id="namesort" value="${sort}" type="hidden"> 
                                    </div> 
                                   
                                    
                                                   
                                </div>
                                <!-- shop-option end -->
                                <!-- Tab Content start -->
                                <c:if test="${not empty listproduct or listproduct.size() != 0}">
                                <div class="tab-content">
                                    <!-- grid-view -->
                                    <div role="tabpanel" class="tab-pane active" id="grid-view">
                                        <div class="row">
                                        <c:forEach items="${listproduct}" var="objp">                                            <!-- product-item start -->
                                            <div class="col-md-4 col-sm-4 col-xs-12">
                                                <div class="product-item" style="border: 1px #f6f6f6 solid;">
                                                    <div class="product-img">
                                                    
                                                        <a href="${pageContext.request.contextPath }/san-pham/${slugUtil.makeSlug(objp.namepro)}/${objp.id_pro}">
                                                        <c:forEach items="${listimage }" var="objim">
                                       				<c:if test="${objp.id_pro == objim.id_product }">
                                       					<img alt="${objim.nameimg}" src="${pageContext.request.contextPath }/files/${objim.nameimg}">
                                       				</c:if>
                                       			</c:forEach>
                                                        </a>
                                                    </div>
                                                    <div class="product-info">
                                                        <h6 class="product-title">
                                                            <a href="${pageContext.request.contextPath }/san-pham/${slugUtil.makeSlug(objp.namepro)}/${objp.id_pro}">${objp.namepro} </a>
                                                        </h6>
                                                        <div class="pro-rating">
                                                            <c:forEach var="i" begin="1" end="5" step="1">
	                                                    <c:if test="${i <= objp.medium_rating}"> <c:set value="zmdi zmdi-star" var="actRating"></c:set></c:if>
	                                                    <c:if test="${i > objp.medium_rating}"> <c:set value="zmdi zmdi-star-outline" var="actRating"></c:set></c:if>
								                           <a href="#" tabindex="0"><i class="${actRating }"></i></a>
								                     </c:forEach>
                                                        </div>
                                                       <c:if test="${objp.giakm > 0 }">
					                                        <h3 class="pro-price"><span style="color:red" onclick="changevnd(this)" class="money-change">${objp.giakm }</span><span style="color:red">đ</span>
					                                        <span style="font-size: 20px;text-decoration: line-through;"> <span onclick="changevnd(this)" class="money-change">${objp.gia } </span>đ</span> </h3>
					                                        </c:if>
					                                        <c:if test="${objp.giakm == 0 }">
					                                        <h3 class="pro-price"><span onclick="changevnd(this)" class="money-change">${objp.gia }</span>đ</h3>
					                                        </c:if>
                                                        
                                                        <%-- <ul class="action-button">
                                                            <li id="like-${objp.id_pro }">
                                                            <c:if test="${not empty userInfo}">
                                                            	<c:if test="${not empty userInfo}">
                                                            	
                                                            	</c:if>
                                                            </c:if>
                                                                <a href="javascript:void(0)" onclick="addFavorite(${objp.id_pro},${userInfo.id_user })" title="Wishlist"><i class="zmdi zmdi-favorite"></i></a>
                                                            </li>
                                                        </ul> --%>
                                                    </div>
                                                    <!-- <span class="product-new-label">Sale</span> -->
					                                    <c:if test="${objp.giakm > 0 }">
					                                    <fmt:parseNumber var = "phantram" integerOnly = "true" type = "number" value = "${ 100-(objp.giakm*100)/objp.gia}" />
														<span class="product-discount-label">-${phantram}%</span>
														</c:if>
                                                </div>
                                            </div>
                                            <!-- product-item end -->
                                       </c:forEach>
                                       
                                       </div>
                                    </div>
                                    <!-- list-view -->
                                    <div role="tabpanel" class="tab-pane" id="list-view">
                                        <div class="row">
                                            <!-- product-item start -->
                                            <div class="col-md-12">
                                                <div class="shop-list product-item">
                                                    <div class="product-img">
                                                        <a href="single-product.html">
                                                            <img src="img/product/7.jpg" alt=""/>
                                                        </a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="clearfix">
                                                            <h6 class="product-title f-left">
                                                                <a href="single-product.html">Dummy Product Name </a>
                                                            </h6>
                                                            <div class="pro-rating f-right">
                                                                <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                                <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                                <a href="#"><i class="zmdi zmdi-star"></i></a>
                                                                <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                                                                <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                                                            </div>
                                                        </div>
                                                        <h6 class="brand-name mb-30">Brand Name</h6>
                                                        <h3 class="pro-price">$ 869.00</h3>
                                                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>
                                                        <ul class="action-button">
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
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- product-item end -->
                                            
                                        </div>                                        
                                    </div>
                                </div>
                                <!-- Tab Content end -->
                                <!-- shop-pagination start -->
		                            <c:if test="${curPage <= pageMin}"><c:set value="disabled" var="disLeft"></c:set> </c:if>
		                            <c:if test="${curPage >= totalPage}"><c:set value="disabled" var="disRight"></c:set> </c:if>
		                            <!-- nếu có search -->
		                            <c:if test="${not empty search }">
		                            	<c:set value="?search=${search }" var="Search"></c:set>
		                            	<c:if test="${not empty from and not empty to}">
		                            		<c:set value="&slidefrom=${from }" var="slidefrom"></c:set>
		                            		<c:set value="&slideto=${to }" var="slideto"></c:set>
		                            	</c:if>
		                            	 <c:if test="${not empty sort }">
		                            		<c:set value="&sort=${sort }" var="Sort"></c:set>
		                                </c:if>
		                            </c:if>
		                           <c:if test="${empty search }">
		                            	<c:if test="${not empty from and not empty to}">
		                            		<c:set value="?slidefrom=${from }" var="slidefrom"></c:set>
		                            		<c:set value="&slideto=${to }" var="slideto"></c:set>
		                            		<c:if test="${not empty sort }">
		                            		<c:set value="&sort=${sort }" var="Sort"></c:set>
		                                	</c:if>
		                            	</c:if>
		                            	<c:if test="${empty from and empty to}">
		                            		
		                            		<c:if test="${not empty sort }">
		                            		<c:set value="?sort=${sort }" var="Sort"></c:set>
		                                </c:if>
		                            	</c:if>
		                            	 
		                            </c:if>
		                            
		                            <ul class="shop-pagination box-shadow text-right ptblr-10-30">
		                                <li class="${disLeft }"><a href="${pageContext.request.contextPath}/san-pham/danh-muc/${id_cat }/${i-1}${Search}${slidefrom}${slideto}${Sort}"><i class="zmdi zmdi-chevron-left"></i></a></li>
		                                <c:forEach begin="${pageMin }" end="${pageMax }" var="i">
		                                	<c:if test="${i == curPage }"><c:set value="class='active'" var="active"></c:set></c:if>
		                                	<c:if test="${i != curPage }"><c:set value="" var="active"></c:set></c:if>
		                                	
		                                	<li ${active }><a href="${pageContext.request.contextPath}/san-pham/danh-muc/${id_cat }/${i}${Search}${slidefrom}${slideto}${Sort}">${i}</a></li>
		                                </c:forEach>
		                                <li class="${disRight }"><a href="${pageContext.request.contextPath}/san-pham/danh-muc/${id_cat }/${i+1}${Search}${slidefrom}${slideto}${Sort}"><i class="zmdi zmdi-chevron-right"></i></a></li>
		                            </ul>
		                            <!-- shop-pagination end -->
		                            </c:if>
		                            <c:if test="${empty listproduct or listproduct.size() == 0}">
		                            	<h3>Không tìm thấy sản phẩm nào !!</h3>
		                            </c:if>
                            </div>
                        </div>
                        <div class="col-md-3 col-md-pull-9 col-xs-12">
                            <!-- widget-search -->
                            <aside class="widget-search mb-30">
                                <form action="${pageContext.request.contextPath}/san-pham/danh-muc/${id_cat}" method="get">
                                    <input name="search" type="text" placeholder="Tìm kiếm...">
                                    <button  type="submit"><i class="zmdi zmdi-search"></i></button>
                                </form>
                            </aside>
                            <!-- shop-filter -->
                            <aside class="widget shop-filter box-shadow mb-30">
                                <h6 class="widget-title border-left mb-20">Giá</h6>
                                <div class="price_filter">
                                    <form action="${pageContext.request.contextPath}/san-pham/danh-muc/${id_cat}" method="get">
									<div class="row">
									
									<c:if test="${not empty search }">
										<input type="hidden" name="search" value="${search}">
									</c:if>
									
									<div class="col-sm-6">
										<input type="text" name="slidefrom" oninput="changeMoney()" id="slidefrom">
									</div>
									<span style="position: absolute;
									    margin-top: 6px;
									    margin-left: -2px;">-</span>
                                    	<div class="col-sm-6">
										<input type="text" name="slideto" oninput="changeMoney()" id="slideto">
									</div>
									</div>
										<input style="font-weight: bold;
										background: #fff;
										border: 1px solid #ff7f00;
										font-size: 12px;
										color: #ff7f00;
										width: 99px;
										margin-top: 8px;
										border-radius: 4px;" class="btn" type="submit" value="OK">
									</form>
                                </div>
                            </aside>
                            <script type="text/javascript">
                            	
                            		function changeMoney() { 	
                            			var slidefrom = document.getElementById("slidefrom").value;
                            			var slidef = slidefrom.split(".").join("");
                            			var slideto = document.getElementById("slideto").value;
                            			var slidet = slideto.split(".").join("");
                            			document.getElementById("slidefrom").value = new Intl.NumberFormat().format(slidef);
                            			document.getElementById("slideto").value = new Intl.NumberFormat().format(slidet);
								}
                            </script>
                            <!-- widget-color -->
                        <aside class="widget operating-system box-shadow mb-30">
                                <h6 class="widget-title border-left mb-20">CHỌN MÀU</h6>
                                <form action="">
                                <c:forEach items="${listColor }" var="objcl">
                                    <label><input type="checkbox" name="listmau" value="${objcl.id_color }">${objcl.namecolor }</label><br>
                     			</c:forEach>               
                                </form>
                            </aside>
                            <!-- operating-system -->
                            <aside class="widget operating-system box-shadow mb-30">
                                <h6 class="widget-title border-left mb-20">operating system</h6>
                                <form action="https://demo.hasthemes.com/subas-preview/subas/action_page.php">
                                    <label><input type="checkbox" name="operating-1" value="phone-1">Windows Phone</label><br>
                                    <label><input type="checkbox" name="operating-1" value="phone-1">Bleckgerry ios</label><br>
                                    <label><input type="checkbox" name="operating-1" value="phone-1">Android</label><br>
                                    <label><input type="checkbox" name="operating-1" value="phone-1">ios</label><br>
                                    <label><input type="checkbox" name="operating-1" value="phone-1">Windows Phone</label><br>
                                    <label><input type="checkbox" name="operating-1" value="phone-1">Symban</label><br>
                                    <label class="mb-0"><input type="checkbox" name="operating-1" value="phone-1">Bleckgerry os</label><br>
                                </form>
                            </aside>
                            </div>
                    </div>
                </div>
            </div>
            <!-- SHOP SECTION END -->
        </div>
        <!-- End page content -->