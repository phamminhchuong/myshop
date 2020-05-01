<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="container-fluid dashboard-content">
      <%@include file="/templates/taglib.jsp" %>
			<div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="page-header" id="top">
                                    <h2 class="pageheader-title">Sửa sản phẩm</h2>
                                    <p class="pageheader-text"></p>
                                    <div class="page-breadcrumb">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Sản phẩm</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Sửa sản phẩm</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                <div class="row">
					
                    <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
                        
					 <div class="card">
					        <h5 class="card-header"></h5>
					        		<div class="alert alert-danger">Lưu ý: khi sửa ,sản phẩm sẽ reset lại toàn bộ số lượng vui lòng vào mục số lượng của sản phẩm để cập nhật lại</div>
                                    <div class="card-body">
                                        <form action="${pageContext.request.contextPath}/admin/product/edit" method="post" enctype="multipart/form-data">
                                         <div class="form-group">
                                                <label for="tensp" class="col-form-label">Tên sản phẩm</label>
                                                <input id="tensp" required="required" value="${Objpro.namepro }" data-parsley-required-message="Bạn phải nhập trường này" name="namepro" type="text" class="form-control" placeholder="">
                                            </div>
                                        	<input hidden="" name="id_pro" value="${Objpro.id_pro }" type="text" >
                                        	<h4>Màu sản phẩm</h4>
                                        	<c:forEach items="${listColor }" var="objcl">
                                        	<c:set var="check" value=""></c:set>
                                        		<c:forEach items="${listproductcolor }" var="objprocl">
                                        		<c:if test="${objcl.id_color eq  objprocl.id_color}">
                                        		<c:set var="check" value="checked"></c:set>
                                        		</c:if>
                                        		</c:forEach>
	                                            <label class="custom-control custom-checkbox custom-control-inline">
	                                                <input name="listmau" ${check } type="checkbox" value="${objcl.id_color }" class="custom-control-input"><span class="custom-control-label">${objcl.namecolor }</span>
	                                            </label>
	                                          	
                                            </c:forEach>
                                            
                                            <h4>Size</h4>
                                            <c:forEach items="${listsize }" var="objs">
                                            <c:if test="${objs.namesize eq 'XS' }"><c:set value="checked" var="checkXS"></c:set> </c:if>
                                            <c:if test="${objs.namesize eq 'S' }"><c:set value="checked" var="checkS"></c:set> </c:if>
                                            <c:if test="${objs.namesize eq 'M' }"><c:set value="checked" var="checkM"></c:set> </c:if>
                                            <c:if test="${objs.namesize eq 'L' }"><c:set value="checked" var="checkL"></c:set> </c:if>
                                            <c:if test="${objs.namesize eq 'XL' }"><c:set value="checked" var="checkXL"></c:set> </c:if>
                                            <c:if test="${objs.namesize eq 'XXL' }"><c:set value="checked" var="checkXXL"></c:set> </c:if>
                                            </c:forEach>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input ${checkXS } name="listsize" type="checkbox" value="XS" class="custom-control-input"><span class="custom-control-label">XS</span>
                                            </label>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input  ${checkS } name="listsize" type="checkbox" value="S" class="custom-control-input"><span class="custom-control-label">S</span>
                                            </label>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input  ${checkM } name="listsize" type="checkbox" value="M" class="custom-control-input"><span class="custom-control-label">M</span>
                                            </label>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input  ${checkL } name="listsize" type="checkbox" value="L" class="custom-control-input"><span class="custom-control-label">L</span>
                                            </label>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input  ${checkXL } name="listsize" type="checkbox" value="XL" class="custom-control-input"><span class="custom-control-label">XL</span>
                                            </label>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input  ${checkXXL } name="listsize" type="checkbox" value="XXL" class="custom-control-input"><span class="custom-control-label">XXL</span>
                                            </label>
                                            <!-- ///////////////////////////// -->
                                            
                                            <div class="form-row">
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Giá</label>
                                                <input type="number" min="0" value="${Objpro.gia}" name="gia" class="form-control" required data-parsley-required-message="Bạn phải nhập trường này">
                                                
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom04">Giá khuyễn mãi</label>
                                                <input id="validationCustom04" value="${Objpro.giakm }" type="number" min="0" name="giakm" class="form-control" required data-parsley-required-message="Bạn phải nhập trường này">
                                                
                                            </div>
                                     		
                                        	</div>
                                       		 <div class="form-group">
                                                <label for="soluong" class="col-form-label">Số lượng</label>
                                                <input id="soluong" value="${Objpro.soluong }" required="required" min="0" data-parsley-required-message="Bạn phải nhập trường này" name="soluong" type="number" class="form-control" placeholder="">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-form-label">Thuộc danh mục</label>
                                                <select class="form-control" name="id_cat">
                                                <option value="0">Không</option>
                                               	<c:forEach items="${listCat}" var="objc">
                                               		<c:set var="select" value=""></c:set>
                                               		<c:if test="${objc.id_cat eq Objpro.id_cat }"><c:set var="select" value="selected"></c:set></c:if>
                                               			<option ${select} value="${objc.id_cat}">${objc.namec}</option>
                                               		
                                                </c:forEach>
                                                </select>
                                            </div>
                                           <div class="custom-file mb-3">
                                                <input type="file" class="custom-file-input" multiple="multiple" name="file" id="fileupload">
                                                <label class="custom-file-label" for="customFile">Click Chọn hình ảnh</label>
                                                <c:if test="${not empty erorrImage }"></c:if>
                                                <p style="color:red">${erorrImage}</p>
                                                <p class="help-block">
													<em>Định dạng: jpg, png, jpeg,...</em>
												</p>
                                            </div>
                                            <hr />
												<b>Ảnh cũ</b>
											<br />
												<style type="text/css">
													#div-1{
														display: inline;
														
													}
													#div-2{
														display: inline;
														position:absolute;
														margin-left:1px;
														margin-top: 1px;
														background-color: red;
														width: 20px;
														height: 20px;
													}
													#x{
														color: black;
    													margin-left: 5px;
														font-weight: bold;
														font-size: 14px;
														text-align: center;
														
													}
												</style>
												<div id="image">
													<c:forEach items="${listimg}" var="objimg">
														<div id="div-1">
														<div id="div-2" onclick="delimage(${objimg.id_image})"><span id="x">X</span></div>
														<img alt="${objimg.nameimg}" width="100" height="100" src="${pageContext.request.contextPath}/files/${objimg.nameimg}">
														</div>
													</c:forEach>
												</div>
												<b>Ảnh đã chọn</b>
												<div id="dvPreview">
												</div>
												<hr />
                                            <div class="form-group">
                                                <label for="inputText4" class="col-form-label">Decription</label>
                                                <textarea class="form-control" id="editor" name="decription" rows="3">${Objpro.decription}</textarea>
                                                <script type="text/javascript">
	                                                CKEDITOR.replace('editor', {
	                                                    height: 300,
	                                                    filebrowserUploadUrl: '${pageContext.request.contextPath}/upload',

	                                                  });
	                                                
	                                                
									            </script>
                                            </div>
											
											<div class="form-group row text-left">
												<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
													<button type="submit" class="btn btn-space btn-primary">Submit</button>
													<button class="btn btn-space btn-secondary">Cancel</button>
												</div>
											</div>
										
											
                                        </form>
                                    </div>
                                    <div class="card-body border-top">
                                      	
                                    </div>
                                </div>
                            
                            <script type="text/javascript">
                            	function delimage(idimg) {
                            		$.ajax({
                              			url: '${pageContext.request.contextPath}/admin/image/xlajax',
                              			type: 'POST',
                              			cache: false,
                              			data: {
                              					//Dữ liệu gửi đi
                              				Idimg: idimg,
                              					},
                              			success: function(data){
                              				alert("thành công !");
                              				$('#image').html(data);
                              				//location.reload(true)
                              			},
                              			error: function (){
                              			alert("Lỗi rồi!");
                              			}
                              		});	
								}
                            
                            
                            
                            
								window.onload = function () {
								    var fileUpload = document.getElementById("fileupload");
								    fileUpload.onchange = function () {
								        if (typeof (FileReader) != "undefined") {
								            var dvPreview = document.getElementById("dvPreview");
								            dvPreview.innerHTML = "";
								            var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
								            for (var i = 0; i < fileUpload.files.length; i++) {
								                var file = fileUpload.files[i];
								                if (regex.test(file.name.toLowerCase())) {
								                    var reader = new FileReader();
								                    reader.onload = function (e) {
								                        var img = document.createElement("IMG");
								                        img.height = "100";
								                        img.width = "100";
								                        img.src = e.target.result;
								                        dvPreview.appendChild(img);
								                    }
								                    reader.readAsDataURL(file);
								                } else {
								                    alert(file.name + " Phải bạn chọn không phải là 1 file ảnh"); 
								                    dvPreview.innerHTML = "";
								                    return false;
								                }
								            }
								        } else {
								            alert("Trình duyệt không hỗ trợ xem trước ảnh.");
								        }
								    }
								};
								</script>
						
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->