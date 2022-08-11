<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${ !empty user }">
	<script>
		alert("비정상적인 접근입니다.");
		location.href="/project/login.do";
	</script>
</c:if>

<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<!-- 제이쿼리 -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<!-- css -->
		<link rel="stylesheet" href="resources/css/join.css">
		<!-- 카카오 주소 API -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<style>
			#join{
				background-color: #e9e9e9;
				border-radius: 20px;
				color: #212121;
			}
			#join:hover{
			background-color: #212121;
			color: #e9e9e9;
			transition:.5s;
			}
			
			#addr_auth_btn{
			border-radius: 20px;
			background-color: #e9e9e9;
			color: #212121;
			}
			#addr_auth_btn:hover{
			background-color: #212121;
			color: #e9e9e9;
			transition:.5s;
			}
			#email_auth_btn{
			background-color: #e9e9e9;
			color: #212121;
			}
			button:hover {
				cursor: pointer;
			}
			
			.jubun_auth {width: 100%; margin-top: 10px;}
			.jubun_auth input {display: inline-block; width: 265px; vertical-align: top; margin: 0;}
			
			.tel_auth {width: 100%; margin-top: 10px;}
			.tel_auth input {display: inline-block; width: 171px; vertical-align: top; margin: 0;}
			.top-logo a{
						  display:inline-block;
						  margin:10px auto;
						
						}
			.email_auth_btn { background-color:#e9e9e9;}
		</style>
		
		<script>
		
		/* KAKAO ADDRESS */
		window.onload = function(){
			
			$(".addr_auth").click(function() { //class = addr_auth 클릭시 동작
				new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		            	document.getElementById("postcode").value = data.zonecode;//우편번호
		            	document.getElementById("addr").value = data.address; // 주소 넣기
		                document.querySelector("input[name=user_addr2]").focus(); //상세입력 포커싱
		            }
		        }).open();
			})
	
		}
		
		/* 주민번호 확인 및 성별 자동구분 */
		$(function(){
			
		$('#jubun1').on('keyup', function(){
			if($(this).val().length == 6){
				$('#jubun2').trigger('focus');
			}
		});
		
		$('#jubun2').on('keyup', function(){
				let ch = $(this).val();
				if(ch==1 || ch ==3){
					$('#ju_ck').addClass("dpn");
					document.getElementById("user_gen").value = "남";
				}else if(ch==2 || ch ==4){
					$('#ju_ck').addClass("dpn");
					document.getElementById("user_gen").value = "여";
				}else{
					$('#ju_ck').removeClass("dpn");//입력한 주민번호가 이상할 때 동작
				}
			});
		});
		
		
		/*  */
		
		
		/**
		 *  회원가입 관련 처리
		 */
		 
		 function fn_join(){
			var f = $('#join_frm');
			var formData = f.serialize();
			
			
			$.ajax({
				type : "POST",
				url : "/project/join.do",
				data : formData,
				success: function(data){
					if(data == "Y"){
						alert("회원가입이 완료되었습니다.");	
						location.href="/project/login.do";
					}else{
						alert("회원가입에 실패하였습니다.");
					}
				},
				error: function(data){
					alert("회원가입 에러 발생!");
					console.log(data);
				}
			});
		 }
		 
		 $(function() {
		 	
		 	var email_auth_cd = '';
		 	let id_ck_bl = false;
		 	let pwd_ck_bl = false;
		 	let email_ck_bl = false;
		 	
			$('#join').click(function(){
				
				let user_gen = document.getElementById("user_gen").value;
				let user_height = document.getElementById("user_height").value;
				let user_weight = document.getElementById("user_weight").value;
				
				if(user_height == ''){
					document.getElementById("user_height").value = 0;
				}
				if(user_weight == ''){
					document.getElementById("user_weight").value = 0;
				}
				
				
				if($('#id').val() == ""){
					alert("아이디를 입력해주세요.");
					return false;
				}
				
				if(!id_ck_bl){
					alert("아이디를 확인해주세요.");
					return false;
				}
				
				if(!pwd_ck_bl){
					alert("비밀번호를 확인해주세요.");
					return false;
				}
				
 				if(!email_ck_bl){
					alert("이메일 인증이 필요합니다.");
					return false;
				}
				
				if(user_gen == '미입력'){
					alert("주민번호를 확인해주세요.");
					return false;
				}
				
 				if($('#email_auth_key').val() != email_auth_cd){
					alert("인증번호가 일치하지 않습니다.");
					return false;
				}
				
				fn_join();
			});
			
			//이메일 인증
			$(".email_auth_btn").click(function(){	     	 
		    	 var email = $('#email').val();
		    	 var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		    	 
		    	 if(email == ''){
		    	 	alert("이메일을 입력해주세요.");
		    	 	return false;
		    	 }
		    	 
		    	 if(!regExp.test(email)){
		    		 alert("이메일 형식을 확인해주세요.");
		    		 return false;
		    	 }
		    	 
		    	 $.ajax({
					type : "POST",
					url : "/project/emailAuth.do",
					data : {email : email},
					success: function(data){
						alert("인증번호가 발송되었습니다.");
						email_auth_cd = data;
						email_ck_bl = true;
					},
					error: function(data){
						alert("메일 발송에 실패했습니다.");
					}
				}); 
			});
			
			//ID 중복체크
			$('#user_id').focusout(function(){
			
				var user_id = $('#user_id').val();
			
				$.ajax({
					type : "POST",
					url : "/project/idCheck.do",
					data : {user_id : user_id},
					success: function(data){
						console.log(data);
						if(data == "Y"){//중복되는 아이디일때 동작
							$('#id_ck').removeClass("dpn");
							id_ck_bl = false;
						}else{
							$('#id_ck').addClass("dpn");
							id_ck_bl = true;
						}
					},
					error: function(data){
						alert('error : '+data);
					}
				}); 
			});
			
			//PWD / PWD2 확인
			$('#pwd_ck').focusout(function(){
				
				var pwd = $('#pwd').val();
				var pwd_ck = $('#pwd_ck').val();
				
				if(pwd == pwd_ck){
					$('#pwd_ck_sp').addClass("dpn");
					pwd_ck_bl = true;
				}else{
					$('#pwd_ck_sp').removeClass("dpn");//비밀번호 다를때 동작
					pwd_ck_bl = false;
				}
				
			});
			
		 });
		
 			//이메일 중복체크
			function checkEmail() {
			
				let user_email = $('#email').val();
				
				$.ajax({
					type : "POST",
					url : "/project/emailCheck.do",
					data : {user_email : user_email},
					success: function(data){
						console.log(data);
						if(data > 0){//중복되는 이메일일때 동작
							$('#email_ck_sp').removeClass("dpn");
							$("#email_auth_btn").attr("disabled", true);
							$("#email_auth_btn").css({"background-color":"gray","color":"white"});
						}else{
							$('#email_ck_sp').addClass("dpn");
							$("#email_auth_btn").attr("disabled", false);
							$("#email_auth_btn").css({"background-color":"#212121","transition":".5s","color":"#e9e9e9"});
						}
					},
					error: function(data){
						alert('error : '+data);
					}
				}); 
			}
 			
 			//핸드폰 번호 중복체크
			function checktel() {
			
				let user_tel = $('#tel1').val()+$('#tel2').val()+$('#tel3').val();
				
				$.ajax({
					type : "POST",
					url : "/project/telCheckBysign.do",
					data : {user_tel : user_tel},
					success: function(data){
						console.log(data);
						if(data > 0){//중복되는 전화번호일때 동작
							$('#tel_ck_sp').removeClass("dpn");
						}else{
							$('#tel_ck_sp').addClass("dpn");
						}
					},
					error: function(data){
						alert('error : '+data);
					}
				}); 
			}

		 
		 
		</script>
		
	</head>
