<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div style="height: 50px"></div>
<div class="col-md-9 col-md-push-3 col-xs-12">
	<div class="row">
		<!-- blog-option start -->
		<div class="col-md-12">
			<div class="blog-option box-shadow mb-30  clearfix">
				<!-- categories -->
				<button class="option-btn"><span style="font-weight: bold;">SẢN PHẨM YÊU THÍCH</span></button>
			</div>
		</div>
		<!-- blog-option end -->
	</div>
	<div class="row">

		<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
		<c:if test="${not empty msg }">
			${msg }
		</c:if>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Hình ảnh</th>
						<th scope="col">Tên sản phẩm</th>
						<th scope="col">Giá</th>
						<th scope="col">Giá kuyến mãi</th>
						<th scope="col">Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listFavorite }" var="obj">
						<tr>
							<th scope="row">
								<c:forEach items="${listimage }" var="obji">
									<c:if test="${obji.id_product == obj.id_pro }">
										<img width="100px" height="100px" alt="${obji.nameimg}" src="${pageContext.request.contextPath}/files/${obji.nameimg}">
									</c:if>
								</c:forEach>
							</th>
							<td><a href="${pageContext.request.contextPath }/san-pham/${slugUtil.makeSlug(obj.namepro)}/${obj.id_pro}">${obj.namepro }</a></td>
							<td>${slugUtil.changeNumToVnd(obj.gia) }</td>
							<td>${slugUtil.changeNumToVnd(obj.giakm) }</td>
							<td><a href="javascript:void(0)" onclick="delFavorite(${obj.id_pro})" title="Xóa"><i style="color:red" class='fas fa-trash'></i></a> </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
	<script type="text/javascript">
		function delFavorite(idpro) {
			$.ajax({
      			url: '${pageContext.request.contextPath}/delfavorite',
      			type: 'POST',
      			cache: false,
      			data: {
      				id_product: idpro
      					},
      			success: function(data){
      				location.reload(true);
      				//alertify.success("Thao tác thành công !");
      				//$('#arealike').html(data);
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


</div>
