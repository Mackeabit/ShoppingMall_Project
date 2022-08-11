<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
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
						Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<input class="input100" type="text" name="user_id" id="user_id" placeholder="ID or Email" autocomplete="off" onkeyup="enterkey();">
						<span class="focus-input100" data-placeholder="&#xf207;"></span>
					</div>

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
							Login
						</button>
						<button id="sign_btn" class="login100-form-btn" type="button">
							sign up
						</button>
					</div>

					<div class="text-center p-t-90">
						<a class="txt1" href="/project/find_userInfo.do">
							ID / PW 찾기
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>
	
	<script>
 	
		 
	$("#sign_btn").click(function () {
		location.href="/project/sign.do";
	})
	
	function enterkey() {

		if(window.event.keyCode == 13){
			if($('#user_id').val() == ''){
				alert("아이디를 입력해주세요.")
				return false;
			}
			
			if($('#user_pwd').val() == ''){
				alert("비밀번호를 입력해주세요.")
				return false;
			}
			fn_check();
		}
	}
	

	
	
	$("#login_btn").click(function() {
		
		if($('#user_id').val() == ''){
			alert("아이디를 입력해주세요.")
			return false;
		}
		
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
			url : "/project/checking",
			data : formData,
			success: function(data){
				if(data == "no_id"){
					alert("존재하지 않는 아이디 입니다.");	
				}else if(data == "no_pwd"){
					alert("비밀번호가 틀렸습니다.");	
				}else if(data == "success"){
					location.href="/project/main.do";
				}else if(data == "no_access"){
					if(!confirm("탈퇴된 계정입니다. 복구하시겠습니까?")){
						return false;
					}
					location.href = "/project/backupInfo.do";
				}else{
					location.href="/project/restPage.do?user_idx="+data;
				}
			},
			error: function(data){
				alert("로그인 오류");
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