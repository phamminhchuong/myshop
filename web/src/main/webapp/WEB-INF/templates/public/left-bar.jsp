<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/templates/taglib.jsp" %>
    <div class="col-md-3 col-md-pull-9 col-xs-12">
                            <!-- widget-search -->
                            <aside style="padding-bottom: 60px;" class="widget-search mb-30">
							   <div class="f-left">
                                   <div style="border: 1px black solid;
									padding: 29px;
									border-radius: 50%;">
										<span class="chu">${userInfo.nameImage }</span>
								   </div>
                                </div>
                                <div class="f-left">
                                    <p>Tài khoản của</p>
									<h4>${userInfo.name }</h4>
                                </div>
                            </aside>
							<div class="clearfix"></div>
                            <!-- widget-categories -->
							<style>
								.tii{
									font-weight: 100;
								}
								.chu{
								font-size: 27px;
									/* width: 106%; */
									/* padding: 2px; */
									position: absolute;
									margin-right: -12px;
									padding-right: -11px;
									margin-top: -12px;
									margin-left: -19px;
								
								
								
								}
								.active{
								color: #ff7f00;
								}
							</style>
				
                            <aside class="widget widget-categories box-shadow mb-30">
                                <h6 class="tii mb-20"><a ${actInfo } href="${pageContext.request.contextPath}/customer/infor">THÔNG TIN TÀI KHOẢN</a></h6>
								<h6 class="tii mb-20"><a ${actOrder } href="${pageContext.request.contextPath}/customer/history">QUẢN LÍ ĐƠN HÀNG</a></h6>
								<h6 class="tii mb-20"><a ${actAdd } href="${pageContext.request.contextPath}/customer/address">SỔ ĐỊA CHỈ</a></h6>
								<h6 class="tii mb-20"><a ${actFavo } href="${pageContext.request.contextPath}/customer/favorite">SẢN PHẨM YÊU THÍCH</a></h6>
							
							
                                </aside>
                            <!-- widget-color -->
                        </div>
                    