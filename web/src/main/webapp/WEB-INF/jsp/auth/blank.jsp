<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
    <!-- ============================================================== -->
    <!-- forgot password  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card">
            <div class="card-header text-center"><a href="${pageContext.request.contextPath}"><img class="logo-img" width="90px" height="70px" src="${pageContext.request.contextPath}/templates/admin/icon/icon1.png" alt="logo"></div>
            <div class="card-body">
                
                <c:if test="${not empty done}">
					<p style="color:red;">${done}</p>
					</c:if>
            </div>
            
            <div class="card-footer text-center">
                <span>Quay lại ? <a href="${pageContext.request.contextPath}/auth/login">Đăng nhập</a></span>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- end forgot password  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
</body>
