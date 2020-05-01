<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <footer id="footer" class="footer-area">
            <div class="footer-top">
            	                <!-- <div class="container-fluid">
                    <div class="plr-185">
                        <div class="footer-top-inner gray-bg">
                            <div class="row">
                                <div class="col-lg-4 col-md-5 col-sm-4">
                                    <div class="single-footer footer-about">
            
            
            				</div>
            				</div>
            				</div>
            				</div>
            				</div>
            				</div> -->
            </div>
            
            <div class="footer-bottom black-bg">
                <div class="container-fluid">
                    <div class="plr-185">
                        <div class="copyright">
                            <div class="row">
                                <div class="col-sm-6 col-xs-12">
                                    <div class="copyright-text">
                                        <p>&copy; <a href="#" target="_blank"></a> 2020. Bản quyền của shop workout - workout.com</p>
                                    </div>
                                </div>
                                <div class="col-sm-6 col-xs-12">
                                    <ul class="footer-payment text-right">
                                        <li>
                                            <a href="#"><img src="${pageContext.request.contextPath }/templates/public/img/payment/1.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="${pageContext.request.contextPath }/templates/public/img/payment/2.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="${pageContext.request.contextPath }/templates/public/img/payment/3.jpg" alt=""></a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="${pageContext.request.contextPath }/templates/public/img/payment/4.jpg" alt=""></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        
        <!-- END FOOTER AREA -->
 </div>
    <!-- Body main wrapper end -->


    <!-- Placed JS at the end of the document so the pages load faster -->

    <!-- jquery latest version -->


    <!-- Bootstrap framework js -->
    <script src="${pageContext.request.contextPath }/templates/public/js/bootstrap.min.js"></script>
    <!-- jquery.nivo.slider js -->
    <script src="${pageContext.request.contextPath }/templates/public/lib/js/jquery.nivo.slider.js"></script>
    <!-- All js plugins included in this file. -->
    <script src="${pageContext.request.contextPath }/templates/public/js/plugins.js"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="${pageContext.request.contextPath }/templates/public/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/templates/admin/assets/vendor/parsley/parsley.js" charset="UTF-8" type="text/javascript"></script>



<script type="text/javascript">
function onSuccess(googleUser) {
	var id =  googleUser.getBasicProfile().getId();
  var name =  googleUser.getBasicProfile().getName();
  var email = googleUser.getBasicProfile().getEmail();
  $.ajax({
		url: '${pageContext.request.contextPath}/login-google',
		type: 'POST',
		cache: false,
		data: {
				//Dữ liệu gửi đi
				id:id,
			name: name,
			email: email,
			},
		success: function(data){
			//alert("đăng nhập thành công !");
			//$('#kq2').html(data);
			signOut();
			location.reload(true);
		},
		error: function (jqXHR,error, errorThrown){
			signOut();
			if(jqXHR.status&&jqXHR.status==400){
				alertify.error("<i style='font-size:16px' class='fas fa-warning'></i> Email đã được đăng kí");
  				
         }else if(jqXHR.status&&jqXHR.status==444){
        	 document.getElementById("closelogin").click();
             //alert("Something went wrong");
        	 alertify.prompt("Vui lòng điền Số điện thoại để hoàn tất đăng nhập.", "",
        			  function(evt, value ){
        			    //alertify.success('Ok: ' + value);
        			    	
        			    
        			    
        				  $.ajax({
        						url: '${pageContext.request.contextPath}/xac-nhan-phone',
        						type: 'POST',
        						cache: false,
        						data: {
        								phone:value,//Dữ liệu gửi đi
        								id:id,
        								name: name,
        								email: email,
        							},
        						success: function(data){
        							//alert("đăng kí thành công !");
        							//$('#kq2').html(data);
        							location.reload(true);
        						},
        						error: function (jqXHR,error, errorThrown){
        							if(jqXHR.status&&jqXHR.status==400){
        								
        								//document.getElementByClass("ajs-body").innerHTML += "<p>"+jqXHR.responseText+"</p>";
        								alertify.error("<i style='font-size:16px' class='fas fa-warning'></i> "+jqXHR.responseText);
        			             }
        						}
        					});
        			  },
        			  function(){
        			    alertify.error('Hủy đăng nhập');
        			  }).setHeader('<em> THỐNG BÁO </em>')
        			  ;
         }else{
        	 alert("Something went wrong");
         }
			
		}
	});
	
}
function onFailure(error) {
  console.log(error);
}
function renderButton() {
  gapi.signin2.render('my-signin2', {
    'scope': 'profile email',
    'width': 240,
    'height': 50,
    'longtitle': true,
    'theme': 'dark',
    'onsuccess': onSuccess,
    'onfailure': onFailure
  });
}
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
    });
    auth2.disconnect();
}



