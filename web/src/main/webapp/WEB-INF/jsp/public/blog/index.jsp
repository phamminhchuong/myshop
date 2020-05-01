<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="/templates/taglib.jsp" %>
<!-- Start page content -->

<!-- SLIDE  -->
		<div style="margin-left: 120px;margin-bottom: 50px;margin-top: 10px" class="col-xl-6 col-lg-8 col-md-8 col-sm-8 col-8">
			  <div id="myCarousel" class="carousel slide" data-ride="carousel">
			    <!-- Indicators -->
			    <ol class="carousel-indicators">
			      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			      <li data-target="#myCarousel" data-slide-to="1"></li>
			      <li data-target="#myCarousel" data-slide-to="2"></li>
			    </ol>
			
			    <!-- Wrapper for slides -->
			    <div class="carousel-inner">
			      <div class="item active">
			        <img src="${pageContext.request.contextPath}/templates/public/images/customizer/bodybg/14.jpg" alt="Los Angeles" style="width:100%;height: 50%">
			      </div>
			
			      <div class="item">
			        <img src="${pageContext.request.contextPath}/templates/public/images/customizer/bodybg/15.jpg" alt="Chicago" style="width:100%;height: 50%">
			      </div>
			    
			      <div class="item">
			        <img src="${pageContext.request.contextPath}/templates/public/images/customizer/bodybg/16.jpg" alt="New york" style="width:100%;height: 50%">
			      </div>
			    </div>
			</div>
        </div>

		<!-- SLIDE  -->

        <div id="page-content" class="page-wrapper">

            <!-- BLOG SECTION START -->
            <div class="blog-section mb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-xs-12">
                            <div class="row">
                            
                            <c:if test="${not empty Search}"><c:set value="&search=${Search}" var="urlSearch"></c:set></c:if>
                            
                                <!-- blog-option start -->
                                <div class="col-md-12">
                                    <div class="shop-option box-shadow mb-30  clearfix">
                                        <!-- categories -->
                                        <div class="short-by f-left text-center">
                                        <form id="formSort" action="${pageContext.request.contextPath}/blogs" method="get">
                                        <span>Sắp xếp :</span>
                                        <c:if test="${not empty Search }">
                                        <input type="hidden" name="search" value="${Search }"></c:if>
                                        <select id="sort" name="sort" onchange="submitSort()">
                                            <option value="newBlog">Tin mới nhất</option>
                                            <option value="mostView">Nhiều lượt xem</option>
                                            <option value="mostComment">Nhiều bình luận</option>
                                        </select>
                                        </form>
                                        <input id="namesort" value="${Sort}" type="hidden">
                                    </div> 
                                        <!-- recent-product -->
                                        
                                    </div>
                                </div>
                                
                                <!-- blog-option end -->
                            </div>
                            <div class="row">
                            <c:forEach items="${listBlog }" var="objb">
                                <!-- blog-item start -->
                                <div class="col-sm-6 col-xs-12">
                                    <div class="blog-item-2">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="blog-image">
                                                    <a href="${pageContext.request.contextPath}/blogs/${slugUtil.makeSlug(objb.namebl) }/${objb.id_blog}"><img src="${pageContext.request.contextPath}/files/${objb.image}" alt="${objb.image}"></a>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="blog-desc">
                                                    <h5 class="blog-title-2"><a href="${pageContext.request.contextPath}/blogs/${slugUtil.makeSlug(objb.namebl) }/${objb.id_blog}">${objb.namebl}</a></h5>
                                                    <ul class="blog-meta">
														<li>
															<a href="#"><i style="color:blue" class="zmdi zmdi-eye"></i>${objb.count_view } Lượt xem</a>
														</li>
														<li><c:set value="" var="count_comment"></c:set>
															<c:forEach items="${MapComment }" var="objmc">
																<c:if test="${objmc.key eq objb.id_blog }">
																<c:set var="count_comment" value="${objmc.value }"></c:set>
																</c:if>
															</c:forEach>
															<a href="#"><i style="color:green" class="zmdi zmdi-comments"></i>${count_comment } Bình luận</a>
														</li>
													</ul>	
                                                    <p>${objb.content }</p>
                                                   <!--  <div style="border: 1px #9c9f9f solid;" class="read-more">
                                                        <a href="#">Read more</a>
                                                    </div> -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- blog-item end -->
                     		 </c:forEach>
                            </div>
                           
                            <div class="row">
		                        <div class="col-xs-12">
		                            <!-- shop-pagination start -->
		                            <c:if test="${curPage <= pageMin}"><c:set value="disabled" var="disLeft"></c:set> </c:if>
		                            <c:if test="${curPage >= totalPage}"><c:set value="disabled" var="disRight"></c:set> </c:if>
		                            <ul class="shop-pagination box-shadow text-right ptblr-10-30">
		                                <li class="${disLeft }"><a href="${pageContext.request.contextPath}/blogs/${i-1}?sort=${Sort}${urlSearch}"><i class="zmdi zmdi-chevron-left"></i></a></li>
		                                <c:forEach begin="${pageMin }" end="${pageMax }" var="i">
		                                	<c:if test="${i == curPage }"><c:set value="class='active'" var="active"></c:set></c:if>
		                                	<c:if test="${i != curPage }"><c:set value="" var="active"></c:set></c:if>
		                                	<li ${active }><a href="${pageContext.request.contextPath}/blogs/${i}?sort=${Sort}${urlSearch}">${i}</a></li>
		                                </c:forEach>
		                                <li class="${disRight }"><a href="${pageContext.request.contextPath}/blogs/${i+1}?sort=${Sort}${urlSearch}"><i class="zmdi zmdi-chevron-right"></i></a></li>
		                            </ul>
		                            <!-- shop-pagination end -->
		                        </div>
                    		</div>                          
                        </div>
                        <!-- sidebar -->
                        <div class="col-md-3 col-xs-12">
                            <!-- widget-search -->
                            <aside class="widget-search mb-30">
                                <form action="${pageContext.request.contextPath}/blogs" method="get">
                                    <input name="search" value="" type="text" placeholder="Tìm kiếm bài viết ở đây...">
                                    <button type="submit"><i class="zmdi zmdi-search"></i></button>
                                </form>
                            </aside>
                            <!-- widget-categories -->
                            <aside class="widget widget-categories box-shadow mb-30">
                                <h6 class="widget-title border-left mb-20">Quảng cáo</h6>
                                
                                <img style="margin-left: -25px;" alt="" src="${pageContext.request.contextPath}/templates/unnamed.gif">
                                  
                            </aside>
                            <!-- widget-color -->
                           
                        </div>
                    </div>
                </div>
            </div>
            <!-- BLOG SECTION END -->             
        </div>
        <!-- End page content -->