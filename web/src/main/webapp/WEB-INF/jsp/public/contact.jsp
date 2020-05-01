<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Start page content -->
<%@include file="/templates/taglib.jsp"%>
<section id="page-content" class="page-wrapper">

	<!-- ADDRESS SECTION START -->
	<div class="address-section mb-80">
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-xs-12">
					<div class="contact-address box-shadow">
						<i class="zmdi zmdi-pin"></i>
						<h6>08, Hà Văn Tính,Hòa Khánh Bắc,Liên Chiểu,Đà Nẵng</h6>

					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="contact-address box-shadow">
						<i class="zmdi zmdi-phone"></i>
						<h6>
							<a href="tel:0867896972">08.6789.6972</a>
						</h6>
					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<div class="contact-address box-shadow">
						<i class="zmdi zmdi-email"></i>
						<h6>
							<a href="mailto:minhchuong8197@gmail.com">minhchuong8197@gmail.com</a>
						</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ADDRESS SECTION END -->

	<!-- GOOGLE MAP SECTION START -->
	<div class="google-map-section">
		<div class="container-fluid">
			<div class="google-map plr-185">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12895.78909885949!2d108.1455944117671!3d16.0685492202238!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142192871135687%3A0x73355bb95c7c5386!2zOCBIw6AgVsSDbiBUw61uaCwgSG_DoCBLaMOhbmggTmFtLCBMacOqbiBDaGnhu4N1LCDEkMOgIE7hurVuZyA1NTAwMDAsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1586152390644!5m2!1svi!2s"
					width="1210" height="450" frameborder="0" style="border: 0;"
					allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
			</div>
		</div>
	</div>
	<!-- GOOGLE MAP SECTION END -->
	<style>
</style>
	<!-- MESSAGE BOX SECTION START -->
	<div class="message-box-section mt--50 mb-80">
		<div class="container">
			<c:if test="${ empty msgContact }">
				<div class="row">
					<div class="col-md-12">
						<div class="message-box box-shadow white-bg">
							<form id="contact-form"
								action="${pageContext.request.contextPath}/contact"
								method="post">
								<div class="row">
									<div class="col-md-12">
										<h4 class="blog-section-title border-left mb-30">LIÊN LẠC</h4>
									</div>
									<div class="col-md-6">
										<input required="required" type="text" name="name"
											placeholder="Tên của bạn">
									</div>
									<div class="col-md-6">
										<input required="required" type="text" name="email"
											placeholder="Email của bạn">
									</div>
									<div class="col-md-6">
										<input required="required" type="text" name="tieude"
											placeholder="Tiêu đề">
									</div>
									<div class="col-md-6">
										<input required="required" type="text" name="phonect"
											placeholder="Số điện thoại">
									</div>
									<div required="required" class="col-md-12">
										<textarea style="box-shadow: 0 0 4px rgba(0, 0, 0, 0.88);"
											class="custom-textarea" name="noidung"
											placeholder="Bạn muốn nói gì ..."></textarea>
										<button class="submit-btn-1 mt-30 btn-hover-1" type="submit">Gửi</button>
									</div>
								</div>
							</form>
							<p class="form-messege"></p>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${not empty msgContact }">
				<div class="row">

					<div class="col-md-12">
						<div class="message-box box-shadow white-bg">
						${msgContact }
						</div>
					</div>
				</div>

			</c:if>
		</div>
	</div>
	<!-- MESSAGE BOX SECTION END -->
</section>
<!-- End page content -->
