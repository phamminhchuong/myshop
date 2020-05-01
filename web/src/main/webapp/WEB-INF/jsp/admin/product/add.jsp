<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="container-fluid dashboard-content">
      <%@include file="/templates/taglib.jsp" %>
			<div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="page-header" id="top">
                                    <h2 class="pageheader-title">Thêm sản phẩm</h2>
                                    <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                                    <div class="page-breadcrumb">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Sản phẩm</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Thêm sản phẩm</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                <div class="row">
					
                    <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
                        
					 <div class="card">
					        <h5 class="card-header">Basic Form</h5>
                                    <div class="card-body">
                                        <form id="form" action="${pageContext.request.contextPath}/admin/product/add" method="post" enctype="multipart/form-data">
                                         <div class="form-group">
                                                <label for="inputText4" class="col-form-label">Tên sản phẩm</label>
                                                <input id="inputText4" required="required" data-parsley-required-message="Bạn phải nhập trường này" name="namepro" type="text" class="form-control" placeholder="">
                                            </div>
                                        	
                                        	<h4>Màu sản phẩm</h4>
                                        	<c:forEach items="${listColor }" var="objcl">
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input name="listmau" type="checkbox" value="${objcl.id_color }" class="custom-control-input"><span class="custom-control-label">${objcl.namecolor }</span>
                                            </label>
                                            </c:forEach>
                                            
                                            <h4>Size</h4>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input name="listsize" type="checkbox" value="XS" class="custom-control-input"><span class="custom-control-label">XS</span>
                                            </label>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input name="listsize" type="checkbox" value="S" class="custom-control-input"><span class="custom-control-label">S</span>
                                            </label>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input name="listsize" type="checkbox" value="M" class="custom-control-input"><span class="custom-control-label">M</span>
                                            </label>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input name="listsize" type="checkbox" value="L" class="custom-control-input"><span class="custom-control-label">L</span>
                                            </label>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input name="listsize" type="checkbox" value="XL" class="custom-control-input"><span class="custom-control-label">XL</span>
                                            </label>
                                            <label class="custom-control custom-checkbox custom-control-inline">
                                                <input name="listsize" type="checkbox" value="XXL" class="custom-control-input"><span class="custom-control-label">XXL</span>
                                            </label>
                                            <!-- ///////////////////////////// -->
                                            <div class="form-row">
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom03">Giá</label>
                                                <input id="gia" type="number" min="0" name="gia" class="form-control" required data-parsley-required-message="Bạn phải nhập trường này">
                                                
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12 mb-2">
                                                <label for="validationCustom04">Giá khuyễn mãi</label>
                                                <input id="giakm" type="number" min="0" name="giakm" class="form-control" required data-parsley-required-message="Bạn phải nhập trường này">
                                            </div>
                                     		<script type="text/javascript">
                                     			function validgiaandgiakm() {
                                     				var gia = document.getElementById("gia").value;
                                     				var giakm = document.getElementById("giakm").value;
                                     				if(giakm <= gia){
                                     					document.getElementById("alert").innerHTML = "Giá phải lớn hơn giá khuyến mãi";
                                     					return false;
                                     				}else{
                                     					return true;
                                     				}
												}
                                     		</script>
                                     		<p style="color:red" id="alert"></p>
                                        	</div>
                                       		
                                            <div class="form-group">
                                                <label class="col-form-label">Thuộc danh mục</label>
                                                <select class="form-control" name="id_cat">
                                                <option value="0">Không</option>
                                               <c:forEach items="${listCat }" var="objc">
                                               			<option value="${objc.id_cat}">${objc.namec}</option>
                                                </c:forEach>
                                                </select>
                                            </div>
                                           <div class="custom-file mb-3">
                                                <input required="required" data-parsley-required-message="Bạn phải chọn hình ảnh" type="file" class="custom-file-input" multiple="multiple" name="file" id="fileupload">
                                                <label class="custom-file-label" for="customFile">Click Chọn hình ảnh</label>
                                                <p class="help-block">
													<em>Định dạng: jpg, png, jpeg,...</em>
												</p>
                                            </div>
                                            <hr />
												<b>Live Preview</b>
											<br />
											
												<div id="dvPreview">
												</div>
												<hr />
                                            <div class="form-group">
                                                <label for="inputText4" class="col-form-label">Decription</label>
                                                <textarea required="required" data-parsley-required-message="Bạn nhập trường này" class="form-control" id="editor" name="decription" rows="3"></textarea>
                                                <script type="text/javascript">
	                                                CKEDITOR.replace('editor', {
	                                                    height: 300,
	                                                    filebrowserUploadUrl: '${pageContext.request.contextPath}/upload',

	                                                  });
	                                                
	                                                
									            </script>
                                            </div>
											
											<div class="form-group row text-left">
												<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
													<button onclick="return validgiaandgiakm()" type="submit" class="btn btn-space btn-primary">Submit</button>
													<button class="btn btn-space btn-secondary">Cancel</button>
												</div>
											</div>
										
											
                                        </form>
                                    </div>
                                    <div class="card-body border-top">
                                      	
                                    </div>
                                </div>
                            
                            <script type="text/javascript">
								//window.onload = function () {
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
								                    alert(file.name + " không phải là 1 file ảnh"); 
								                    dvPreview.innerHTML = "";
								                    return false;
								                }
								            }
								        } else {
								            alert("Trình duyệt không hỗ trợ xem trước ảnh.");
								        }
								    }
								//};
								</script>
						
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->