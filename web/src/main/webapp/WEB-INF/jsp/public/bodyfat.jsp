<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Start page content -->
<%@include file="/templates/taglib.jsp"%>
<section id="page-content" class="page-wrapper">
	<style>
	
		input[type="number"]{
                            	background: #fffbfb none repeat scroll 0 0;
    border: 1px solid #00000000;
    box-shadow: 0 0 0px 1px rgba(2, 2, 2, 0.29);
    color: #060606;
    font-size: 13px;
    height: 40px;
    margin-bottom: 20px;
    padding-left: 20px;
    width: 100%;
       }
       	.mybutton{
                                            	font-weight: bold;
											    background: #fff;
											    border: 1px solid #3a7cdf;
											    font-size: 12px;
											    color: #3584e4;
											    /* width: 99px; */
											    margin-top: -5px;
											    border-radius: 4px;
                                            	}
                                            	.mybutton:hover{
											    background: #3a7cdf;
											    color: white;
                                            	}
                                            	.active{
                                            	 background: #3a7cdf;
											     color: white;
                                            	}
                            	
	</style>
	<!-- ADDRESS SECTION START -->
	<div class="address-section mb-80">
		<div class="container">
		<h1 style="color:gray;font-size: 60px;margin-left: 35%">BODY <span style="color:orange;">FAT</span></h1>
			<div class="row">
			<style>
			/* 
			input[type="radio"]{
			    width: 6%;
    height: 22px;
			}
			
			.a{
			position: absolute;
    margin-top: 2px;
    margin-left: 6px;
			} */
			
			</style>
			
                        
				<div class="col-md-4">
                            <div class="registered-customers">
                                <h5 class="widget-title border-left mb-50">TÍNH BODY FAT</h5>
                                <form action="javascript:void(0)">
                                    <div class="login-account p-30 box-shadow">
                                    <div >
                                    	<input checked="checked" type="radio" name="sex" value="1"><span class="a" style="position: absolute;">Nam</span>
                                    	<input style="padding-left: 26px;margin-left: 232px;" type="radio" name="sex" value="0"><span class="a" style="position: absolute;">Nữ</span>
                                    </div>
                                        <input type="number" id="height" name="height" placeholder="Chiều cao [cm]" step="0.5" min="1">
                                        <input type="number" id="weight" name="weight" placeholder="Cân nặng [kg]" step="0.5" min="1">
                                        <input type="number" id="vongco" name="vongco" placeholder="Vòng cổ [cm]" step="0.5" min="1">
                                        <input type="number" id="vongeo" name="vongeo" placeholder="Vòng eo [cm]" step="0.5" min="1">
                                        <input type="number" id="vonghong" name="vonghong" placeholder="Vòng hông [cm]" step="0.5" min="1">
                                        
                                        <button onclick="bodyFat()" class="submit-btn-1 btn-hover-1" type="submit">Tính toán</button>
                                    </div>
                                </form>
                                
                                <script type="text/javascript">
                                	function bodyFat() {
                                    	var height = document.getElementById("height").value;
                                    	var weight = document.getElementById("weight").value;
                                    	var vongco = document.getElementById("vongco").value;
                                    	var vongeo = document.getElementById("vongeo").value;
                                    	var vonghong = document.getElementById("vonghong").value;
                                    	var sex = document.querySelector('input[name="sex"]:checked').value;
                                    	var bf;
                                    	var category;
                                    	var klnac,klmo;
                                    	if (sex == 1) {
                                            bf = Math.round((86.010 * Math.log10((vongeo*0.39) - (vongco*0.39)) - 70.041 * Math.log10(height*0.39) + 36.76) * 10) / 10; // for man
                                            //console.log(Math.round(bf * 10) / 10 + " % Male");
                                            if(bf < 2){
                                            	category = "Lượng mỡ rất nhỏ";
                                            }else if(2<=bf && bf<6){
                                            	category = "Lượng mỡ tối thiểu cần thiết";
                                            }else if(6<=bf && bf<14){
                                            	category = "Vận động viên";
                                            }else if(14<=bf && bf<18){
                                            	category = "Khỏe mạnh";
                                            }else if(18<=bf && bf<26){
                                            	category = "Bình thường";
                                            }else if(26<=bf){
                                            	category = "Mập";
                                            }
                                            
                                        } else if (sex == 0) {
                                            bf = Math.round((163.205 * Math.log10((vongeo*0.39) + (vonghong*0.39) - (vongco*0.39)) - 97.684 * Math.log10(height*0.39) - 78.387) * 10) / 10; // for woman
                                            //console.log(Math.round(bf * 10) / 10 + " % Female");
                                            if(bf<10){
                                            	category = "Lượng mỡ rất nhỏ";
                                            }else if(10<=bf && bf<14){
                                            	category = "Lượng mỡ tối thiểu cần thiết";
                                            }else if(14<=bf && bf<21){
                                            	category = "Vận động viên";
                                            }else if(21<=bf && bf<25){
                                            	category = "Khỏe mạnh";
                                            }else if(25<=bf && bf<32){
                                            	category = "Bình thường";
                                            }else if(32<=bf){
                                            	category = "Mập";
                                            }
                                        }
                                    	if(bf < 0){
                                    		bf = 0;
                                    	}
                                    	document.getElementById("bf").innerHTML = bf;
                                    	document.getElementById("cat").innerHTML = category;
                                    	klmo = Math.round( ((bf * weight) / 100)*10 )/10;
                                    	klnac = weight - klmo;
                                    	document.getElementById("klmo").innerHTML = klmo;
                                    	document.getElementById("klnac").innerHTML = klnac;
									}
                                </script>
                            </div>
                        </div>
                       
                        
                        
                        
                        <div style="margin-top: 61px;" class="col-md-4">
