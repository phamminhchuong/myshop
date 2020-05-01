<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@include file="/templates/taglib.jsp" %>
<div class="navbar bg-white breadcrumb-bar border-bottom">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Sản phẩm</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page"><a href="#">Bình luận</a>
                            </li>
                           <!--  <li class="breadcrumb-item active" aria-current="page">Chat</li> -->
                        </ol>
                    </nav>
                    <!-- <div class="dropdown">
                        <button class="btn btn-outline-light btn-sm" data-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-cog"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">Manage Members</a>
                            <a class="dropdown-item" href="#">Subscribe</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-danger" href="#">Leave Chat</a>
                        </div>
                    </div> -->
                </div>
                <div class="content-container">
                    <div class="chat-module">
                        <div class="chat-module-top">
                            <form>
                                <div class="input-group input-group-round">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fas fa-search"></i>
                                        </span>
                                    </div>
                                    <input type="search" class="form-control filter-list-input" placeholder="Search chat" aria-label="Search Chat">
                                </div>
                            </form>
                            <c:if test="${msg eq 1}">
                        	<div class="alert alert-success" role="alert">
                                                Thao tác thành công!
                                            </div>
                        </c:if>
                         <c:if test="${msg eq 0}">
                        	<div class="alert alert-danger" role="alert">
                                                Thao tác thất bại!
                                            </div>
                        </c:if>
                            <div class="chat-module-body">
                            	<c:forEach items="${LcmFa }" var="objFa">
                            		<c:forEach items="${Luser }" var="objU">
                            			<c:if test="${objFa.id_user == objU.id_user }">
                            			<c:set value="${objU.nameImage }" var="nameImage"></c:set> 
                            			<c:set value="${objU.name}" var="name"></c:set>
                            			</c:if>
                            		</c:forEach>
	                                <div class="media chat-item">
	                                    <div class="media-left">
		                                     <div class="avatar-image" >
		                                         <span class="avatar-letter">${nameImage }</span>
		                                      </div>
	                                    </div>
	                                    <div class="media-body">
	                                        <div class="chat-item-title">
	                                            <span class="chat-item-author">${name }</span>
	                                            <fmt:parseDate  value="${objFa.date_create}"  type="date" pattern="yyyy-MM-dd HH:mm" var="parsedDate" />
												<fmt:formatDate value="${parsedDate}" type="date" pattern="yyyy-MM-dd HH:mm" var="stdDatum" />
                                                
	                                            <span>${stdDatum }</span>
	                                           <%--  <span><a href="${pageContext.request.contextPath }/admin/comment/del/${id_blog}/${objFa.id_comment}" title='Trả lời' class='badge badge-info'><i class='fas fa-reply'></i></a></span>
	                                             --%><span><a href="${pageContext.request.contextPath }/admin/comment/pro/del/${objFa.id_comment}" title='Xóa' class='badge badge-danger'><i class='fas fa-trash'></i></a></span>
	                                            
	                                        </div>
	                                        <div class="chat-item-body">
	                                            <p>${objFa.content }</p>
	                                            <a style="color:green" data-toggle="collapse" href="#collapseExample${objFa.id_comment }" role="button" aria-expanded="false" aria-controls="collapseExample"><i class='fas fa-reply'></i>Reply</a>
	                                        </div>
	                                        <div class="collapse" id="collapseExample${objFa.id_comment }">
														  <div class="card card-body">
														  	<textarea id="reply-${objFa.id_comment }" rows="3" cols=""></textarea>
														  	<button onclick="sendThongBao(${objFa.id_comment})">Send</button>
														  </div>
														</div>
	                                    </div>
	                                </div>
	                                <c:forEach var="objSon" items="${LcmSon }">
	                                	<c:if test="${objFa.id_comment == objSon.id_parent  }">
		                                	<c:forEach items="${Luser }" var="objU">
		                            			<c:if test="${objSon.id_user == objU.id_user }">
		                            			<c:set value="${objU.nameImage }" var="nameImages"></c:set> 
		                            			<c:set value="${objU.name}" var="names"></c:set>
		                            			</c:if>
		                            		</c:forEach>
			                                	<div style="margin-left: 62px;background-color: #ec98234a" class="media chat-item">
			                                    <div class="media-left">
				                                     <div class="avatar-image" >
				                                         <span class="avatar-letter">${nameImages }</span>
				                                      </div>
			                                    </div>
			                                    <div class="media-body">
			                                        <div class="chat-item-title">
			                                            <span class="chat-item-author">${names}  </span>
			                                            <span style="padding: 0px" class="btn btn-success">SHOP</span>
			                                            <fmt:parseDate  value="${objSon.date_create}"  type="date" pattern="yyyy-MM-dd HH:mm" var="parsedDatee" />
												<fmt:formatDate value="${parsedDatee}" type="date" pattern="yyyy-MM-dd HH:mm" var="stdDatume" />
                                                
	                                            <span>${stdDatume }</span>
	                                            <span><a href="${pageContext.request.contextPath }/admin/comment/pro/del/${objSon.id_comment}" title='Xóa' class='badge badge-danger'><i class='fas fa-trash'></i></a></span>
	                                        
			                                        </div>
			                                        <div class="chat-item-body">
			                                            <p>${objSon.content }</p>
			                                        </div>
			                                    </div>
			                                </div>
	                                	</c:if>
	                                </c:forEach>
	                                
	                           </c:forEach>
                       </div>
                       
                       <script type="text/javascript">
                       		function sendThongBao(id) {
								var noidung = document.getElementById("reply-"+id).value;
								$.ajax({
					      			url: '${pageContext.request.contextPath}/admin/product/comment/reply',
					      			type: 'POST',
					      			cache: false,
					      			data: {
					      					//Dữ liệu gửi đi
					      				id: id,
					      				noidung:noidung
					      				},
					      			success: function(data){
					      				//alert("thành công !");
					      				//$("#district").html(data);
					      				location.reload(true);
					      			},
					      			error: function (jqXHR,error, errorThrown){
					                       alert("Something went wrong");
					      			}
					      		});
							}
                       </script>
                        </div>
                        <!-- <div class="chat-module-bottom">
                            <form class="chat-form">
                                <textarea class="form-control" placeholder="Type message" rows="1"></textarea>
                                <div class="chat-form-buttons">
                                    <button type="button" class="btn btn-link">
                                        <i class="far fa-smile"></i>
                                    </button>
                                    <div class="custom-file custom-file-naked">
                                        <input type="file" class="custom-file-input" id="customFile">
                                        <label class="custom-file-label" for="customFile">
                                            <i class="fas fa-paperclip"></i>
                                        </label>
                                    </div>
                                </div>
                            </form>
                        </div> -->
                    </div>
                     </div>
            