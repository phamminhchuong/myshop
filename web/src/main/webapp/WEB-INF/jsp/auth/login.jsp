<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/templates/taglib.jsp" %>

	<body>
    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><a href="${pageContext.request.contextPath}"><img class="logo-img" width="90px" height="70px" src="${pageContext.request.contextPath}/templates/admin/icon/icon1.png" alt="logo"></a><span class="splash-description"> Vui lòng hãy điền thông tin của bạn.</span> </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/auth/login" method="post">
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="username" name="username" type="text" placeholder="Username" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="password" name="password" type="password" placeholder="Password">
                    </div>
                    <c:if test="${not empty err}">
					<p style="color:red;">${err }</p>
					</c:if>
                    <div class="form-group">
                        <label class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox"><span class="custom-control-label">Ghi nhớ tài khoản</span>
                        </label>
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Đăng nhập</button>
                </form>
            </div>
            <div class="card-footer bg-white p-0  ">
               
	                <div class="card-footer-item card-footer-item-bordered">
	                    <a href="${pageContext.request.contextPath}/auth/getmail" class="footer-link">Bạn quên mật khẩu?</a>
	                </div>
               
            </div>
        </div>
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->

</body>
 
