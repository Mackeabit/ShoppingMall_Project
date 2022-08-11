<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>회원탈퇴</title>
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
				<form id="form_ck" class="login100-form validate-form">
					<span class="login100-form-logo">
						<a href="/project">
						<img src="https://blog.kakaocdn.net/dn/MCnb9/btrEYgPF9Tt/Co0OP2W2TopKNGhuFsVtN1/img.jpg" alt="">
						</a>
					</span>

					<span class="login100-form-title p-b-34 p-t-27">
					</span>

						<input class="input100" type="hidden" name="user_id" id="user_id" placeholder="ID or Email" autocomplete="off" onkeyup="enterkey();" value="${user.user_id}">

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="user_pwd" id="user_pwd" placeholder="Password" onkeyup="enterkey();">
						<span class="focus-input100" data-placeholder="&#xf191;"></span>
					</div>

					<!-- <div class="contact100-form-checkbox">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
						<label class="label-checkbox100" for="ckb1">
							Remember me
						</label>
					</div> -->

					<div class="container-login100-form-btn">
						<button id="login_btn" class="login100-form-btn" type="button">
							Sign out
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>
	
	<script>
 	
		 
	function enterkey() {

		if(window.event.keyCode == 13){
			
			if($('#user_pwd').val() == ''){
				alert("비밀번호를 입력해주세요.")
				return false;
			}
			fn_check();
		}
	}
	

	
	
	$("#login_btn").click(function() {
		
		if($('#user_pwd').val() == ''){
			alert("비밀번호를 입력해주세요.")
			return false;
		}
		fn_check();
	})
		

	function fn_check() {
		
		let f = $('#form_ck');
	    let formData = f.serialize();
	    
		$.ajax({
			type : "POST",
			url : "/project/user_del.do",
			data : formData,
			success: function(data){
				if(data == "no_pwd"){
					alert("비밀번호가 틀렸습니다.");	
				}else if(data == "del"){
					alert("자정 이후에 탈퇴가 진행됩니다.");	
					location.href="/project/main.do";
				}else if(data == "success"){
					alert("회원탈퇴 상태가 취소 되었습니다.");
					location.href="/project/main.do";
				}
			},
			error: function(data){
				alert("오류");
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