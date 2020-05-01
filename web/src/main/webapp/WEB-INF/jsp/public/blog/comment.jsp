<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/templates/taglib.jsp" %>
          			
          			<!-- Button trigger modal -->
				<button id="btn" style="display: none;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
				  
				</button>
				<c:if test="${not empty errorNotLogin}">
				<script type="text/javascript">
					document.getElementById("btn").click();
				</script>
				</c:if>
				<!--
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalCenterTitle">VUI LÒNG ĐĂNG NHẬP ĐỂ BÌNH LUẬN</h5>
					        
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
					      </div>
				      
				    </div>
				  </div>
				</div> -->

 					<div class="post-comments mb-60">
                                    <h4 class="blog-section-title border-left mb-30">BÌNH LUẬN VỀ BÀI VIẾT</h4>
                                    <!-- single-comments -->
                                    <c:forEach items="${listCommentFather }" var="objF">
                                    <c:forEach items="${listUser }" var="objUser">
                                    	<c:if test="${objF.id_user eq objUser.id_user}">
                                    		<c:set value="${objUser.name }" var="nameUserF"></c:set>
                                    	</c:if>
                                    </c:forEach>
                                    <div class="media mt-30">
                                        <div class="media-left pr-30">
                                            <a href="#"><img class="media-object" src="${pageContext.request.contextPath}/templates/public/img/author/2.jpg" alt="#"></a>
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
                                    	</c:if>
                                    </c:forEach>
									<c:if test="${objF.id_comment eq objS.id_parent}">
                                    <!-- sin<gle-comments -->
                                    <div style="padding-left: 87px;"  class="media mt-30">
                                        <div class="media-left pr-30">
                                            <a href="#"><img class="media-object" src="${pageContext.request.contextPath}/templates/public/img/author/3.jpg" alt="#"></a>
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
									}
									
								</script>