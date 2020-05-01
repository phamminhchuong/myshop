
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div style="height: 50px"></div>
<div class="col-md-9 col-md-push-3 col-xs-12">
	<div class="row">
		<!-- blog-option start -->
		<div class="col-md-12">
			<div class="blog-option box-shadow mb-30  clearfix">
				<!-- categories -->
				<button class="option-btn">SỬA ĐỊA CHỈ</button>
			</div>
		</div>
		<!-- blog-option end -->
	</div>
	<div class="row">
		
		<div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
				<form id="formaddress" action="${pageContext.request.contextPath}/customer/adress/addedit" method="post">
									<c:if test="${not empty id_Address }"><c:set value="${id_Address }" var="idA"></c:set> </c:if>
									<c:if test="${empty id_Address }"><c:set value="0" var="idA"></c:set> </c:if>
					 				<input type="hidden" value="${idA}" name="id_address">
                                    <div class="login-account p-30 box-shadow">
                                            <div >
                                                <select name="id_province" required="required" data-parsley-required-message="Bạn phải nhập trường này" id="province" onchange="getDistrict(${id_Address })" class="custom-select">
                                                    <option selected disabled value="0">Tỉnh/Thành Phố</option>
                                                    <c:forEach items="${listprovince }" var="Province">
                                                    	<c:if test="${Province.id == obj.id_province}">
                                                    		<c:set value="selected" var="check"></c:set>
                                                    	</c:if>
                                                    	<c:if test="${Province.id != obj.id_province}">
                                                    		<c:set value="" var="check"></c:set>
                                                    	</c:if>
                                                    	<option ${check } value="${Province.id}">${Province._name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div>
                                                <select name="id_district" required="required" data-parsley-required-message="Bạn phải nhập trường này" onchange="getWard(${id_Address })" id="district" class="custom-select">
                                                    <option selected disabled value="0">Quận/Huyện</option>
                                                    <c:forEach items="${listdistrict }" var="District">
                                                    	<c:if test="${District.id == obj.id_district}">
                                                    		<c:set value="selected" var="check1"></c:set>
                                                    	</c:if>
                                                    	<c:if test="${District.id != obj.id_district}">
                                                    		<c:set value="" var="check1"></c:set>
                                                    	</c:if>
                                                   		
                                                    	<option ${check1 } value="${District.id}">${District._name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div >
                                                <select required="required" name="id_ward" data-parsley-required-message="Bạn phải nhập trường này" id="ward" class="custom-select">
                                                    	
                                                    <option selected="true" disabled value="0">Phường/Xã</option>
                                                     <c:forEach items="${listward }" var="Ward">
                                                    	<c:if test="${Ward.id == obj.id_ward}">
                                                    		<c:set value="selected" var="check3"></c:set>
                                                    	</c:if>
                                                    	<c:if test="${Ward.id != obj.id_ward}">
                                                    		<c:set value="" var="check3"></c:set>
                                                    	</c:if>
                                                   		
                                                    	<option ${check3 } value="${Ward.id}">${Ward._name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        <input required="required" value="${obj.namestreet }" name="namestreet" data-parsley-required-message="Bạn phải nhập trường này" data-parsley-minlength='10' data-parsley-minlength-message='Số nhà,tên đường trên 10 kí tự' type="text"  placeholder="Số nhà , tên đường..">
                                        <div class="row"> 	
                                            <div class="col-md-6">
                                                <button class="submit-btn-1 mt-20 btn-hover-1" type="submit" value="register">Xác nhận</button>
                                            </div>
                                            <div class="col-md-6">
                                                <button class="submit-btn-1 mt-20 btn-hover-1 f-right" type="reset">Clear</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
		</div>
	</div>
<script type="text/javascript">



function myFunction(sort) {
	for (var i = 0, len = sort.options.length; i < len; i++ ) {
	            var opt = sort.options[i].value;
	            if (sort.options[i].selected) {
	          	  return sort.options[i].value;
	            }
	        }  
	}

	function getDistrict(id){
		//xóa option ward nếu có khi chọn tên thành phố mới
		var ward = document.getElementById("ward");
		var length = ward.options.length;
		if(length > 1){
			for (i = length-1; i > 0; i--) {
				ward.options[i] = null;	
				}
		}
		
		var province = document.getElementById("province");
	    var id  = myFunction(province);
	    
	    $.ajax({
  			url: '${pageContext.request.contextPath}/getDistrict',
  			type: 'POST',
  			cache: false,
  			data: {
  					//Dữ liệu gửi đi
  				id: id,
  				
  				},
  			success: function(data){
  				//alert("thành công !");
  				$("#district").html(data);
  				//location.reload(true);
  			},
  			error: function (jqXHR,error, errorThrown){
                   alert("Something went wrong");
  			}
  		});
	}
	
	function getWard(id) {
		var district = document.getElementById("district");
	    var id  = myFunction(district);
	    
	    $.ajax({
  			url: '${pageContext.request.contextPath}/getWard',
  			type: 'POST',
  			cache: false,
  			data: {
  					//Dữ liệu gửi đi
  				id: id,
  				
  				},
  			success: function(data){
  				//alert("thành công !");
  				$('#ward').html(data);
  				//location.reload(true);
  			},
  			error: function (jqXHR,error, errorThrown){
                   alert("Something went wrong");
  			}
  		});
	}
</script>
	
</div>