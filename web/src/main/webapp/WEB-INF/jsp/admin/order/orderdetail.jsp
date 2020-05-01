
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
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Sản phẩm</a></li>
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
                            <div class="card-header">
                            <c:if test="${objOrder.confirm eq false }">
                                <h4 style="margin-left: 38%"><a href="javascript:void(0)" onclick="xacNhanDonHang(${objOrder.id_order})" class="btn btn-info">Xác Nhận đơn hàng<i class=""></i></a></h4>
                              </c:if>
                              <c:if test="${objOrder.confirm eq true }">
                                <h4 style="margin-left: 38%"><a href="javascript:void(0)" class="btn btn-success">Đơn hàng đã được xác nhận<i class=""></i></a></h4>
                              </c:if>    
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                	${body }
                                </div>
		                               
                            </div>
               
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end data table  -->
                    <!-- ============================================================== -->
                </div>
               <script type="text/javascript">
               	function xacNhanDonHang(id) {
               		$.ajax({
              			url: '${pageContext.request.contextPath}/admin/order/confirm',
              			type: 'POST',
              			cache: false,
              			data: {
              					//Dữ liệu gửi đi
              				id: id
              					},
              			success: function(data){
              				//alert("thành công !");
              				location.reload(true);
              			},
              			error: function (jqXHR,error, errorThrown){
              				{
                               alert("Something went wrong");
                           }
              			}
              		})
				}
               </script>
                 
                </div>
      </div>     