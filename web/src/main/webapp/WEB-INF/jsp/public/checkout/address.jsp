<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@include file="/templates/taglib.jsp" %>
    <div class="container">
    <script type="text/javascript">
    	var id_check = 0;
    </script>
				<h6 class="widget-title border-left mb-20">CHỌN ĐỊA CHỈ</h6>
		
				<c:if test="${not empty error }">
					<div class="alert alert-warning">${error }</div>
				</c:if>
				<c:if test="${not empty listAddress || listAddress.size() > 0}">
				<button class="btn btn-info" onclick="location.href='${pageContext.request.contextPath}/payment/${AddressDefaul.id_address }';return false;">Chọn địa chỉ mặc định</button>
					<c:forEach items="${listAddress }" var="obj">
	                    <div class="row">
	                    	<c:if test="${obj.defaul == true}">
	                    	<div style="border:3px dotted green;padding:10px 10px" class="col-md-5">
	                    	<p style="color:green"> mặc định </p>
	                    	</c:if>
	                    	<c:if test="${obj.defaul == false}">
	                    	<div style="border:3px dotted blue;padding:10px 10px" class="col-md-5">
	                    	</c:if>
	                        <c:forEach items="${listward }" var="w"><c:if test="${obj.id_ward == w.id }"><c:set value="${w._name }" var="nw"></c:set> </c:if>
	                        </c:forEach>
	                        <c:forEach items="${listprovince }" var="pp"><c:if test="${obj.id_province == pp.id }"><c:set value="${pp._name }" var="np"></c:set> </c:if>
	                        </c:forEach>
	                        <c:forEach items="${listdistrict }" var="d"><c:if test="${obj.id_district == d.id }"><c:set value="${d._name }" var="nd"></c:set> </c:if>
	                        </c:forEach>
	                            <p> Địa chỉ : ${obj.namestreet }, ${nw }, ${nd }, ${np}</p>
								<div class="f-right">
								<%-- <button onclick="location.href='${pageContext.request.contextPath}/payment/${obj.id_address }';return false;" class="btn btn-success">Chọn địa chỉ này</button> --%>
								<form style="display:inline;" action="${pageContext.request.contextPath}/chuyenhuong" method="post">
								<input type="hidden" readonly="readonly" value="${obj.id_address}" name="id">
								<button type="submit" class="btn btn-success">Chọn địa chỉ này</button>
								</form>
								<button onclick="editAddress(${obj.id_address})" class="btn btn-success">Sửa</button>
								</div>
	                        </div>
	                    </div>
	                    <div id="a-${obj.id_address}">
	                    	
	                    </div>
						<hr />
						
					</c:forEach>
					<button id="btn-add" onclick="editAddress(0)" class="btn btn-success">Thêm địa chỉ</button>
					
					<div id="a-0">
	                    	
	                 </div>
				</c:if>
				
				<c:if test="${empty listAddress || listAddress.size() == 0}">
				<div class="alert alert-success">Vui lòng thêm địa chỉ</div>
					
					<button id="btn-add" onclick="editAddress(0)" class="btn btn-success">Thêm địa chỉ</button>
					
					<div id="a-0">
	                    	
	                 </div>
				</c:if>
	</div>

	
	<script type="text/javascript">
	function gotocheckout(id) {
		$.ajax({
  			url: '${pageContext.request.contextPath}/chuyenhuong',
  			type: 'POST',
  			cache: false,
  			data: {
  					//Dữ liệu gửi đi
  				id: id,
  				
  				},
  			success: function(data){
  				//alert("thanh cong");
  				location.href='${pageContext.request.contextPath}/payment';
  			},
  			error: function (jqXHR,error, errorThrown){
                   alert("Something went wrong");
  			}
  		});
	}
	
	
	function del() {
		document.getElementById("a-1").innerHTML ="";
	}
	
	function editAddress(id){
		document.getElementById("a-"+id_check).innerHTML ="";
		id_check = id;
		$.ajax({
  			url: '${pageContext.request.contextPath}/editAddress',
  			type: 'POST',
  			cache: false,
  			data: {
  					//Dữ liệu gửi đi
  				id: id,
  				
  				},
  			success: function(data){
  				//alert("thành công !");
  				$('#a-'+id).html(data);
  				//location.reload(true);
  			},
  			error: function (jqXHR,error, errorThrown){
                   alert("Something went wrong");
  			}
  		});
	}
	
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
	
<div style="margin-top:100px"></div>