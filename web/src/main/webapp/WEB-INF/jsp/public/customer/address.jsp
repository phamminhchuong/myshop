
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
				<button class="option-btn">ĐỊA CHỈ CỦA TÔI</button>
			</div>
		</div>
		<!-- blog-option end -->
	</div>
	<div class="row">
		
		<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
		<c:if test="${not empty msgAddress }">
			${msgAddress }
		</c:if>
		<div style="height: 50px;margin-bottom: 10px;"><a id="ma_link" href="${pageContext.request.contextPath}/customer/adress/add" style=" padding-left: 375px;
    padding-right: 471px;
    padding-bottom: 28px;
    padding-top: 5px;
    border: 1px dashed #5cb85c;"><span style="position: absolute;margin-top: 11px;">Thêm địa chỉ</span></a>
			
		</div>
		<c:forEach items="${listAddress }" var="obj">
			<div class="blog-option box-shadow mb-30  clearfix">
				<!-- categories -->
				<div style="margin-left: 15px">
				<p >${obj.value }</p>
				
				<button onclick="location.href='${pageContext.request.contextPath}/customer/adress/edit/${obj.key }'" class="btn btn-success">Chỉnh sửa</button>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>

	
</div>