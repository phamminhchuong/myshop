<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@include file="/templates/taglib.jsp" %>
 <section id="page-content" class="page-wrapper">
						<style>
						
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
            <!-- BLOG SECTION START -->
            <div class="blog-section mb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-xs-12">
                            <div class="blog-details-area">
                                <!-- blog-details-photo -->
                                <div class="blog-details-photo bg-img-1 p-20 mb-30">
                                    <img src="${pageContext.request.contextPath}/files/${objBlog.image}" alt="${objBlog.image}">
                                    <div class="today-date bg-img-1">
                                        <span class="meta-date">${objBlog.day}</span>
                                        <span class="meta-month">${objBlog.month}/${objBlog.year}</span>
                                    </div>
                                </div>
                                <!-- blog-like-share -->
                                <ul class="blog-like-share mb-20">
                                    <li>
                                        <a style="color: green;" href="#"><i class="zmdi zmdi-favorite"></i>${objBlog.count_view } Lượt xem</a>
                                    </li>
                                     <li>
                                        <a  style="color: green;" href="#"><i class="zmdi zmdi-eye"></i>${objBlog.count_like } Lượt thích</a>
                                    </li>
                                    <li>
                                        <a  style="color: green;" href="#"><i class="zmdi zmdi-comments"></i>${count_comment } Bình luận</a>
                                    </li>
                                    
                                </ul>
                                <!-- blog-details-title -->
                                <h3 class="blog-details-title mb-30">${objBlog.namebl }</h3>
                                <!-- blog-description -->
                                <div class="blog-description mb-60">
                                	${objBlog.content}   
                                </div>
                                <!-- blog-share-tags -->
                                <div class="blog-share-tags box-shadow clearfix mb-60">
                                    <div class="blog-share f-right">
                                    <div id="arealike" style="display: inline;">
                                    	<c:if test="${not empty haveLike }">
                                        <a class="btn btn-primary" onclick="addFavorite(${objBlog.id_blog })" href="javascript:void(0)" title="Facebook"><span style="color:black">${objBlog.count_like }</span>| Like <i style="color: red" class="zmdi zmdi-favorite"></i></a>
                                    	</c:if>
                                    	<c:if test="${empty haveLike }">
                                        <a class="btn btn-primary" onclick="addFavorite(${objBlog.id_blog })" href="javascript:void(0)" title="Facebook"><span style="color:black">${objBlog.count_like }</span>| Like <i class="zmdi zmdi-favorite"></i></a>
                                    	</c:if>
                                    </div>
                                    <p class="share-tags-title f-left">Bấm Like nếu bạn thấy bài viết hay</p>
                                    </div>
                                  
                                </div>
                               
                               
                               <script type="text/javascript">
                                       			function addFavorite(idblog) {
													
														$.ajax({
					                              			url: '${pageContext.request.contextPath}/like',
					                              			type: 'POST',
					                              			cache: false,
					                              			data: {
					                              				id_blog: idblog
					                              					
					                              					},
					                              			success: function(data){
					                              				
					                              				alertify.success("Thao tác thành công !");
					                              				$('#arealike').html(data);
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
												
                                       </script>
                                        
	                                           
                               
                               
                                <!-- comments on t this post -->
                                <div id="comment">
                                <div class="post-comments mb-60">
                                    <h4 class="blog-section-title border-left mb-30">BÌNH LUẬN VỀ BÀI VIẾT</h4>
                                    <!-- single-comments -->
                                    <c:forEach items="${listCommentFather }" var="objF">
                                    <c:forEach items="${listUser }" var="objUser">
                                    	<c:if test="${objF.id_user eq objUser.id_user}">
                                    		<c:set value="${objUser.name }" var="nameUserF"></c:set>
                                    		<c:set value="${objUser.nameImage }" var="nameimage"></c:set>
                                    	</c:if>
                                    </c:forEach>
                                    <div class="media mt-30">
                                         <div class="media-left">
		                                       <div class="avatar-image" >
		                                           <span class="avatar-letter">${nameimage }</span>
		                                        </div>
	                                     </div>
                                        <div class="media-body">
                                            <div class="clearfix">
                                                <div class="name-commenter f-left">
                                                    <h6 class="media-heading"><a href="#">${nameUserF}</a></h6>
                                                    <p class="mb-10">${objF.date_create }</p>
                                                </div>
                                            </div>
                                            <p class="mb-0">${objF.content }</p>
                                            	<ul class="reply-delate f-right">
													<li><a onclick="showreply(${objF.id_comment})" class="btn btn-warning" href="javascript:void(0)">Trả lời</a></li>
                                                </ul>
                                        </div>
                                    </div>
									<div id="reply-${objF.id_comment}">
									</div>
									<c:forEach items="${listCommentSon }" var="objS">
									 <c:forEach items="${listUser }" var="objUser">
                                    	<c:if test="${objS.id_user eq objUser.id_user}">
                                    		<c:set value="${objUser.name }" var="nameUserS"></c:set>
                                    		<c:set value="${objUser.nameImage }" var="nameimageS"></c:set>
                                    	</c:if>
                                    </c:forEach>
									<c:if test="${objF.id_comment eq objS.id_parent}">
                                    <!-- sin<gle-comments -->
                                    <div style="padding-left: 87px;"  class="media mt-30">
                                       <div class="media-left">
		                                       <div class="avatar-image" >
		                                           <span class="avatar-letter">${nameimageS }</span>
		                                        </div>
	                                     </div>
                                        <div class="media-body">
                                            <div class="clearfix">
                                                <div class="name-commenter f-left">
                                                    <h6 class="media-heading"><a href="#">${nameUserS}</a></h6>
                                                    <p class="mb-10">${objF.date_create}</p>
                                                </div>
                                               
                                            </div>
                                            <p class="mb-0">${objS.content }</p>
                                        </div>
                                    </div>
                                    </c:if>
                                    </c:forEach>
                                    </c:forEach>
                                </div>
                                <script>
									
									var check = true;
									var listid = [];
									function showreply(id){
											var c = true;
											//kiểm tra xem có id comment trong đó chưa
											listid.forEach(function(item, index, array) {
											 if(item == id){
												 c = false;
											 }
											});
											//nếu chưa có thì show ra , rồi đặt id vào
											if(c == true){
												listid.push(id);
												check =true;
											}
											//nếu có thì đóng lại , rồi xóa id đi
											if(c == false){
												listid.splice(listid.indexOf(id), 1);
												check =false;
											}
											var html ="<div class='leave-comment'><h4 class='blog-section-title border-left mb-30'></h4><div class='row'><form id='form-"+id+"' action='javascript:void(0)' >"+
												"<div class='col-md-12'>"
													+"<textarea data-parsley-minlength='6' data-parsley-minlength-message='Bạn phải nhập trên 6 kí tự' required='required' data-parsley-required-message='Bạn phải nhập trường này' id='text-"+id+"' style='color:#635e5e' class='custom-textarea' placeholder='Bình luận của bạn ở đây...'></textarea></div>"
											+"<button onclick='addComment("+id+","+${objBlog.id_blog}+")' style='margin-left: 16px;' class='submit-btn-1 black-bg mt-30 btn-hover-2' type='submit'>Bình luận</button></form></div></div>";
											if(check == true){
												$('#reply-'+id).append(html);
												$('#reply-'+id).fadeIn('slow');
											}else{
												$('#reply-'+id).fadeOut();
												$('#reply-'+id).children().remove();
											}
											listid.forEach(function(item, index, array) {
												console.log(item, index);
												});
									}
								</script>
                                </div>
                                <!-- leave your comment -->
                                <div class="leave-comment">
                                    <h4 class="blog-section-title border-left mb-30">ĐỂ LẠI BÌNH LUẬN</h4>
                                    <div class="row">
                                    <form id="form-0" action="javascript:void(0)">
                                        <div class="col-md-12">
                                            <textarea data-parsley-minlength='6' data-parsley-minlength-message='Bạn phải nhập trên 6 kí tự' required='required' data-parsley-required-message='Bạn phải nhập trường này' id="text-0" class="custom-textarea" placeholder="Bình luận của bạn ở đây..."></textarea>
                                        </div>
                                        <button onclick="addComment(0,${objBlog.id_blog})" style="margin-left: 16px;" type="submit" class="submit-btn-1 black-bg mt-30 btn-hover-2" >ĐĂNG BÌNH LUẬN</button>
                                    </form>
                                    </div>
                                </div>
                                <!--  -->
                            </div>
                        </div>
                        <script type="text/javascript">
                        function addComment(id_parent,id_blog) {
                        			$('#form-'+id_parent).parsley();
                        			var noidung = document.getElementById("text-"+id_parent).value;
                        			if($('#form-'+id_parent).parsley().isValid()) {
                            		$.ajax({
                              			url: '${pageContext.request.contextPath}/blogs/comment',
                              			type: 'POST',
                              			cache: false,
                              			data: {
                              					//Dữ liệu gửi đi
                              				id_parent: id_parent,
                              				id_blog: id_blog,
                              				content: noidung,
                              					},
                              			success: function(data){
                              				//alert("thành công !");
                              				$('#comment').html(data);
                              				
                              			},
                              			error: function (){
                              			alert("Lỗi rồi!");
                              			}
                              		});
                        			}
								}
                        
                        </script> 
                        <div class="col-md-3 col-xs-12">
                            <!-- widget-search -->
                           
                            <!-- widget-categories -->
                            <aside class="widget widget-categories box-shadow mb-30">
                                <h6 class="widget-title border-left mb-20">Quảng cáo</h6>
                                <div id="cat-treeview" class="product-cat">
                                    <img alt="" src="${pageContext.request.contextPath}/templates/hay.gif">
                                </div>
                            </aside>
                            <!-- widget-product -->
                            <aside class="widget widget-product box-shadow mb-30">
                                <h6 class="widget-title border-left mb-20">Quảng cáo</h6>
                                 <img alt="" src="${pageContext.request.contextPath}/templates/qc.gif">            
                            </aside>
                            <!-- operating-system -->
                           
                        </div>
                    </div>
                </div>
            </div>
            <!-- BLOG SECTION END -->             

        </section>
        <!-- End page content -->