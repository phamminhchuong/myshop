<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/templates/taglib.jsp" %>
       <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title">Chào mừng bạn đến trang chủ</h2>
                                <!-- <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                                 --><div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item active"><a href="#" class="breadcrumb-link">Trang chủ</a></li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <fmt:parseDate  value="${now}"  type="date" pattern="yyyy-MM-dd" var="parsedDate" />
					<fmt:formatDate value="${parsedDate}" type="date" pattern="yyyy-MM-dd" var="stdDatum" />
					<fmt:formatDate value="${parsedDate}" type="date" pattern="yyyy" var="nam" />
					<fmt:formatDate value="${parsedDate}" type="date" pattern="MM" var="thang" />
					<fmt:formatDate value="${parsedDate}" type="date" pattern="dd" var="ngay" />
                    <!-- ============================================================== -->
                    <!-- end pageheader  -->
                    <!-- ============================================================== -->
                    <div class="ecommerce-widget">

                        <div class="row">
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-muted"><i class="fas fa-dollar-sign"></i>Tổng thu (Tháng-${thang })</h5>
                                        <c:if test="${PTOrder == 100 or PTOrder == 0}">
                                            	<c:set value="text-primary" var="classPTOrders"></c:set>
                                            	<c:set value="0" var="PTOrder"></c:set>
                                            </c:if>
                                            <c:if test="${PTOrder != 100 and PTOrder > 0}">
                                            	<c:set value="fa fa-fw fa-arrow-down" var="classPTOrder"></c:set>
                                            	<c:set value="text-danger" var="classPTOrders"></c:set>
                                            </c:if>
                                             <c:if test="${PTOrder != 100 and PTOrder < 0}">
                                            	<c:set value="fa fa-fw fa-arrow-up" var="classPTOrder"></c:set>
                                            	<c:set value="text-success" var="classPTOrders"></c:set>
                                            </c:if>
                                            
                                            <c:if test="${PTOrder < 0 }"> <c:set value="${PTOrder * -1}" var="PTOrder"></c:set> </c:if>
                                            <fmt:formatNumber var="exOrder" value="${PTOrder *100 }" maxFractionDigits="1" />
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">${valueOrder }</h1>
                                        </div>
                                        <div class="metric-label d-inline-block float-right ${classPTOrders } font-weight-bold">
                                            <span><i class="${classPTOrder }"></i></span><span>${exOrder }%</span>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-muted"><i class="fas fa-file-alt"></i>Tổng Đơn Hàng (Tháng -${thang })</h5>
                                             <c:if test="${PTCountOrder == 100 or PTCountOrder == 0}">
                                            	<c:set value="text-primary" var="classPTCountOrders"></c:set>
                                            	<c:set value="0" var="PTCountOrder"></c:set>
                                            </c:if>
                                            <c:if test="${PTCountOrder != 100 and PTCountOrder > 0}">
                                            	<c:set value="fa fa-fw fa-arrow-down" var="classPTCountOrder"></c:set>
                                            	<c:set value="text-danger" var="classPTCountOrders"></c:set>
                                            </c:if>
                                             <c:if test="${PTCountOrder != 100 and PTCountOrder < 0}">
                                            	<c:set value="fa fa-fw fa-arrow-up" var="classPTCountOrder"></c:set>
                                            	<c:set value="text-success" var="classPTCountOrders"></c:set>
                                            </c:if>
                                        <c:if test="${PTCountOrder < 0 }"> <c:set value="${PTCountOrder * -1}" var="PTCountOrder"></c:set> </c:if>
                                            <fmt:formatNumber var="exCountOrder" value="${PTCountOrder *100 }" maxFractionDigits="1" />
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">${valueCountOrder }</h1>
                                        </div>
                                        <div class="metric-label d-inline-block float-right ${classPTCountOrders } font-weight-bold">
                                            <span><i class="${classPTCountOrder }"></i></span><span>${exCountOrder }%</span>
                                        </div>
                                    </div>
                                    <!--<div id="sparkline-revenue2"></div>	  -->
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-muted">Tổng sản phẩm bán được (Tháng-${thang })</h5>
                                        <c:if test="${PTAmountPro == 100 or PTAmountPro == 0}">
                                            	<c:set value="text-primary" var="classPTAmountPros"></c:set>
                                            	<c:set value="0" var="PTAmountPro"></c:set>
                                            </c:if>
                                            <c:if test="${PTAmountPro != 100 and PTAmountPro > 0}">
                                            	<c:set value="fa fa-fw fa-arrow-down" var="classPTAmountPro"></c:set>
                                            	<c:set value="text-danger" var="classPTAmountPros"></c:set>
                                            </c:if>
                                             <c:if test="${PTAmountPro != 100 and PTAmountPro < 0}">
                                            	<c:set value="fa fa-fw fa-arrow-up" var="classPTAmountPro"></c:set>
                                            	<c:set value="text-success" var="classPTAmountPros"></c:set>
                                            </c:if>
                                            <c:if test="${PTAmountPro < 0 }"> <c:set value="${PTAmountPro * -1}" var="PTAmountPro"></c:set> </c:if>
                                            <fmt:formatNumber var="exAmountPro" value="${PTAmountPro *100 }" maxFractionDigits="1" />
                                        
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">${valueAmountProSell }</h1>
                                        </div>
                                        <div class="metric-label d-inline-block float-right ${classPTAmountPros } font-weight-bold">
                                             <span><i class="${classPTAmountPro }"></i></span><span>${exAmountPro }%</span>
                                        </div>
                                    </div>
                                    <!-- <div id="sparkline-revenue3"></div> -->
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="text-muted">Tổng sản phẩm nhập (Tháng-${thang })</h5>
                                               <c:if test="${PTProAdd == 100 or PTProAdd == 0}">
                                            	<c:set value="text-primary" var="classPTProAdd"></c:set>
                                            	<c:set value="0" var="PTProAdd"></c:set>
                                            </c:if>
                                            <c:if test="${PTProAdd != 100 and PTProAdd > 0}">
                                            	<c:set value="fa fa-fw fa-arrow-down" var="classPTProAdd"></c:set>
                                            	<c:set value="text-danger" var="classPTAmountPros"></c:set>
                                            </c:if>
                                             <c:if test="${PTProAdd != 100 and PTProAdd < 0}">
                                            	<c:set value="fa fa-fw fa-arrow-up" var="classPTProAdd"></c:set>
                                            	<c:set value="text-success" var="classPTProAdds"></c:set>
                                            </c:if>
                                         <c:if test="${PTProAdd < 0 }"> <c:set value="${PTProAdd * -1}" var="PTProAdd"></c:set> </c:if>
                                            <fmt:formatNumber var="exPTProAdd" value="${PTProAdd *100 }" maxFractionDigits="1" />
                                        
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">${valueProAdd }</h1>
                                        </div>
                                        <div class="metric-label d-inline-block float-right ${classPTProAdds } font-weight-bold">
                                             <span><i class="${classPTProAdd }"></i></span><span>${exPTProAdd }%</span>
                                        </div>
                                    </div>
                                    <!-- <div id="sparkline-revenue4"></div> -->
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            
                        </div>
                        <div class="row">
                            <!-- ============================================================== -->
              				                        <!-- product category  -->
                            <!-- ============================================================== -->
                          
                            <!-- end product category  -->
                                   <!-- product sales  -->
                            <!-- ============================================================== -->
                  
                            <!-- ============================================================== -->
                            <!-- end product sales  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-3 col-lg-12 col-md-6 col-sm-12 col-12">
                                <!-- ============================================================== -->
                                <!-- top perfomimg  -->
                                <!-- ============================================================== -->
                     
                                <!-- ============================================================== -->
                                <!-- end top perfomimg  -->
                                <!-- ============================================================== -->
                            </div>
                        </div>

                        <div class="row">
                            <!-- ============================================================== -->
                            <!-- sales  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="card border-3 border-top border-top-primary">
                                    <div class="card-body">
                                    	
                                        <h5 class="text-muted"><i class="fas fa-eye"></i> Số lượt xem bài viết (Tháng-${thang})</h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">${valueBlog}</h1>
                                        </div>
                                        <c:if test="${PTBlog == 100 or PTBlog == 0}">
                                            	<c:set value="text-primary" var="classPTBlogs"></c:set>
                                            	<c:set value="0" var="PTBlog"></c:set>
                                            </c:if>
                                            <c:if test="${PTBlog != 100 and PTBlog > 0}">
                                            	<c:set value="fa fa-fw fa-arrow-down" var="classPTBlog"></c:set>
                                            	<c:set value="text-danger" var="classPTBlogs"></c:set>
                                            </c:if>
                                             <c:if test="${PTBlog != 100 and PTBlog < 0}">
                                            	<c:set value="fa fa-fw fa-arrow-up" var="classPTBlog"></c:set>
                                            	<c:set value="text-success" var="classPTBlogs"></c:set>
                                            </c:if>
                                        <div class="metric-label d-inline-block float-right ${classPTBlogs } font-weight-bold">
                                            <span class="icon-circle-small icon-box-xs ${classPTBlogs }">
                                            
                                            <i class="${classPTBlog }"></i>
                                            <c:if test="${PTBlog < 0 }"> <c:set value="${PTBlog * -1}" var="PTBlog"></c:set> </c:if>
                                            <fmt:formatNumber var="expiry" value="${PTBlog *100 }" maxFractionDigits="1" />
                                            </span><span class="ml-1">${expiry}%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end sales  -->
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- new customer  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                                <div class="card border-3 border-top border-top-primary">
                                    <div class="card-body">
                                        <h5 class="text-muted"><i class="fas fa-user-plus"></i> Khách hàng đăng kí (Tháng-${thang})</h5>
                                        <div class="metric-value d-inline-block">
                                            <h1 class="mb-1">${valueNewCustomer }</h1>
                                        </div>
                                        
                                        <c:if test="${PTUser == 100 or PTUser == 0}">
                                            	<c:set value="text-primary" var="classPTBlogs"></c:set>
                                            	<c:set value="0" var="PTUser"></c:set>
                                            </c:if>
                                            <c:if test="${PTUser != 100 and PTUser > 0}">
                                            	<c:set value="fa fa-fw fa-arrow-down" var="classPTUser"></c:set>
                                            	<c:set value="text-danger" var="classPTUsers"></c:set>
                                            </c:if>
                                             <c:if test="${PTUser != 100 and PTUser < 0}">
                                            	<c:set value="fa fa-fw fa-arrow-up" var="classPTUser"></c:set>
                                            	<c:set value="text-success" var="classPTUsers"></c:set>
                                            </c:if>
                                        
                                        <div class="metric-label d-inline-block float-right ${classPTUsers } font-weight-bold">
                                            <span class="icon-circle-small icon-box-xs ${classPTUsers }">
                                            <i class="${classPTUser }"></i></span>
                                            <c:if test="${PTUser < 0 }"> <c:set value="${PTUser * -1}" var="PTUser"></c:set> </c:if>
                                            <fmt:formatNumber var="exuser" value="${PTUser *100 }" maxFractionDigits="1" />
                                            <span class="ml-1">${exuser }%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            
                        </div>
                        <div class="row">
                            <!-- ============================================================== -->
                            <!-- total revenue  -->
                            <!-- ============================================================== -->
  
                            
                            <!-- ============================================================== -->
                            <!-- ============================================================== -->
                            <!-- category revenue  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-5 col-lg-5 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end category revenue  -->
                            <!-- ============================================================== -->

                            <div class="col-xl-7 col-lg-7 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                </div>
                            </div>
                        </div>
                         <div class="row">
                        <!-- ============================================================== -->
                        <!-- four widgets   -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- total views   -->
                        <!-- ============================================================== -->
                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-inline-block">
                                        <h5 class="text-muted">Tổng lượt xem</h5>
                                        <h2 class="mb-0">${countSumViewBlog }</h2>
                                    </div>
                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
                                        <i class="fa fa-eye fa-fw fa-sm text-info"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end total views   -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- total followers   -->
                        <!-- ============================================================== -->
                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-inline-block">
                                        <h5 class="text-muted">Tổng người dùng</h5>
                                        <h2 class="mb-0">${countAlluser }</h2>
                                    </div>
                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
                                        <i class="fa fa-user fa-fw fa-sm text-primary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end total followers   -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- partnerships   -->
                        <!-- ============================================================== -->
                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-inline-block">
                                        <h5 class="text-muted">Tổng bài viết</h5>
                                        <h2 class="mb-0">${countAllBlog }</h2>
                                    </div>
                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-secondary-light mt-1">
                                        <i class="fa fa-newspaper fa-fw fa-sm text-secondary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end partnerships   -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- total earned   -->
                        <!-- ============================================================== -->
                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-inline-block">
                                        <h5 class="text-muted">Sản phẩm còn</h5>
                                        <h2 class="mb-0">${countAllAmountPro }</h2>
                                    </div>
                                    <div class="float-right icon-circle-medium  icon-box-lg  bg-brand-light mt-1">
                                        <i class="fa fa-box-open fa-fw fa-sm text-brand"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end total earned   -->
                        <!-- ============================================================== -->
                       
                    </div>
                        
                        <div class="row">
                          <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12">
			                        <div class="card">
			                            <h5 class="card-header">Tỉ lệ người dùng Nam/Nữ </h5>
			                            <div class="card-body">
			                                <div id="c3chart_piee"></div>
			                            </div>
			                        </div>
			                    </div>
			                    <script type="text/javascript">
			                     
			                     function showthunhap(check) {
									if(check == 1){
										document.getElementById("thunhapthang").style.display = "block";
					                     document.getElementById("thunhapnam").style.display = "none";
									}else if(check == 2){
										document.getElementById("thunhapthang").style.display = "none";
					                     document.getElementById("thunhapnam").style.display = "block";
									}
									
								}
			                    
			                    </script>
			                    <div style="position: absolute;margin-left: 88%;z-index: 1;">
			                   	<button style="padding: 0px" onclick="showthunhap(1)" class="btn btn-danger">Tháng</button>
			                    	<button style="padding: 0px" onclick="showthunhap(2)" class="btn btn-info">Năm</button>
                       			</div>
                       			<div id="thunhapthang" class="col-xl-8 col-lg-8 col-md-6 col-sm-12 col-12">
                       			
			                        <div class="card">
			                            <h5 style="font-weight: bold;" class="card-header">Biểu đồ thu nhập trong tháng <span style="color:green;">${thang }</span> ,ngày thứ <span style="color:green;">${ngay }</span></h5>
			                            <div class="card-body">
			                                <div id="c3chart_splinee"></div>
			                            </div>
			                        </div>
			                    </div>
			                   
			                    
			                    <div id="thunhapnam"  class="col-xl-8 col-lg-8 col-md-6 col-sm-8 col-8">
			                        <div class="card">
			                            <h5 style="font-weight: bold;" class="card-header">Biểu đồ thu nhập trong năm <span style="color:green;">${nam }</span> ,tháng thứ <span style="color:green;">${thang }</span></h5>
			                            
			                            <div class="card-body">
			                                <div id="c3chart_zoommm"></div>
			                            </div>
			                        </div>
			                    </div>
			                    
			                    
                        </div>
                    </div>
                </div>
                
            </div>
            <script type="text/javascript">
					var b = ["Tiền_Thu_VND",null];
					var c = ["Tổng_Thu_VND",null];
				</script>
            
	           <script type="text/javascript">
	           <c:forEach items="${a }" var="o">
					b.push(${o});
			   </c:forEach>	
			   b.push(null);
			   <c:forEach items="${listb }" var="o">
				c.push(${o});
		   		</c:forEach>	
		   	 	c.push(null);
				</script>
            <!-- ============================================================== -->