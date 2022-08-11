<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>계정복구</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>





<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->


</head>
<body>

	<div class="limiter">
		<div class="container-login100" style="background-color: #212121;">
			<div class="wrap-login100">
					<span class="login100-form-logo">
						<a href="/project">
						<img src="https://blog.kakaocdn.net/dn/MCnb9/btrEYgPF9Tt/Co0OP2W2TopKNGhuFsVtN1/img.jpg" alt="">
						</a>
					</span>

				<form id="form_ck" class="login100-form validate-form">
					<span class="login100-form-title p-b-34 p-t-27">
					</span>

						<input class="input100" type="hidden" name="user_idx" id="user_id" placeholder="ID or Email" autocomplete="off" value="${vo.user_idx}">
						<input type="hidden" id="email" value="${vo.user_email}">
					<div class="wrap-input100 validate-input" data-validate="Enter Email">
						<input class="input100" type="password" id="user_pwd" placeholder="인증번호 입력">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<div class="container-login100-form-btn">
						<button id="login_btn" class="login100-form-btn" type="button">
							인증
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>
	
	<script>
 	
 	let email_auth_cd = '';
	
	window.onload=(function() {
		var email = $('#email').val();
		
   	 $.ajax({
			type : "POST",
			url : "/project/email_ck.do",
			data : {email : email},
			success: function(data){
				alert("등록되어있는 메일로 인증번호가 발송되었습니다.");
				email_auth_cd = data;
			},
			error: function(data){
				alert("메일 발송에 실패했습니다.");
			}
		}); 
		
   	 
	});

		 
	function enterkey() {
		
		alert(window.event.keyCode);
		
		if(window.event.keyCode == 13){
			
			if($('#user_pwd').val() != email_auth_cd){
				alert("인증번호가 틀렸습니다.");
				return false;
			}
			fn_check();
		}
	}
	

	
	
	$("#login_btn").click(function() {
		
		if($('#user_pwd').val() != email_auth_cd){
			alert("인증번호가 틀렸습니다.");
			return false;
		}
		fn_check();
	})
		

	function fn_check() {
		
		let f = $('#form_ck');
	    let formData = f.serialize();
	    
		$.ajax({
			type : "POST",
			url : "/project/user_backup.do",
			data : formData,
			success: function(data){
				if(data == "Y"){
					alert("계정이 복구 되었습니다. 로그인을 진행해주세요.");
					location.href="/project/login.do";
				}else{
					alert("계정복구에 실패하였습니다.");
				}
			},
			error: function(data){
				console.log(data);
			}
		});
		
	}

	</script>

<!--===============================================================================================-->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="resources/js/main.js"></script>

</body>
</html>