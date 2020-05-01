<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%@include file="/templates/taglib.jsp" %>
  <style>
  	.label-radio{
  	
  	position: absolute;
    font-size: 15px;
    margin-top: 10px;
    margin-left: 10px;
  	}
  	.alert-ship{
  	color: green;
    /* padding-top: 0px; */
    position: absolute;
    margin-top: -15px;
    font-size: 11px;
  	}
  </style>
  
  
  
  
	<div style="margin-bottom: 20px" class="container">
		<!-- Button trigger modal -->


  
		<div class="col-md-12">
		
		 <div class="checkout-content box-shadow p-30">
                                            <div  class="row">
                                                <!-- billing details -->
                                                <div class="col-md-6">
                                                    <div class="billing-details pr-10">
                                                        <h6 class="widget-title border-left mb-20">HÌNH THỨC VẬN CHUYỂN</h6>
                                                        <div >
                                                        <c:if test="${Order.payship == 1}">
                                                        	<c:set value="checked" var="check1"></c:set>
                                                        </c:if>
                                                        <c:if test="${Order.payship == 2}">
                                                        	<c:set value="checked" var="check2"></c:set>
                                                        </c:if>
                                                        	<div>
		                                                        <input ${check1 } type="radio" value="1" name="transport" /><span class="label-radio">Giao hàng tiêu chuẩn</span>
		                                                        <p class="alert-ship">${alertVungN }</p>
	                                                        </div>
	                                                        <div>
		                                                        <input ${check2 } 	type="radio" value="2" name="transport" /><span class="label-radio">Giao hàng nhanh</span>
		                                                        <p class="alert-ship">${alertVungF }</p>
	                                                        </div>
	                                                        <a href="javascript:void(0)" onclick="addshowarea()" style="text-decoration: underline;color: blue">Xem bảng vùng của chúng tôi</a>
	                                                        <div id="showArea">
	                                                        
	                                                        </div>
                                                      </div>
                                                    </div>
                                                	<div class="payment-method">
                                                        <h6 class="widget-title border-left mb-20">HÌNH THỨC THANH TOÁN</h6>
                                                        <div>
                                                       		 <input onclick="hidebtnPaypal()" id="payment_method_normal" checked="checked" type="radio" value="1" name="payment" /><span class="label-radio">Thanh toán khi nhận hàng</span><br />
                                                        </div>
                                                        <div>
                                                      		<input onclick="showbtnPaypal()" type="radio" data-order_button_text="Proceed to PayPal" value="2" name="payment" class="input-radio" id="payment_method_paypal" /><span class="label-radio">Thanh toán bằng PayPal</span><br />
                                                     	 </div>
                                                          <div style="display: none;" id="paypal-button-container"></div><a style="color: blue;text-decoration: underline;" title="What is PayPal?" onclick="javascript:window.open('https://www.paypal.com/gb/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;" class="about_paypal" href="https://www.paypal.com/gb/webapps/mpp/paypal-popup">PayPal là gì ?</a>
                                               
                                                       </div>
                                                </div>
                                                <div class="col-md-6">
                                                	<div class="payment-details pl-10 mb-50">
                                                        <h6 class="widget-title border-left mb-20">ĐỊA CHỈ GIAO HÀNG</h6>
                                                         <p style="font-weight: bold;">${userInfo.name }</p>
                                                         <p>Địa chỉ: ${Address }</p>
                                                         <p>SĐT: ${userInfo.phone }</p>
                                                    </div> 
                                                
                                                    <!-- our order -->
                                                    <div class="payment-details pl-10 mb-50">
                                                        <h6 class="widget-title border-left mb-20">ĐƠN HÀNG</h6>
                                                                <table>
                                                        <c:forEach items="${listCart }" var="obj">
                                                        	<c:forEach items="${listProduct }" var="objp">
                                                        		<c:if test="${obj.id_product eq objp.id_pro}">
                                                        			<c:set value="${objp.namepro}" var="namePro"></c:set>
                                                        			<c:if test="${objp.giakm > 0 }">
                                                        			<c:set value="${objp.giakm}" var="Gia"></c:set>
                                                        			</c:if>
                                                        			<c:if test="${objp.giakm == 0 }">
                                                        			<c:set value="${objp.gia}" var="Gia"></c:set>
                                                        			</c:if>
                                                        			
                                                        		</c:if>
                                                        	</c:forEach>
                                                        	<c:if test="${obj.size != '0'}">
                                                        			<c:set value="Size: ${obj.size}" var="Size"></c:set>
                                                        	</c:if>
                                                        	<c:forEach items="${listColor }" var="objcl">
                                                        		<c:if test="${obj.id_color eq objcl.id_color}">
                                                        			<c:set value="Màu: ${objcl.namecolor}" var="Mau"></c:set>
                                                        	</c:if>
                                                        	</c:forEach>
                                                            <tr>
                                                                <td class="td-title-1">${namePro } x ${obj.amount } , ${Size },${Mau } </td>
                                                                <td class="td-title-2"><span onclick="changevnd(this)" class="money-change">${Gia }</span>đ</td>
                                                            </tr>
                                                        </c:forEach> 
                                                            <tr>
                                                                <td class="td-title-1">Tổng sản phẩm</td>
                                                                <td class="td-title-2"><span onclick="changevnd(this)" class="money-change">${ThanhTien }</span>đ</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Phí vận chuyển</td>
                                                                <td class="td-title-2"><span onclick="changevnd(this)" class="money-change">${payShip }</span>đ</td>
                                                            </tr>
                                                          
                                                            <tr>
                                                                <td class="order-total">TỔNG HÓA ĐƠN</td>
                                                                <td class="order-total-price"><span onclick="changevnd(this)" class="money-change">${ThanhTien + payShip}</span>đ</td>
                                                            </tr>
                                                        </table>
                                                    </div> 
                                                    <!-- payment-method -->
                                                    
                                                    <!-- payment-method end -->
                                                    <button onclick="location.href='${pageContext.request.contextPath}/checkout/success'" class="submit-btn-1 mt-30 btn-hover-1" >THANH TOÁN</button>
                                                </div>
                                            </div>
                                    </div>		
                                    
                              <script type="text/javascript">
                              function showbtnPaypal() {
                            	  document.getElementById("paypal-button-container").style.display = "block"
							}
                              function hidebtnPaypal() {
                            	  document.getElementById("paypal-button-container").style.display = "none"
							}
                                $('input[type=radio][name=transport]').change(function() {
                                	var id = this.value;
                            	    $.ajax({
							  			url: '${pageContext.request.contextPath}/changeTransport',
							  			type: 'POST',
							  			cache: false,
							  			data: {
							  					//Dữ liệu gửi đi
							  				id: id,
							  					},
							  			success: function(data){
							  				location.reload(true)
							  			},
							  			error: function (){
							  			// Xử lý nếu có lỗi
							  				alert("Lỗi rồi!");
							  			
							  			}
							  		});
                            	});
                              
                              
                              
                              
                              var checks = false;
                              function addshowarea() {
                            	  var html= "<table class='table table-bordered'>\r\n" + 
                      			"		  <thead>\r\n" + 
                      			"		    <tr>\r\n" + 
                      			"		      <th scope='col'>Vùng</th>\r\n" + 
                      			"		      <th scope='col'>Tỉnh/Thành phố</th>\r\n" + 
                      			"		    </tr>\r\n" + 
                      			"		  </thead>\r\n" + 
                      			"		  <tbody>\r\n" + 
                      			"		    <tr>\r\n" + 
                      			"		      <th scope='row'>Vùng 1</th>\r\n" + 
                      			"		      <td>An Giang, Bình Dương, Bình Phước, Bà Rịa - Vũng Tàu, Bạc Liêu, Bến Tre,\r\n" + 
                      			"Bình Thuận, Cà Mau, Cần Thơ, Đồng Nai, Đồng Tháp, Hậu Giang, Kiên Giang,\r\n" + 
                      			"Khánh Hòa, Long An, Lâm Đồng, Ninh Thuận, Sóc Trăng, Tây Ninh,\r\n" + 
                      			"Tiền Giang, Trà Vinh, Vĩnh Long,TP Hồ chí minh</td>\r\n" + 
                      			"		    </tr>\r\n" + 
                      			"		    <tr>\r\n" + 
                      			"		      <th scope='row'>Vùng 2</th>\r\n" + 
                      			"		      <td>Bình Định, Đắc Lắc, Đắc Nông, Gia Lai, Huế, Kon Tum, Phú Yên, Quảng Nam,\r\n" + 
                      			"Quảng Ngãi, Quảng trị,Đà Nẵng</td>\r\n" + 
                      			"		    </tr>\r\n" + 
                      			"		    <tr>\r\n" + 
                      			"		      <th scope='row'>Vùng 3</th>\r\n" + 
                      			"		      <td>Bắc Cạn, Bắc Giang, Bắc Ninh, Cao Bằng, Điện Biên, Hà Giang, Hà Nam,\r\n" + 
                      			"Hà Tĩnh, Hải Dương, Hưng Yên, Hải Phòng, Hòa Bình, Lào Cai, Lạng Sơn, Lai\r\n" + 
                      			"Châu, Nam Định, Nghệ An, Ninh Bình, Phú Thọ, Quảng Ninh, Quảng Bình,\r\n" + 
                      			"Sơn La, Thái Bình, Thái Nguyên, Thanh Hóa, Tuyên Quang, Vĩnh Phúc, Yên Bái,Hà Nội</td>\r\n" + 
                      			"		    </tr>\r\n" + 
                      			"		  </tbody>\r\n" + 
                      			"		</table>";
                      			if(!checks){
                      				$('#showArea').append(html);
                              	  $('#showArea').fadeIn('slow');
                              	  checks = true;
                      			}else{
                      				
    								$('#showArea').children().remove();
    								$('#showArea').fadeOut('slow');
    								checks = false;
                      			}
                      			
								}
                              	
                    			
                              </script>      
                                    
                                    
                              <script>
							        paypal.Button.render({
							
							            env: 'sandbox', // sandbox | production
							
							            // PayPal Client IDs - replace with your own
							            // Create a PayPal app: https://developer.paypal.com/developer/applications/create
							            client: {
							            	sandbox:    'ASdA1nkHYrpH7yXPUKi8HVUcU5db__yRNB4yQZvk5T5SHUk8KmgTfBumvtnytS4sbMAVQ1U0j2OWdg4W',
							                production: '<insert production client id>'
							            },
							
							            // Show the buyer a 'Pay Now' button in the checkout flow
							            commit: true,
							
							            // payment() is called when the button is clicked
							            payment: function(data, actions) {
							            	
							                // Make a call to the REST api to create the payment
							                return actions.payment.create({
							                    payment: {
							                        transactions: [
							                            {
							                                amount: { total: ${VNDtoUSD}, currency: 'USD' }
							                            }
							                        ]
							                    }
							                });
							            },
										//
										
										onError: function(err) {
											window.alert('Thanh toán thất bại!');
									     },
							            
									     onCancel: function (data) {
									    	    // Show a cancel page, or return to cart
									    	 $("#payment_method_normal").prop("checked", true);
									    	  },
									     
							            // onAuthorize() is called when the buyer approves the payment
							            onAuthorize: function(data, actions) {
							            	//window.alert(data);
							                // Make a call to the REST api to execute the payment
							                return actions.payment.execute().then(function() {
							                    //window.alert('Thanh toán thành công !');
							                    $("#payment_method_paypal").prop("checked", true);
							                    var id = document.getElementById("payment_method_paypal").value;
							                    $.ajax({
										  			url: '${pageContext.request.contextPath}/checkPayPal',
										  			type: 'POST',
										  			cache: false,
										  			data: {
										  					//Dữ liệu gửi đi
										  				id: id,
										  				
										  					},
										  			success: function(data){
										  				location.href='${pageContext.request.contextPath}/checkout/success';
										  				//location.reload(true)
										  				
										  			},
										  			error: function (){
										  			// Xử lý nếu có lỗi
										  				alert("Lỗi rồi!");
										  			}
										  		});
							                });
							            }
							
							        }, '#paypal-button-container');
							
							    </script>  
		
	</div>
</div>