<body>
    <div class="sign-up">
      <div class="top-logo">
        <a href="/project">
          <img src="https://blog.kakaocdn.net/dn/caiodL/btrEE1rTCxP/7gyg5XtCQxaBKVIn8TU3lk/img.jpg" alt="">
        </a>
      </div>
     </div>
<br>
<div id="container" class="container">
	<div class="content">
		<div class="join_wrap">
			<form id="join_frm">
				<div class="join_title">회원가입</div>
				<div class="join_box">
					<span style="color: red;" id="explain" class="explain">*필수사항</span>
						<input type="text" placeholder="아이디" name="user_id" id="user_id" class="user_id">
					<span id="id_ck" class="dpn">이미 사용중인 아이디입니다.</span>
					<input type="text" placeholder="이름" name="user_nm" id="name">
					<div class="jubun_auth">
						<input type="text" placeholder="주민번호 앞자리" class="jubun1" name="user_jubun" id="jubun1" maxlength="6"> - 
						<input type="password" maxlength="1" placeholder="주민번호 뒷자리 " id="jubun2">
						<span id="ju_ck" class="dpn">주민번호를 다시 확인해주세요.</span>
					</div>						
					<input type="hidden" name="user_gen" id="user_gen" value="미입력">
					<input type="password" placeholder="비밀번호" name="user_pwd" id="pwd">
					<input type="password" placeholder="비밀번호  확인" id="pwd_ck">				
					<span id="pwd_ck_sp" class="dpn">비밀번호를 확인해주세요.</span>
					<div class="addr_auth">
						<input type="text" placeholder="주소" name="user_addr" id="addr" class="addr">
						<button type="button" id="addr_auth_btn" class="addr_auth_btn">주소검색</button>
					</div>
						<input type="text" placeholder="상세주소" name="user_addr2" id="addr2" class="addr2">
						<input type="hidden" id="postcode" name="user_postcode">
					<div class="tel_auth">
						<input type="text" placeholder="010" class="tel1" name="tel1" id="tel1" maxlength="3" oninput = "checktel()"> - 
						<input type="text" placeholder="1234" class="tel1" name="tel2" id="tel2" maxlength="4" oninput = "checktel()"> - 
						<input type="text" placeholder="5678" class="tel1" name="tel3" id="tel3" maxlength="4" oninput = "checktel()">
						<span id="tel_ck_sp" class="dpn">이미 등록된 전화번호입니다.</span>
					</div>						
					<div class="email_auth">
						<input type="text" placeholder="이메일" name="user_email" id="email" class="email" oninput = "checkEmail()" autocomplete="off">
						<button type="button" id="email_auth_btn" class="email_auth_btn" disabled>인증번호 받기</button>
					</div>
						<span id="email_ck_sp" class="dpn">이미 존재하는 이메일입니다.</span>
					<input type="text" placeholder="인증번호 입력" id="email_auth_key">
					<span style="color: black;" id="explain" class="explain">*선택사항</span>
					<input type="text" placeholder="키" id="user_height" name="user_height">
					<input type="text" placeholder="몸무게" id="user_weight" name="user_weight">
				</div>
				<button type="button" id="join" class="join_btn">가입하기</button>
			</form>
		</div>
	</div>
</div>

</body>
</html>