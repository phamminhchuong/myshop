
<%@page import="model.bean.Cat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="dashboard-ecommerce">
    <%@include file="/templates/taglib.jsp" %>
<div class="container-fluid  dashboard-content">
                <!-- ============================================================== -->
                <!-- pageheader -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="page-header">
                            <h2 class="pageheader-title">Danh sách sản phẩm</h2>
                            <p class="pageheader-text"></p>
                            <div class="page-breadcrumb">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Sản phẩm</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Số lượng sản phẩm</a></li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- end pageheader -->
                <!-- ============================================================== -->
                 <div class="row">
                    <!-- ============================================================== -->
                    <!-- data table  -->
                    <!-- ============================================================== -->
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <div class="card">
                        <c:if test="${msg eq 1}">
                        	<div class="alert alert-success" role="alert">
                                                Thao tác thành công!
                                            </div>
                        </c:if>
                         <c:if test="${msg eq 0}">
                        	<div class="alert alert-danger" role="alert">
                                                Thao tác thất bại!
                                            </div>
                        </c:if>
                        <div id="alert"> 
                        
                        </div>
                            <div class="card-header">
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	
                                    <table class="table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                               	<th>ID</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Màu sắc</th>
                                                <th>Size</th>
                                                <th>Số lượng</th>
                                                <th>Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach items="${listAmountPro }" var="objap">
                                        	
                                       		<tr>
                                       			<td>${objap.id_amountPro }</td>
                                       			<td>${objPro.namepro }</td>
                                       			<td > 
                                       				<c:forEach items="${listColor }" var="objcl">
                                       					<c:if test="${objcl.id_color eq objap.id_color}">
                                       						${objcl.namecolor}
                                       					</c:if>
                                       				</c:forEach>
                                       			</td>
                                       			<td>${objap.size }</td>
                                       			<td><input style="width: 52px;" min="0" id="ap-${objap.id_amountPro }" value="${objap.amount}" type="number"></td>
                                       			<td>
                                       				<button onclick="updateAmount(${objap.id_amountPro })" class="btn btn-success">Cập nhật</button>
                                       			</td>
                                       		</tr>
                                       		
                                           </c:forEach>
                                        </tbody>
                                        
                                    </table>
                                </div>
		                               
                            </div>
               
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end data table  -->
                    <!-- ============================================================== -->
                </div>
               <script type="text/javascript">
               function updateAmount(id) {
            	   var amount = document.getElementById("ap-"+id).value;
            	   $.ajax({
             			url: '${pageContext.request.contextPath}/admin/product/amount/edit',
             			type: 'POST',
             			cache: false,
             			data: {
             					//Dữ liệu gửi đi
             				id: id,
             				amount: amount
             					},
             			success: function(data){
             				//alert("thành công !");
             				$('#alert').html(data);
             				//location.reload(true)
             			},
             			error: function (){
             			alert("Lỗi rồi!");
             			}
             		});	
			}
               </script>
                 
                </div>
      </div>     