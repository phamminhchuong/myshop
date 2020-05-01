<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
    <!-- ============================================================== -->
    <!-- forgot password  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card">
            <div class="card-header text-center"><a href="${pageContext.request.contextPath}"><img class="logo-img" width="90px" height="70px" src="${pageContext.request.contextPath}/templates/admin/icon/icon1.png" alt="logo"></a><span class="splash-description"> Vui lòng hãy điền thông tin của bạn.</span> </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/auth/getmail" method="post">
                    <p>Đừng lo lắng , chúng tôi sẽ gửi mail cho bạn để đổi lại mật khẩu.</p>
                    <div class="form-group">
                        <input class="form-control form-control-lg" type="email" name="email" required="" placeholder="Your Email">
                    </div>
                    <div class="form-group pt-1"><button type="submit" class="btn btn-block btn-primary btn-xl" href="../index.html">Đổi Password</button></div>
                </form>
                <c:if test="${not empty err}">
					<p style="color:red;">${err }</p>
					</c:if>
            </div>
            
            <div class="card-footer text-center">
                <span>Bạn không có tài khoản? <a href="pages-sign-up.html">Đăng kí</a></span>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- end forgot password  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
</body>
