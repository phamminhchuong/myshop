<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="container-fluid dashboard-content">
      <%@include file="/templates/taglib.jsp" %>
			<div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="page-header" id="top">
                                    <h2 class="pageheader-title">Sửa bài viết </h2>
                                    <p class="pageheader-text">Proin placerat ante duiullam scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi lobortis pulvinar quam.</p>
                                    <div class="page-breadcrumb">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Dashboard</a></li>
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">Bài viết</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Sửa bài viết</li>
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
                                        <form id="form" action="${pageContext.request.contextPath}/admin/blogs/edit" method="post" enctype="multipart/form-data">
                                         <div class="form-group">
                                                <label for="inputText4" class="col-form-label">Tên bài viết</label>
                                                <input id="inputText4" value="${objBlog.namebl }" required="required" data-parsley-required-message="Bạn phải nhập trường này" name="namebl" type="text" class="form-control" placeholder="">
                                            </div>
                                            <input hidden="" name="id_blog" value="${objBlog.id_blog}">
                                           <div class="custom-file mb-3">
                                                <input type="file" class="custom-file-input" name="file" id="fileupload">
                                                <label class="custom-file-label" for="customFile">Click Chọn hình ảnh</label>
                                                <p class="help-block">
													<em>Định dạng: jpg, png, jpeg,... (Lưu ý: Chọn ảnh mới ản cũ sẽ bị xóa)</em>
												</p>
                                            </div>
                                            <hr />
												<b>Ảnh cũ</b>
											<br />
											<img alt="${objBlog.image}" width="100" height="100" src="${pageContext.request.contextPath}/files/${objBlog.image}">
											<hr />
												<b>Live Preview</b>
											<br />
											
												<div id="dvPreview">
												</div>
												<hr />
                                            <div class="form-group">
                                                <label for="inputText4" class="col-form-label">Decription</label>
                                                <textarea required="required" data-parsley-required-message="Bạn nhập trường này" class="form-control" id="editor" name="content" rows="3">${objBlog.content}</textarea>
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
                            
                            <script language="javascript" type="text/javascript">
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
								                    alert(file.name + " không phải là 1 file ảnh"); 
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