<!--                 <div style="width: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;"> -->
    
    				<h1>BODY FAT</h1>
                	<div id="bf" style="text-align: center;
									    font-size: 5rem;
									    font-weight: 900;
									    border: 2px solid #424242;
									    padding: 15px;">
                		0	
                	</div>
                	<!-- </div> -->
                	
					<table class="table">
					  
					  <tr>
					    <td >TÌNH TRẠNG</td>
					    <td style="font-weight: bold;" id="cat"></td>
					  </tr>
					  <tr>
					    <td>KHỐI LƯỢNG MỠ</td>
					    <td style="font-weight: bold;" id="klmo"></td>
					  </tr>
					  <tr>
					    <td>KHỐI LƯỢNG NẠC</td>
					    <td style="font-weight: bold;" id="klnac"></td>
					  </tr>
					</table>

                </div>
                 <div class="col-md-4" style="margin-top: 61px;">
                        	<%-- <img alt="" width="100%" src="${pageContext.request.contextPath }/templates/bfm-lg.png"> --%>
                        	<h2 style="color:red;font-weight: bold;font-family: utm-avo;">TỶ LỆ MỠ CƠ THỂ LÀ GÌ ?</h2>
                        	<p style="font-size:17px;font-family: utm-avo;color: #464040 ">Bên cạnh mô, xương, mô tạng, nước,... cơ thể còn chứa tỉ lệ % chất béo nhất định. Nếu bạn nặng 100kg, bạn có
                        	10% chất béo, thì mỡ trong cơ thể của bạn là 10kg</p>
                        	<p style="font-family: utm-avo;font-size:17px;color: #464040 ">Nếu bạn tăng hoặc giảm chất béo, tỉ lệ % mỡ của cở thể sẽ đi lên hoặc đi xuống tương ứng. Bạn nên tăng
                        	cân mà mà không tăng chất béo, giảm cân mà không mất chất béo, như vậy mới có lợi cho sức khỏe</p>
                        	<p style="font-weight: bold;font-family: utm-avo;font-size:17px;color: #000000d9">Để tính tỉ lệ phần trăm mỡ cơ thể, bạn có thể sử dụng phương pháp tính được Hải Quân Mỹ áp dụng.</p>
                        </div>
     	</div>
			<br/>
			<div class="row">
				<div class="col-md-6">
					<img alt="" width="100%" src="${pageContext.request.contextPath }/templates/ty-le-mp-o-nam-gioi.jpg">
				</div>
				
				<div class="col-md-6">
					<img alt="" width="100%" src="${pageContext.request.contextPath }/templates/ty-le-mp-o-nu-gioi-2.jpg">
				</div>
			</div>
			<div class="row">
			<div class="col-md-4">
				<h4 class="widget-title border-left mb-50">TÍNH LƯỢNG CALO CẦN THIẾT </h4>
				<form action="javascript:void(0)">
                                    <div class="login-account p-30 box-shadow">
                                    <div >
                                    	
                                    	<input checked="checked" type="radio" name="gender" value="1"><span class="a" style="position: absolute;">Nam</span>
                                    	<input style="padding-left: 26px;margin-left: 232px;" type="radio" name="gender" value="0"><span class="a" style="position: absolute;">Nữ</span>
                                    </div>
                                    	<input type="number" id="tuoi" name="tuoi" placeholder="Tuổi [năm]" min="0">
                                        <input type="number" name="chieucao" id="chieucao" placeholder="Chiều cao [cm]" min="0">
                                        <input type="number" name="cannang" id="cannang" placeholder="Cân nặng [kg]" min="0">
                                        
                                        <h5>CƯỜNG ĐỘ VẬN ĐỘNG</h5>
                                        <button style="display: none;" class="btn mybutton active" type="button"></button>
                                        <input id="1" hidden="" type="radio" name="cuongdo" value="1.2"><button onclick="checkRadio(this,1)" style="width: 100%" class="btn mybutton" type="button">Ít vận động</button><br/><p style="margin-bottom: 5px"></p>
                                        <input id="2" hidden="" type="radio" name="cuongdo" value="1.375"><button onclick="checkRadio(this,2)" style="width: 100%" class="btn mybutton" type="button">Nhẹ: 1-3 buổi / 1 Tuần</button><br/><p style="margin-bottom: 5px"></p>
                                        <input id="3" hidden="" type="radio" name="cuongdo" value="1.55"><button onclick="checkRadio(this,3)" style="width: 100%" class="btn mybutton" type="button">Trung bình: 3-5 buổi / 1 tuần</button><br/><p style="margin-bottom: 5px"></p>
                                        <input id="4" hidden="" type="radio" name="cuongdo" value="1.725"><button onclick="checkRadio(this,4)" style="width: 100%" class="btn mybutton" type="button">Cao: 6-7  buổi/ 1 tuần</button><br/><p style="margin-bottom: 5px"></p>
                                        <input id="5" hidden="" type="radio" name="cuongdo" value="1.9"><button onclick="checkRadio(this,5)" style="width: 100%" class="btn mybutton" type="button">Cực cao: 7 buổi/ 1 tuần với cường độ cao</button><br/><p style="margin-bottom: 5px"></p>
                                       
                                        <button class="submit-btn-1 btn-hover-1" onclick="brmandTdee()" type="submit">Tính toán</button>
                                    </div>
                                </form>
                                
                                <script type="text/javascript">
                                function checkRadio(a,id) {
                            		document.getElementById(id).checked = true;
                            		//xóa toàn bộ active
                            		var list = document.getElementsByClassName("btn mybutton active")
                            		for (i = 0; i < list.length; i++) {
                            			list[i].className = list[i].className.replace(/\active\b/g, "");
                            			}
                            		//add actice cho button
                            		a.classList.add("active");
								}
                                
                                function brmandTdee() {
                                	var cuongdo = document.querySelector('input[name="cuongdo"]:checked').value;
                                	var chieucao = document.getElementById("chieucao").value;
                                	var cannang = document.getElementById("cannang").value;
                                	var tuoi = document.getElementById("tuoi").value;
                                	var sex = document.querySelector('input[name="gender"]:checked').value;
                                	var a1,a2,a3,a4;
                                	var brm,tdee;
                                	if(sex == 1){
                                		a1 = 13.4,a2 = 4.8,a3 = 5.67,a4 = 88.4	
                                	}else if(sex == 0){
                                		a1 = 9.24,a2 = 3.1,a3 = 4.3,a4 = 447.6
                                	}                                	
                                	brm = Math.round((a1*cannang + a2*chieucao - a3*tuoi + a4));
                                	tdee = Math.round(brm * cuongdo);
                                	document.getElementById("brm").innerHTML = brm;
                                	document.getElementById("tdee").innerHTML = tdee;	
								}
                                </script>
                </div>
                <div class="col-md-4">
                
                	<img alt="" width="100%" src="${pageContext.request.contextPath }/templates/brm.png">
                </div>
                <div class="col-md-4">
                
                	<img alt="" width="100%" src="${pageContext.request.contextPath }/templates/tdee.png">
                </div>
                <div class="col-md-4">
<!--                 <div style="width: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;"> -->
    
    <h1>BRM</h1>
                	<div id="brm" style="text-align: center;
									    font-size: 5rem;
									    font-weight: 900;
									    border: 2px solid #424242;
									    padding: 15px;">
                		0	
                	</div>
                	<!-- </div> -->
                	
						
                </div>
                <div class="col-md-4">
                <h1 style="">TEDD</h1>
						
					<div id="tdee" style="text-align: center;
    font-size: 5rem;
    font-weight: 900;
    border: 2px solid #424242;
    padding: 15px;">
                		0	
                	</div>
                </div>
			</div>
			<div style="margin-top: 25px"></div>
			<div class="row">
				
				<h4 class="widget-title border-left mb-50">DINH DƯỠNG CÓ TRONG THỰC PHẨM</h4>
				
					<h1 style="text-align: center;">BẤM ĐỂ XEM BẢNG DINH DƯỠNG CÓ TRONG THỰC PHẨM</h1>
					<div style="margin-left: 40%;font-size: 20px;">
					<a href="${pageContext.request.contextPath }/foodnutrient" class="btn btn-info">XEM BẢNG DINH DƯỠNG</a>
				</div>
			</div>
		</div>
	</div>
</section>