<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/templates/taglib.jsp" %>
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/templates/chartc3/c3.css">
       <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title">Thống kê</h2>
                                <!-- <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                                 --><div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Trang chủ</a></li>
                                            <li class="breadcrumb-item active"><a href="#" class="breadcrumb-link">Thống kê</a></li>
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

                       
                    </div>
                        <div class="row">
                        	<div style="position: fixed;
    margin-left: 56%;
    z-index: 1;
    margin-top: -112px;">
			                   		<form id="formchangetime" action="${pageContext.request.contextPath}/admin/thong-ke" method="get">
			                   		<span style="font-weight: bold;color: black">THỜI GIAN THỐNG KÊ :</span>
			                   			<select onchange="submitform()" name="thang">
			                   				<c:forEach begin="1" end="12" step="1" var="i">
			                   				<c:if test="${thang == i}"><c:set value="selected='selected'" var="check"></c:set></c:if>
			                   				<c:if test="${thang != i}"><c:set value="" var="check"></c:set></c:if>
			                   				<option ${check } value="${i }">${i}</option>
			                   				</c:forEach>
			                   			</select>
			                   			<span>/</span>
			                   			<select onchange="submitform()" name="nam">
			                   				<c:forEach begin="2015" end="${yearNow }" step="1" var="j"><c:if test="${nam == j}">
			                   					<c:set value="selected='selected'" var="checkn"></c:set></c:if>
			                   					<c:if test="${nam != j}"><c:set value="" var="checkn"></c:set></c:if>		
			                   				<option ${checkn } value="${j }">${j}</option>
			                   				</c:forEach>
			                   			</select>
			                   		</form>
                       			</div>
                        </div>
                        
                        <br/>
                        <div class="row">
                   
			                    <script type="text/javascript">
			                   function submitform() {
			                	   document.getElementById("formchangetime").submit();
								}
			                    
			                    	
			                     function showthunhap(check) {
									if(check == 1){
										document.getElementById("thunhapthang").style.display = "block";
					                     document.getElementById("thunhapnam").style.display = "none";
									}else if(check == 2){
										document.getElementById("thunhapthang").style.display = "none";
					                     document.getElementById("thunhapnam").style.display = "block";
									}
			                     }
									 function showviewblog(check) {
											if(check == 1){
												document.getElementById("viewthang").style.display = "block";
							                     document.getElementById("viewnam").style.display = "none";
											}else if(check == 2){
												document.getElementById("viewthang").style.display = "none";
							                     document.getElementById("viewnam").style.display = "block";
											}
									
								}
			                    
									 function showbestseller(check) {
											if(check == 1){
												document.getElementById("tablebestsellmonth").style.display = "block";
							                     document.getElementById("tablebestsellyear").style.display = "none";
											}else if(check == 2){
												document.getElementById("tablebestsellmonth").style.display = "none";
							                     document.getElementById("tablebestsellyear").style.display = "block";
											}
									
								}
			                    </script>
			                    <div style="position: absolute;margin-left: 88%;z-index: 1;">
			                   	<button style="padding: 0px" onclick="showthunhap(1)" class="btn btn-danger">Tháng</button>
			                    	<button style="padding: 0px" onclick="showthunhap(2)" class="btn btn-info">Năm</button>
                       			</div>
                       			
                       			<div id="thunhapthang" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                       			
			                        <div class="card">
			                            <h5 style="font-weight: bold;" class="card-header">Biểu đồ thu nhập trong tháng <span style="color:green;">${thang }</span> ,ngày thứ <span style="color:green;">${ngay }</span></h5>
			                            <div class="card-body">
			                                <div id="chart-tnt"></div>
			                            </div>
			                        </div>
			                    </div>
			                   
			                    
			                    <div id="thunhapnam"  class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			                        <div class="card">
			                            <h5 style="font-weight: bold;" class="card-header">Biểu đồ thu nhập trong năm <span style="color:green;">${nam }</span> ,tháng thứ <span style="color:green;">${thang }</span></h5>
			                            
			                            <div class="card-body">
			                                <div id="chart-tnn"></div>
			                            </div>
			                        </div>
			                    </div>
			                     </div>
			                     
			                  <div class="row">
			                 	 <div style="position: absolute;margin-left: 88%;z-index: 1;">
			                   	<button style="padding: 0px" onclick="showviewblog(1)" class="btn btn-danger">Tháng</button>
			                    	<button style="padding: 0px" onclick="showviewblog(2)" class="btn btn-info">Năm</button>
                       			</div>
                       			
			                    <div id="viewthang" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			                        <div class="card">
			                            <h5 class="card-header">Biểu đồ lượt xem bài viết và lượt bình luận trong tháng <span style="color:green;">${thang }</span> ,ngày thứ <span style="color:green;">${ngay }</span></h5>
			                            <div class="card-body">
			                                 <div id="chart_view_by_day"></div>
			                            </div>
			                        </div>
			                    </div>
			                   
			                     <div id="viewnam" class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			                        <div class="card">
			                            <h5 class="card-header">Biểu đồ lượt xem bài viết và lượt bình luận trong năm <span style="color:green;">${nam }</span> ,tháng thứ <span style="color:green;">${thang }</span></h5>
			                            <div class="card-body">
			                                 <div id="chart_view_by_month"></div>
			                            </div>
			                        </div>
			                    </div>
			                    
			                    
			                    
			                    
                       		</div>
                       		
                       		<div class="row">
                       			<div style="position: absolute;margin-left: 88%;z-index: 1;">
			                   	<button style="padding: 0px" onclick="showbestseller(1)" class="btn btn-danger">Tháng</button>
			                    	<button style="padding: 0px" onclick="showbestseller(2)" class="btn btn-info">Năm</button>
                       			</div>
                       			 <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
			                        <div class="card">
			                            <h5 class="card-header">Danh sách sản phẩm bán chạy</h5>
			                            <div class="card-body">
			                            
			                                <table id="tablebestsellmonth" class="table">
											  <tr>
											    <th>Top</th>
											    <th>Tên sản phẩm</th>
											  </tr>
											  <c:set value="1" var="count"></c:set>
											   <c:forEach items="${listBestSellerByMonth }" var="objBS">
												  <tr>
												  
												    <td><a style="color:red" href="#">#${count}</a></td>
												    <td>${objBS.namepro }</td>
												   
												     <c:set value="${count + 1}" var="count"></c:set>
												  </tr>
											  </c:forEach>
											</table>
											
											<table id="tablebestsellyear" class="table">
											  <tr>
											    <th>Top</th>
											    <th>Tên sản phẩm</th>
											  </tr>
											  <c:set value="1" var="count"></c:set>
											   <c:forEach items="${listBestSellerByYear }" var="objBS">
												  <tr>
												    <td><a style="color:blue" href="#">#${count}</a></td>
												    <td>${objBS.namepro }</td>
												   
												     <c:set value="${count + 1}" var="count"></c:set>
												  </tr>
											  </c:forEach>
											</table>
			                            </div>
			                        </div>
			                    </div>
                       		</div>
                    </div>
                </div>
                
 <script src="${pageContext.request.contextPath }/templates/chartc3/c3.min.js"></script>
 <script src="${pageContext.request.contextPath }/templates/chartc3/d3-5.8.2.min.js"></script>           

 <script type="text/javascript">
					var b = ["Tiền_Thu_VND",null];
					var c = ["Tổng_Thu_VND",null];
					
					var viewByDay = ["Tổng_Lượt_Xem",null];
					var viewByMonth = ["Tổng_Lượt_Xem",null];
					
					var commentByDay = ["Tổng_Lượt_Bình_Luận",null];
					var commentByMonth = ["Tổng_Lượt_Bình_Luận",null];
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
		   	 	
			   	 <c:forEach items="${viewbyDay }" var="o">
			   		viewByDay.push(${o});
		   		</c:forEach>	
		   		viewByDay.push(null);
			   	 <c:forEach items="${viewbyMonth }" var="o">
			   		viewByMonth.push(${o});
				</c:forEach>
				viewByMonth.push(null);
				
				<c:forEach items="${commentByDay }" var="o">
				commentByDay.push(${o});
				</c:forEach>
				commentByDay.push(null);
				
				<c:forEach items="${commentByMonth }" var="o">
				commentByMonth.push(${o});
				</c:forEach>
				commentByMonth.push(null);
				</script>
