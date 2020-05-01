<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                             Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
							<!-- Optional JavaScript -->
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
				<!-- bootstap bundle js -->
					
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
				<!-- slimscroll js -->
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
				<!-- main js -->
				
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/parsley/parsley.js" charset="UTF-8" type="text/javascript"></script>
							    <script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/multi-select/js/jquery.multi-select.js"></script>
				<script src="${pageContext.request.contextPath}/templates/admin/assets/libs/js/main-js.js"></script>
				<!-- chart chartist js -->
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
				<!-- sparkline js -->
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
				<!-- morris js -->
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/charts/morris-bundle/raphael.min.js"></script>
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/charts/morris-bundle/morris.js"></script>
				<!-- chart c3 js -->
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/charts/c3charts/c3.min.js"></script>
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/charts/c3charts/C3chartjs.js"></script>
				<script src="${pageContext.request.contextPath}/templates/admin/assets/libs/js/dashboard-ecommerce.js"></script>

			    <script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/datatables/js/jquery.dataTables.min.js"></script>
			    
			    <script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
			    <script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/datatables/js/dataTables.buttons.min.js"></script>
			    
			    <script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
			    <script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/datatables/js/data-table.js"></script>
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/datatables/js/jszip.min.js"></script>
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/datatables/js/buttons.html5.min.js"></script>
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/datatables/js/buttons.print.min.js"></script>
				<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/datatables/js/buttons.colVis.min.js"></script>

			    
			    <script>
			    $('#form').parsley();
			    
			    
			    window.onload = function myFunction(){
			        var list = document.getElementsByClassName("money-change");
			        for (i = 0; i < list.length; i++) {
			               list[i].click();                                          
			         }
			     }

			     function changevnd(valuep){
			     	var n = valuep.innerHTML.split(".").join("");
			     	valuep.innerHTML = new Intl.NumberFormat().format(n);
			     } 
			    </script>
				
				 <script type="text/javascript">
            
            /* (function(window, document, $, undefined) {
                "use strict";
                $(function() {
                	 */
                	if ($('#c3chart_splinee').length) {
                        var chart = c3.generate({
                            bindto: "#c3chart_splinee",
                            data: {
                                columns: [
                                	b,
                                ],
                                //type: 'spline',
                                colors: {
                                	Tiền_Thu_VND: '#5969ff',

                                }
                            },
            				zoom: {
                                enabled: true
                            },
                            axis: {
                                y: {
                                	label: 'Đơn vị: VNĐ',
  	                               show: true,
  	                              tick: {
  	                                 format: d3.format(",")
  	                                 //format: function (d) { return "đ" + d; },d3.format("$,")
  	                             }


                                },
                                x: {
                                	label: 'Ngày',
                                    show: true,
                                }
                            }
                        });
                    }
                	
                	
                	
                	
                	
                	
                	if ($('#c3chart_splincs').length) {
                	 var chart = c3.generate({
                         bindto: "#c3chart_splincs",
                         data: {
                             columns: [
                             	["a",10,20,30]
                             ],
                             //type: 'spline',
                             colors: {
                                  data1: '#5969ff',

                             }
                         },
         				
                         axis: {
                             y: {
                                 show: true,
                             },
                             x: {
                                 show: true,
                             }
                         }
                     });
                	}

                	var nam = ${nam};
                	var nu = ${nu};
            			if ($('#c3chart_piee').length) {
                        var chart = c3.generate({
                            bindto: "#c3chart_piee",
                            data: {
                                columns: [
                                    ['Nam', nam],
                                    ['Nữ', nu]
                                ],
                                type: 'pie',

                                colors: {
                                	Nam: '#5969ff',
                                	Nữ: '#ff407b'


                                }
                            },
                            pie: {
                                label: {
                                    format: function(value, ratio, id) {
                                        return d3.format('')(value);
                                    }
                                }
                            }
                        });
                    }
            			
            			
            			
            			 if ($('#c3chart_zoommm').length) {
 	                   		var charttt = c3.generate({
 	                       bindto: "#c3chart_zoommm",
 	                       data: {
 	                           columns: [
 	                               c,
 	                           ],
 	                          types: {
 	 	                        
 	                        	 Tổng_Thu_VND: 'area',
 	 	                       
 	 	                    	},
 	                           colors: {
 	                        	  Tổng_Thu_VND: 'green'
 	                           },
 	 	                    	
 	                          //labels: true,
 	                       },
 	                      
 	                       //zoom: {
 	                        //   enabled: true
 	                       //},
 	                       axis: {
 	                           y: {
 	                        	  label: 'Đơn vị: VNĐ',
 	                               show: true,
 	                              tick: {
 	                                 format: d3.format(",")
 	                                 //format: function (d) { return "đ" + d; },d3.format("$,")
 	                             }
 	                           },
 	                           x: {
 	                        	  label: 'Tháng',
 	                               show: true,
 	                              /* tick: {
  	                                 //format: d3.format(",")
  	                                 format: function (d) { return "Thang " + d; }
  	                             } */
 	                           }
 	                       }
 	
 	                   });
 	               }
            			
            			
            	/* 	});

            })(window, document, window.jQuery); */
            document.getElementById("thunhapnam").style.display = "none";
			</script>
				
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->