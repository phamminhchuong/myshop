<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/templates/public/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath }/templates/public/js/vendor/jquery-3.1.1.min.js"></script>
<script
	src="${pageContext.request.contextPath }/templates/public/jquery.bootstrap-touchspin.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/templates/public/style.css">
<title>Thank you!</title>
</head>
<body>
	<div style="margin-top: 50px;" class="container">
	${bodymail }
		<!-- Button trigger modal -->
		<div class="col-md-12">
			<div class="checkout-content box-shadow p-30">
				<div class="row">
					<div class="col-md-1">
					</div>
					<div class="col-md-3">
						<img width="100%" alt="" src="${pageContext.request.contextPath }/templates/iconsuccess.png">
					</div>
					<div class="col-md-6">
					<h2>Cảm ơn bạn đã mua hàng tại Shop</h2>
						<h4>Mã số đơn hàng của bạn là:</h4>
						<button style="margin-left: 34%;width: 25%;" class="btn btn-success" >${id_order }</button>
						<h5>Bạn có thể xem lại <a href="${pageContext.request.contextPath }/customer/history">Đơn hàng của tôi</a></h5>
						<p>Thông tin chi tiết đã được gửi đến địa chỉ mail <span style="color:green">${userInfo.email}</span>.Nếu không tìm thấy Vui lòng
						kiểm tra trong hộp thư <span style="font-weight: bold;">Spam</span></p>
						<p style="font-size: 12px">${alertmail }</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="${pageContext.request.contextPath }/templates/public/js/bootstrap.min.js"></script>
<!-- jquery.nivo.slider js -->
<script
	src="${pageContext.request.contextPath }/templates/public/lib/js/jquery.nivo.slider.js"></script>
<!-- All js plugins included in this file. -->
<script
	src="${pageContext.request.contextPath }/templates/public/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script
	src="${pageContext.request.contextPath }/templates/public/js/main.js"></script>
<script
	src="${pageContext.request.contextPath}/templates/admin/assets/vendor/parsley/parsley.js"
	charset="UTF-8" type="text/javascript"></script>

</html>
