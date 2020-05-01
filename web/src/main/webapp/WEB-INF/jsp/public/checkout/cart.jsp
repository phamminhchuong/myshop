<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/templates/taglib.jsp" %>
 
 <div class="shop-section mb-80">
                <div class="container">
                	<div style="height: 25px"></div>
                    <div class="row">
 <div class="col-md-12 col-sm-12">
                            <!-- Tab panes -->
                            <div class="tab-content">
       <!-- shopping-cart start -->
       <div id="showalert">
       </div>
        <h6 class="widget-title border-left mb-20">GIỎ HÀNG</h6>
       						<c:if test="${not empty listCarts and listCarts.size() > 0}">
                                <div class="tab-pane active" id="shopping-cart">
                                    <div class="shopping-cart-content">
                                    <c:if test="${not empty alertCoupon}">
                                    	<div class="alert alert-success">${alertCoupon}</div>
                                    </c:if>
                                            <div class="table-content table-responsive mb-50">
                                            
                                                <table class="text-center">
                                                    <thead>
                                                        <tr>
                                                            <th class="product-thumbnail">SẢN PHẨM</th>
                                                            <th class="product-price">GIÁ</th>
                                                            <th class="product-quantity">MÀU</th>
                                                            <th class="product-quantity">SIZE</th>
                                                            <th class="product-quantity">SỐ LƯỢNG</th>
                                                            <th class="product-subtotal">TỔNG</th>
                                                            <th class="product-remove">XÓA</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:set value="0" var="i"></c:set>
                                                    <c:forEach items="${listCarts }" var="objCart">
                                                    
                                                        <!-- tr -->
                                                        <tr>
                                                            <td class="product-thumbnail">
                                                                <div class="pro-thumbnail-img">
                                                                	<c:forEach items="${listImage }" var="objimg" >
                                                                		<c:if test="${objCart.id_product eq objimg.id_product }"><img width="100px" height="100px" src="${pageContext.request.contextPath }/files/${objimg.nameimg}" alt=""></c:if>
                                                                	</c:forEach>
                                                                    
                                                                </div>
                                                                <div class="pro-thumbnail-info text-left">
                                                                    <h6 class="">
                                                                    <c:forEach items="${listProduct }" var="objpro">
                                                                        <c:if test="${objCart.id_product eq objpro.id_pro }">
                                                                        	<c:set value="${objpro.namepro }" var="nameP"></c:set>
	                                                                        	<c:if test="${objpro.gia eq 0 }">
	                                                                        	<c:set value="${objpro.gia }" var="Gia"></c:set>
	                                                                        	</c:if>
	                                                                        	<c:if test="${objpro.gia > 0 }">
	                                                                        	<c:set value="${objpro.giakm }" var="Gia"></c:set>
	                                                                        	<c:set value="${objpro.gia }" var="giagoc"></c:set>
	                                                                        	</c:if>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    ${nameP }
                                                                    </h6>
                                                                   	<p>Sản phẩm của shopworkout</p>
                                                                </div>
                                                            </td>
                                                            <td class="product-price"><c:if test="${not empty listCodeSale }">
                                                            	<c:forEach items="${listCodeSale }" var="obj">
                                                            		<c:if test="${obj.id_salecode eq objCart.id_salecode}">
                                                            			<p>Mã: <span style="color:orange;">${obj.namecode}</span> giảm thêm <span style="color:red">-${obj.percent}%</span></p>
                                                            		</c:if>
                                                            	</c:forEach>
                                                            </c:if> 
                                                            <span onclick="changevnd(this)" class="money-change">${Gia }</span>
                                                            <span onclick="changevnd(this)" class="money-change" style="text-decoration: line-through;font-size: 14px;color: #1918188f;"> ${giagoc }</span>
                                                            </td>
                                                            <td class="product-quantity">
                                                            	<c:forEach items="${listColor }" var="objcl">
                                                            		<c:if test="${objcl.id_color eq objCart.id_color }">${objcl.namecolor}</c:if>
                                                            	</c:forEach>
                                                            </td>
                                                            <td class="product-quantity">
                                                                ${objCart.size }                                                            </td>
                                                            <td style="padding-left: 62px;padding-right: 59px;" class="product-quantity">
                                                            	<div class="form-group">
			                                                        	<input  onchange="changeCart(${i})" readonly="readonly" id="demo${i}" type="text" data-bts-min="1" value="${objCart.amount }" class="input-sm" name="demo4">
		                                                        </div>
																<script>
																    $("input[name='demo4']").TouchSpin();
																</script>
                                                            </td>
                                                            <td class="product-subtotal"><span onclick="changevnd(this)" class="money-change">${objCart.amount * Gia }</span></td>
                                                            <td class="product-remove">
                                                                <a href="javascript:void(0)" onclick="delcart(${i})"><i class="zmdi zmdi-close"></i></a>
                                                            </td>
                                                        </tr>
                                                        <!-- tr -->
                                                        <c:set value="${i+1}" var="i"></c:set>
                                                       </c:forEach> 
                                                       
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="coupon-discount box-shadow p-30 mb-50">
                                                    <form action="javascript:void(0)">
                                                        <h6 class="widget-title border-left mb-20">Mã giảm giá</h6>
                                                        <p  id="errorSaleCode">Nếu bạn có mã giảm giá, điền vào đây!</p>
                                                        <input id="namecuopon" type="text" name="namecuopon" placeholder="Enter your code here.">
                                                        <button onclick="addCuopon()" class="submit-btn-1 black-bg btn-hover-2" type="submit">Xác Nhận</button>
                                                    </form>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="payment-details box-shadow p-30 mb-50">
                                                        <h6 class="widget-title border-left mb-20">CHI TIẾT THANH TOÁN</h6>
                                                        <table>
                                                            <tr>
                                                                <td class="td-title-1">Tạm tính:</td>
                                                                <td onload="changeMoney(this)" class="td-title-2"><span onclick="changevnd(this)" class="money-change">${TongTamTinh }</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Giảm giá:</td>
                                                                <td class="td-title-2">-<span onclick="changevnd(this)" class="money-change">${GiamGia }</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Giảm giá của mã giảm giá:</td>
                                                                <td class="td-title-2">-<span onclick="changevnd(this)" class="money-change">${GiamGiaCuopon }</span></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="order-total">Thành tiền:</td>
                                                                <td class="order-total-price"><span onclick="changevnd(this)" class="money-change">${ThanhTien }</span></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                <button onclick="location.href='${pageContext.request.contextPath}/checkout';return false;" class="submit-btn-1 black-bg btn-hover-2 f-right">TIẾN HÀNH THANH TOÁN</button>
                                                <span id="a"></span>
                                                    <!-- <div class="culculate-shipping box-shadow p-30">
                                                        <h6 class="widget-title border-left mb-20">culculate shipping</h6>
                                                        <p>Enter your coupon code if you have one!</p>
                                                        <div class="row">
                                                            <div class="col-sm-4 col-xs-12">
                                                                <input type="text"  placeholder="Country">
                                                            </div>
                                                            <div class="col-sm-4 col-xs-12">
                                                                <input type="text"  placeholder="Region / State">
                                                            </div>
                                                            <div class="col-sm-4 col-xs-12">
                                                                <input type="text"  placeholder="Post code">
                                                            </div>
                                                            <div class="col-md-12">
                                                                <button class="submit-btn-1 black-bg btn-hover-2">get a quote</button>   
                                                            </div>
                                                        </div>
                                                    </div>	 -->
                                                </div>
                                            </div>
                                    </div>
                                </div>
                                <!-- shopping-cart end -->
                                <script type="text/javascript">
                                	var c = document.getElementById('demo'+id).value
                                	function changeCart(id) {
                                		var a = document.getElementById('demo'+id).value
                                		if(a == 1 && b == 1){
                                			
                                		}else{
                                			
                                			$.ajax({
    	                              			url: '${pageContext.request.contextPath}/changeCart',
    	                              			type: 'POST',
    	                              			cache: false,
    	                              			data: {
    	                              					//Dữ liệu gửi đi
    	                              				soluong:a,
    	                              				id: id,
    	                              					},
    	                              			success: function(data){
    	                              				//alert("thành công !");
    	                              				location.reload(true);
    	                              				//alert(data);
    	                              				//$('#a').html(data);
    	                              			},
    	                              			error: function (jqXHR,error, errorThrown){
    	                              				
    	                              				if(jqXHR.status&&jqXHR.status==400){
    	                              					var res = jqXHR.responseText.split("^");
    	                              					document.getElementById('demo'+id).value = res[1];
    	                              					$('#showalert').html("<div class='alert alert-danger'>"+res[0]+"</div>");
                                                   }else{
                                                       alert("Something went wrong");
                                                   }
    	                              			}
    	                              		})
                                		}
									}
                                	
                                	
                                	function addCuopon(){
                                		var namecuopon = document.getElementById('namecuopon').value;
                                		$.ajax({
	                              			url: '${pageContext.request.contextPath}/addCoupon',
	                              			type: 'GET',
	                              			cache: false,
	                              			data: {
	                              					//Dữ liệu gửi đi
	                              				namecuopon: namecuopon,
	                              					},
	                              			success: function(data){
	                              				alert("thành công !");
	                              				location.reload(true);
	                              			},
	                              			error: function (jqXHR,error, errorThrown){
	                              				if(jqXHR.status&&jqXHR.status==400){
	                              					$('#errorSaleCode').html(jqXHR.responseText);
                                               }else{
                                                   alert("Something went wrong");
                                               }
	                              			}
	                              		})
									}
                                	
                                	function delcart(id) {
                                		$.ajax({
	                              			url: '${pageContext.request.contextPath}/delcart',
	                              			type: 'POST',
	                              			cache: false,
	                              			data: {
	                              					//Dữ liệu gửi đi
	                              				id: id,
	                              					},
	                              			success: function(data){
	                              				//alert("thành công !");
	                              				location.reload(true);
	                              			},
	                              			error: function (jqXHR,error, errorThrown){
                                                   alert("Something went wrong");
	                              			}
	                              		})
									}
                                </script>
                                </c:if>
                                <c:if test="${empty listCarts or listCarts.size() eq 0}">
                                <div style="height: 400px;">
                                	<p style="text-align: center;padding-top: 15%;"> GIỎ HÀNG RỖNG QUAY LẠI MUA SẮM TIẾP NÀO !</p>
                                	<a href="${pageContext.request.contextPath}" style="text-align: center;margin-left: 44%;" class="btn btn-success">Tiếp tục mua sắm</a>
                                </div>
                                </c:if>
  </div>
  </div>
  </div>
  </div>
  </div>