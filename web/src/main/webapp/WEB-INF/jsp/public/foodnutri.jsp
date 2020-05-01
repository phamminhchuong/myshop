<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/templates/taglib.jsp"%>
<!-- Start page content -->
<html>
<head>
	<title>Bảng dinh dưỡng</title>


    <link rel="stylesheet" href="${pageContext.request.contextPath }/templates/public/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/templates/public/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/templates/public/bootstrap.css">
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/templates/public/dataTables.bootstrap4.css">

    	
      <%--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/templates/admin/assets/vendor/datatables/css/fixedHeader.bootstrap4.css">
   
    --%>
     <script src="${pageContext.request.contextPath }/templates/public/js/vendor/jquery-3.1.1.min.js"></script>
 <script src="${pageContext.request.contextPath }/templates/public/js/bootstrap.min.js"></script>

   			    <script src="${pageContext.request.contextPath}/templates/public/jquery.dataTables.min.js"></script>
			    
			    <script src="${pageContext.request.contextPath}/templates/public/dataTables.bootstrap4.min.js"></script>
   </head> 
   <body>
   		 <section id="page-content" class="page-wrapper">
	<style>
input[type="number"] {
	background: #fffbfb none repeat scroll 0 0;
	border: 1px solid #00000000;
	box-shadow: 0 0 0px 1px rgba(2, 2, 2, 0.29);
	color: #060606;
	font-size: 13px;
	height: 40px;
	margin-bottom: 20px;
	padding-left: 20px;
	width: 100%;
}

.mybutton {
	font-weight: bold;
	background: #fff;
	border: 1px solid #3a7cdf;
	font-size: 12px;
	color: #3584e4;
	/* width: 99px; */
	margin-top: -5px;
	border-radius: 4px;
}

.mybutton:hover {
	background: #3a7cdf;
	color: white;
}

.active {
	background: #3a7cdf;
	color: white;
}
</style>
	<!-- ADDRESS SECTION START -->
	<div class="address-section mb-80">
		<div class="container">
			<h1 style="color: gray; font-size: 45px;margin-left: 55px">
				CHẤT <span style="color: orange;">DINH DƯỠNG</span> CÓ TRONG <span style="color: orange;">THỰC PHẨM</span>
			</h1>
			<div style="margin-top: 50px">
				<button onclick="back()" style="font-size: 19px" class="btn btn-info">Quay lại</button>
				<div style="margin-bottom: 10px">
			</div>
			<div class="row">
				<div class="col-md-12">
				<table id="example" class="table table-striped table-bordered second" style="width:100%">
				  <thead>
				  <tr>
					    <th>Tên thực phẩm(vn)</th>
					    <th>Tên thực phẩm(en)</th>
					    <th>Nước(g)</th>
					    <th>Năng lượng(KCal)</th>
					    <th>Protein(g)</th>
					    <th>Lipid[Chất béo](g)</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${listfoodnutri }" var="obj">
				  
				  <tr>
				    <td>${obj.namefoodvn }</td>
				    <td>${obj.namefooden }</td>
				    <td>${obj.water }</td>
				    <td>${obj.energy }</td>
				    <td>${obj.protein }</td>
				    <td>${obj.lipid }</td>
				  </tr>
				  </c:forEach>
				  </tbody>
				</table>
				<script>
					$(document).ready(function() {
				    $('#example').DataTable();
				    document.getElementById("formheader").innerHTML = "";
					} );
					
					
					function back() {
						window.history.go(-1);
					}
				</script>
			</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>