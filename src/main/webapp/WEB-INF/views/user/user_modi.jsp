<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${ empty user }">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href="/project/login.do";
	</script>
</c:if>

<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>회원정보 수정</title>
		<!-- 제이쿼리 -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<!-- css -->
		<link rel="stylesheet" href="resources/css/join.css">
		<!-- 카카오 주소 API -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		 <!-- bootbox cdn -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.3/bootbox.js"></script>
		<link rel="stylesheet" href="resources/header.css">
		<style>
			
			#addr_auth_btn{
				background-color: gray;
				color: #fff;
			}
			#addr_auth_btn:hover{
			background-color: #212121;
			transition:.5s;
			}
			
			button:hover {
				cursor: pointer;
			}
			
			.dpn {display: none !important;}
			.jubun_auth {width: 100%; margin-top: 10px;}
			.jubun_auth input {display: inline-block; width: 265px; vertical-align: top; margin: 0;}
			
			.tel_auth {width: 100%; margin-top: 10px;}
			.tel_auth input {display: inline-block; width: 171px; vertical-align: top; margin: 0;}
			
			.join_box span {display: inline-block; color: red; font-size: 12px; padding-left: 1px; padding-top: 8px;}
			
			.w3-container, .w3-panel {
			    padding-bottom: 10px;
			}
			
		</style>

		<script>
		/* KAKAO ADDRESS */
		window.onload = function(){
			$(".addr_auth").click(function() { //class = addr_auth 클릭시 동작
				new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		                document.getElementById("addr").value = data.address; // 주소 넣기
		                document.querySelector("input[name=user_addr2]").focus(); //상세입력 포커싱
		            }
		        }).open();
			})
	
		}
		</script>


<title>마이페이지</title>
</head>
<body>

    <div class="sign-up">
      <div class="top-logo">
        <a href="/project">
          <img src="https://blog.kakaocdn.net/dn/caiodL/btrEE1rTCxP/7gyg5XtCQxaBKVIn8TU3lk/img.jpg" alt="">
        </a>
      </div>
     </div>

	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>회원정보 수정</h3>
			</div>
			<div>
				<form id="myForm" method="post">
				<div class="join_box">
					<p>
						<label>아이디</label> 
						<input class="w3-input" type="text" id="id" name="user_id" readonly value="${ user.user_id }"> 
						<span id="id_ck" class="dpn">수정이 불가한 항목입니다.</span>
					</p>
					<p>
						<label>이름</label> 
						<input class="w3-input" type="text" id="name" name="user_nm" readonly value="${ user.user_nm }"> 
						<span id="nm_ck" class="dpn">수정이 불가한 항목입니다.</span>
					</p>
					<p>
						<label>이메일</label> 
						<input class="w3-input" type="text" id="email" name="user_email" readonly value="${ user.user_email }"> 
						<span id="em_ck" class="dpn">수정이 불가한 항목입니다.</span>
					</p>
					<div class="addr_auth">
						<input type="text" placeholder="주소" name="user_addr" id="addr" class="addr" value="${fn:split(user.user_addr,',')[0]}">
						<button type="button" id="addr_auth_btn" class="addr_auth_btn">주소검색</button>
					</div>
						<input type="text" placeholder="상세주소" name="user_addr2" id="addr2" class="addr2" value="${fn:split(user.user_addr,',')[1]}">
					<input type="hidden" name="user_idx" value="${ user.user_idx }">
					<input type="hidden" id="user_pwd" name="user_pwd" value="${ user.user_pwd }">
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="new_pwd" name="new_pwd" type="password">
						<span id="pwd_ck_sp" class="dpn">비밀번호를 확인해주세요.</span>
					</p>
					<p>
						<label>Password Confirm</label>
						<input class="w3-input" type="password" id="pwd2">
					</p>
					
					<hr>
					<span style="color: black;" id="explain" class="explain">*선택사항</span>
					<p>
						<label>키</label>
						<input class="w3-input" type="text" id="user_height" name="user_height" value="${ user.user_height }">
					</p>
					<p>
						<label>몸무게</label>
						<input class="w3-input" type="text" id="user_weight" name="user_weight" value="${ user.user_weight }">
					</p>
					
					</div>
					<p class="w3-center">
						<button id="check_btn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 변경</button>
					</p>
				</form>
			</div>
		</div>
	</div>
	
<!-- footer -->
	<div class="footer">
		<footer class="txt">
			<ul class="info">
				<li>프로젝트 조원 : 사조</li>
				<li>조원 이름 : 이동근 송승호 김민 김인호 정다경</li>
				<li>E-mail: babucpu3@gmail.com</li>
			</ul>
			<span class="footer-logo"> <img
				src="https://blog.kakaocdn.net/dn/x9wZZ/btrEyuoLrQz/ZzQS6fe14wOJ81lMJ3kdI1/img.jpg"
				alt="">
				<ul class="cs">
					<li class="cs-title">고객센터</li>
					<li class="cs-callno">1544-58826</li>
				</ul>
			</span>
		</footer>
	</div>	
	
	
	
	
	
	<!-- script -->
	
	<script>
	$(function(){
		
		
		//수정불가 상태 표출
		$("#id").click(function() {
			$('#id_ck').removeClass("dpn");
		})
		
		$("#id").focusout(function() {
			$('#id_ck').addClass("dpn");
		})
		
		$("#name").click(function() {
			$('#nm_ck').removeClass("dpn");
		})
		
		$("#name").focusout(function() {
			$('#nm_ck').addClass("dpn");
		})
		
		$("#email").click(function() {
			$('#em_ck').removeClass("dpn");
		})
		
		$("#email").focusout(function() {
			$('#em_ck').addClass("dpn");
		})
		

		//PWD / PWD2 확인
		$('#pwd2').focusout(function(){
			
			let pwd = $('#new_pwd').val();
			let pwd_ck = $('#pwd2').val();
			
			if(pwd == pwd_ck){
				$('#pwd_ck_sp').addClass("dpn");
			}else{
				$('#pwd_ck_sp').removeClass("dpn");//비밀번호 다를때 동작
			}
			
		});
		
	})
 /* 	jQuery("#check_btn").on("click", function() {    
    bootbox.prompt({
        title: "Enter your password", 
        inputType: "password",
        callback: function(result) {
            showResult(result);
        }
    });
});
	
	function showResult(result) {
	    if (typeof result !== "undefined" && result !== null) {
	        alert(result);
	    }
	} */
	
	if($("#myForm").submit(function() {
		
		let f = $("#myForm");
		let formData = f.serialize();
		
		let newPwd = $("#new_pwd").val();
		let pwd = $("#user_pwd").val();
		
		let pwd_ck = prompt("기존 비밀번호를 입력하세요.","");
		
		
		if(pwd_ck == ''){
			return false;
		}
		
		if(pwd_ck !== pwd){
			alert("비밀번호가 틀렸습니다.");
			return false;
		}else{
			alert("확인되었습니다.");
			
			$.ajax({
				type : "POST",
				url : "/project/user_update.do",
				data : formData,
				success : function (data) {
					if(data == "Y"){
						alert("회원정보 수정이 완료되었습니다.");
						location.href= "/project/main.do";
					}else{
						alert("회원정보에 잘못 기입된 항목이 있습니다.");
						return false;
					}
				},
				error : function(data) {
					alert("회원 수정 에러 발생!");
					console.log(data);
				}
				
			});
			
		}
		
	}));
	
</script>
	
	
	
	
	
	
	
</body>
</html>