window.fbAsyncInit = function() {
    // FB JavaScript SDK configuration and setup
    FB.init({
      appId      : '2825838157463355', // FB App ID
      cookie     : true,  // enable cookies to allow the server to access the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });
    
    // Check whether the user already logged in
    FB.getLoginStatus(function(response) {
        if (response.status === 'connected') {
            //display user data
            getFbUserData();
        }
    });
};

// Load the JavaScript SDK asynchronously
(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Facebook login with JavaScript SDK
function fbLogin() {
    FB.login(function (response) {
        if (response.authResponse) {
            // Get and display the user profile data
            getFbUserData();
        } else {
            alert('User cancelled login or did not fully authorize.');
        }
    }, {scope: 'email'});
}

// Fetch the user profile data from facebook
function getFbUserData(){
    FB.api('/me', {locale: 'en_US', fields: 'id,first_name,last_name,email,link,gender,locale,picture'},
    function (response) {
       
        console.log('<p><b>FB ID:</b> '+response.id+'</p><p><b>Name:</b> '+response.first_name+' '+response.last_name+'</p><p><b>Email:</b> '+response.email+'</p><p><b>Gender:</b> '+response.gender+'</p><p><b>Locale:</b> '+response.locale+'</p><p><b>Picture:</b> <img src="'+response.picture.data.url+'"/></p><p><b>FB Profile:</b> <a target="_blank" href="'+response.link+'">click to view profile</a></p>');
    });
}

// Logout from facebook
function fbLogout() {
    FB.logout(function() {
        
        alert('You have successfully logout from Facebook.');
    });
}
</script>


 <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>







				<script type="text/javascript">
                    $('#form2').parsley();
                 </script>
                 
    <script type="text/javascript">
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
	{
    	
	/* add validation for minimum age */
	window.Parsley.addValidator("minimumage", {
		validateString: function(value, requirements) {
			// get validation requirments
			var reqs = value.split("/"),
				day = reqs[0],
				month = reqs[1],
				year = reqs[2];

			// check if date is a valid
			var birthday = new Date(year + "-" + month + "-" + day);

			// Calculate birtday and check if age is greater than 18
			var today = new Date();

			var age = today.getFullYear() - birthday.getFullYear();
			var m = today.getMonth() - birthday.getMonth();
			if (m < 0 || (m === 0 && today.getDate() < birthday.getDate())) {
				age--;
			}

			return age >= requirements;
		}
	});
	
	window.Parsley.addValidator("maximumage", {
		validateString: function(value, requirements) {
			// get validation requirments
			var reqs = value.split("/"),
				day = reqs[0],
				month = reqs[1],
				year = reqs[2];

			// check if date is a valid
			var birthday = new Date(year + "-" + month + "-" + day);

			// Calculate birtday and check if age is greater than 18
			var today = new Date();

			var age = today.getFullYear() - birthday.getFullYear();
			var m = today.getMonth() - birthday.getMonth();
			if (m < 0 || (m === 0 && today.getDate() < birthday.getDate())) {
				age++;
			}

			return age <= requirements;
		}
	});
}

</script>
</body>


<!-- Mirrored from demo.hasthemes.com/subas-preview/subas/index-3.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 27 Jun 2019 07:20:54 GMT -->
</html>