<script type="text/javascript">
//
var chart2 = c3.generate({
    bindto: "#chart-tnt",
    data: {
        columns: [
        	b,
        ],
        //type: 'spline',
        colors: {
        	Tiền_Thu_VND: '#5969ff',

        }
    },
	zoom: {
        enabled: true
    },
    axis: {
        y: {
        	label: 'Đơn vị: VNĐ',
             show: true,
            tick: {
               format: d3.format(",")
               //format: function (d) { return "đ" + d; },d3.format("$,")
           }


        },
        x: {
        	label: 'Ngày',
            show: true,
        }
    }
});

	
var chart1 = c3.generate({
     bindto: "#chart-tnn",
     data: {
         columns: [
             c,
         ],
        types: {
           
      	 Tổng_Thu_VND: 'area',
          
       	},
         colors: {
      	  Tổng_Thu_VND: 'green'
         },
       	
        //labels: true,
     },
    
     //zoom: {
      //   enabled: true
     //},
     axis: {
         y: {
      	  label: 'Đơn vị: VNĐ',
             show: true,
            tick: {
               format: d3.format(",")
               //format: function (d) { return "đ" + d; },d3.format("$,")
           }
         },
         x: {
      	  label: 'Tháng',
             show: true,
            /* tick: {
                //format: d3.format(",")
                format: function (d) { return "Thang " + d; }
            } */
         }
     }

 });

var chart3 = c3.generate({
    bindto: "#chart_view_by_day",
    data: {
        columns: [
        	viewByDay,
        	commentByDay
        ],
        //type: 'spline',
        colors: {
        	Tổng_Lượt_Xem: '#5969ff',
        	Tổng_Lượt_Bình_Luận: 'red',
        }
    },
	/* zoom: {
        enabled: true
    }, */
    axis: {
        y: {
        	label: 'Đơn vị: Lượt',
             show: true,
            tick: {
               format: d3.format("")
               //format: function (d) { return "đ" + d; },d3.format("$,")
           }
        },
        x: {
        	label: 'Ngày',
            show: true,
        }
    }
});

var chart4 = c3.generate({
    bindto: "#chart_view_by_month",
    data: {
        columns: [
        	viewByMonth,
        	commentByMonth
        ],
        types: {
            
        	Tổng_Lượt_Xem: 'area',
        	Tổng_Lượt_Bình_Luận: 'area',
             
          	},
        colors: {
        	Tổng_Lượt_Xem: 'orange',
        	Tổng_Lượt_Bình_Luận: 'green',
        }
    },
	/* zoom: {
        enabled: true
    }, */
    axis: {
        y: {
        	label: 'Đơn vị: Lượt Xem',
             show: true,
            tick: {
               format: d3.format("")
               //format: function (d) { return "đ" + d; },d3.format("$,")
           }
        },
        x: {
        	label: 'Tháng',
            show: true,
        }
    }
});

	document.getElementById("viewnam").style.display = "none";
	document.getElementById("thunhapnam").style.display = "none";
	 document.getElementById("tablebestsellyear").style.display = "none";
</script>
            <!-- ============================================================== -->