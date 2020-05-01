<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@include file="/templates/taglib.jsp" %>
						<div class = "row">
					 <div class="col-md-5">
                            <div class="new-customers">
					 <form id="formaddress${id_Address }" action="${pageContext.request.contextPath}/addeditAddress" method="post">
					 				<input type="hidden" value="${id_Address }" name="id_address">
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
                                        <input required="required" name="namestreet" data-parsley-required-message="Bạn phải nhập trường này" data-parsley-minlength='10' data-parsley-minlength-message='Số nhà,tên đường trên 10 kí tự' type="text"  placeholder="Số nhà , tên đường..">
                                        <div class="checkbox">
                                            <label class="mr-10"> 
                                                <small>
                                                <c:if test="${obj.defaul == true}">
                                                	<input hidden checked="checked" type="checkbox" value="true"  name="defaul">
                                                	<input readonly disabled checked="checked" type="checkbox" value="true"  name="defaul">Đặt làm địa chỉ mặt định!
                                                </c:if>
                                                 <c:if test="${obj.defaul == false}">
                                                	<input type="checkbox" value="true"  name="defaul">Đặt làm địa chỉ mặt định!
                                                </c:if>
                                                    
                                                </small>
                                            </label>
                                           
                                        </div>
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
					</div>
					<script type="text/javascript">
							$('#formaddress'+${id_Address }).parsley();
						</script>

	