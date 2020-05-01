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
            <c:if test="${not empty check}">
                <form action="${pageContext.request.contextPath}/auth/resetPassword" method="post">
                <div class="form-group">
                        <input hidden class="form-control form-control-lg" name="email" value="${email }" >
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="password" name="password" type="password" placeholder="Password" required="required">
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg" id="repassword" name="repassword" type="password" placeholder="Nhập lại Password" required="required">
                    </div>
                    <c:if test="${not empty err}">
					<p style="color:red;">${err }</p>
					</c:if>

                    <button type="submit" class="btn btn-primary btn-lg btn-block">Đổi mật khẩu</button>
                </form>
                </c:if>
                <c:if test="${empty check}">
                	<p style="color:red;">Link đổi mật khẩu đã hết hạn hoặc bị sai</p>
                </c:if>
                
            	
                
            </div>

        </div>
    </div>
  	<script type="text/javascript">
  	var password = document.getElementById("password")
    , confirm_password = document.getElementById("repassword");

		  function validatePassword(){
			
		    if(password.value != confirm_password.value) {
		      confirm_password.setCustomValidity("Mật khẩu xác nhận không đúng !");
		    } else if(password.value.length < 3){
		    	confirm_password.setCustomValidity("Mật khẩu phải lớn hơn 3 kí tự !");
		    }else{
		      confirm_password.setCustomValidity('');
		    }
		  }

	  password.onchange = validatePassword;
	  confirm_password.onkeyup = validatePassword;
  	</script>
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->

</body>
 
