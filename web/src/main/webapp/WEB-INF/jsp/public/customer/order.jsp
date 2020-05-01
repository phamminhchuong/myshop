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
				<button class="option-btn"><span style="font-weight: bold;">ĐƠN HÀNG CỦA TÔI</span></button>
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
						<th scope="col">Mã đơn hàng</th>
						<th scope="col">Ngày mua</th>
						<th scope="col">Sản phẩm</th>
						<th scope="col">Tổng tiền</th>
						<th scope="col">Trạng thái</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${listOrder }" var="objorder">
						<tr>
							<th scope="row"><a style="color: #ff9300;" href="${pageContext.request.contextPath}/customer/order/view/${objorder.id_order }">#${objorder.id_order
									}</a></th>
							<td>${objorder.date }</td>
							<td><c:forEach items="${listOrderDetail }"
									var="objorderdetail">
									<c:if test="${objorder.id_order == objorderdetail.id_ordercat }">
										<c:forEach items="${listPro }" var="objPro">
											<c:if test="${objPro.id_pro  ==  objorderdetail.id_product}">
												<c:forEach items="${listColor }" var="objcl"><c:if test="${objorderdetail.id_color ==  objcl.id_color}"><c:set value="${objcl.namecolor }" var="mau"></c:set> </c:if> </c:forEach>
											
												<p>${objPro.namepro },Size:${objorderdetail.size },Màu:${mau }</p>
											</c:if>
										</c:forEach>
									</c:if>
								</c:forEach>
							</td>
							<td>${objorder.tongtien }</td>
							<td>
								<c:if test="${objorder.confirm eq false}">Đang chờ xử lí
									<c:if test="${objorder.paid eq false }">
										<form action="${pageContext.request.contextPath}/customer/order/del" method="post">
											<input type="hidden" name="id_order" value="${objorder.id_order }" >
											<button type="submit" onclick="return confirm('Bạn có chắc muốn hủy đơn không ?')" class="btn btn-warning">Hủy Đơn</button>
										</form>
									</c:if>
								</c:if>
								<c:if test="${objorder.confirm eq true }">Đã tiếp nhận đơn
									
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>



</div>
