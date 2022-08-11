<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
   <title>ID/PW 찾기</title>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <!--===============================================================================================-->
   <link rel="icon" type="image/png" href="${ pageContext.request.contextPath }/resources/images/icons/favicon.ico"/>
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/fonts/iconic/css/material-design-iconic-font.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/animate/animate.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/css-hamburgers/hamburgers.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/animsition/css/animsition.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/select2/select2.min.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.css">
   <!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/util.css">
   <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/main.css">
   <!--===============================================================================================-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<!--===============================================================================================-->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/tabmenu.css" >
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/header.css" >
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main_index.css" >   
<link rel="stylesheet" href="resources/css/join.css">
      
		<style>
			.mail_btn:hover {
				cursor: pointer;
			}
			.dpn {display: none !important;}
			#email_ck_sp {display: inline-block; color: red; font-size: 12px; padding-left: 1px; padding-top: 8px;}
		</style>
      
      
</head>
<body>
   <header>
      <div class="top">
         <a href="/project"><img src="https://blog.kakaocdn.net/dn/caiodL/btrEE1rTCxP/7gyg5XtCQxaBKVIn8TU3lk/img.jpg" alt=""></a>
         <span class="small_menu">
            <a href="/project/sign.do">Sign up</a>
            <a href="/project/login.do">Login</a>
         </span>
      </div>

      <nav class="menu">
         <div class="menu_bar">
         </div>

         <!-- <div class="search">
            <input type="text" class="sch_bar" placeholder="검색어를 입력하세요" value="">
            <input type="button" class="sch_btn" value="검색" onclick="#">
         </div> -->
      </nav>
   </header>

   <div class="limiter">
      <div class="container-login100" style="background-color:#e1e1e1;">
         <div class="tab">
            <ul class="tabnav">
               <li><a href="#tab01">아이디 찾기</a></li>
               <li><a href="#tab02">비밀번호 찾기</a></li>
            </ul>
            <div class="tabcontent">
               <div id="tab01">
                  <div class="wrap-input100 validate-input" data-validate = "Enter username">
                     <input class="input100" type="text" id="tel" name="user_tel" placeholder="Phone Number">
                     <span class="focus-input100" data-placeholder="&#xf405;"></span>
                  </div>

                  <div class="wrap-input100 validate-input" data-validate="Enter password">
                     <span id="email_ck_sp" class="dpn">등록되지 않은 이메일입니다.</span>
                     <input class="input100" type="text" id = "email" name="user_email" placeholder="Email" oninput = "checkEmail()" autocomplete="off">
                     <span class="focus-input100" data-placeholder="&#xf159;"></span>
                  </div>

                  <div>
                     <input id="email_auth_btn" class="mail_btn" type="button" value="인증" disabled>
                  </div>
                  <div class="wrap-input100 validate-input" data-validate="Enter password">
                     <input id="email_auth_key" class="input100" type="text" name="pass" placeholder="인증번호" autocomplete="off">
                     <span class="focus-input100"></span>
                  </div>

                  <div class="find">
                  <button id="join" class="login100-form-btn">찾기   </button>
                  </div>

               </div>
               <div id="tab02">

                  <div class="wrap-input100 validate-input" data-validate="Enter password">
                     <input class="input100" type="text" name="user_id" id="user_id" placeholder="ID" autocomplete="off">
                     <span class="focus-input100" data-placeholder="&#xf207;"></span>
                  </div>

                  <div class="find">
                  <button id="pwd_ck_btn" class="login100-form-btn">찾기   </button>
                  </div>
               </div>
            </div>
         </div><!--tab-->

         </div>

         <div class="footer">
            <footer class="txt">
               <ul class="info">
                  <li>프로젝트 조원 : 사조</li>
                  <li>조원 이름 : 이동근 송승호 김민 김인호 정다경</li>
                  <li>E-mail: babucpu3@gmail.com</li>
               </ul>
               <div class="footer-logo">
                  <img src="https://blog.kakaocdn.net/dn/x9wZZ/btrEyuoLrQz/ZzQS6fe14wOJ81lMJ3kdI1/img.jpg" alt="">
               </div>
               <ul class="cs">
                  <li class="cs-title">고객센터</li>
                  <li class="cs-callno">1544-58826</li>
               </ul>
            </footer>

      </div>
   </div>

   <div id="dropDownSelect1"></div>
<script>


$(function() {
	 
 	let email_auth_cd = '';
 	let email_ck_bl = false;
	 
	 	//인증하기버튼
		$('#join').click(function(){
			
			let user_tel = $('#tel').val();
			let email = $('#email').val();
			
			if(!email_ck_bl){
				alert("이메일 인증이 필요합니다.");
				return;
			}
			
			if($('#email_auth_key').val() != email_auth_cd){
				alert("인증번호가 일치하지 않습니다.");
				return false;
			}
			
			$.ajax({
				type : "POST",
				url : "/project/telCheck.do",
				data : {user_tel : user_tel},
				success: function(data){
					console.log(data);
					if(data == email ){
				    	 $.ajax({
								type : "POST",
								url : "/project/email_ck.do",
								data : {email : email},
								success: function(data){
									alert("등록된 메일로 회원정보를 보내드렸습니다.");
									location.href="/project/login.do";
								},
								error: function(data){
									alert("메일 발송에 실패했습니다.");
								}
							});
						
					}else{
						alert("등록된 전화번호가 일치하지 않습니다.");
					}
					
				},
				error: function(data){
					alert('error : '+data);
				}
			});
		});
 	

 	
	//이메일 인증
	$("#email_auth_btn").click(function(){	     	 
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

	
	
	$("#email").focusout(function() {
		$('#email_ck_sp').addClass("dpn");
	});
	
	
 });
 
 
	//이메일 실시간 중복체크
	function checkEmail() {
		let user_email = $('#email').val();
		$.ajax({
			type : "POST",
			url : "/project/emailCheck.do",
			data : {user_email : user_email},
			success: function(data){
				console.log(data);
				if(data != 0){//중복되지 않는 이메일일때 동작(등록된 이메일이 아니라는 뜻)
					$('#email_ck_sp').addClass("dpn");
					$("#email_auth_btn").attr("disabled", false);
				}else{
					$('#email_ck_sp').removeClass("dpn");
					$("#email_auth_btn").attr("disabled", true);
				}
			},
			error: function(data){
				alert('error : '+data);
			}
		}); 
	}
 
	
	$("#pwd_ck_btn").click(function() {
		
		let user_id = $("#user_id").val();
		if(user_id == ''){
			alert("ID를 입력해주세요.");
			return false;
		}
		
		$.ajax({
			type : "POST",
			url : "/project/checking2.do",
			data : {user_id:user_id},
			success : function(data) {
				if(data == "success"){
					alert("등록된 메일로 회원정보를 보내드렸습니다.");
					location.href = "/project/login.do";
				}else{
					alert("등록되어있는 계정이 없습니다.");
				}
			},
			error : function(data) {
				alert("error : " + data);
			}
		});
		
	});
	
</script>



<!--===============================================================================================-->
   <script src="${ pageContext.request.contextPath }/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
   <script src="${ pageContext.request.contextPath }/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
   <script src="${ pageContext.request.contextPath }/resources/vendor/bootstrap/js/popper.js"></script>
   <script src="${ pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
   <script src="${ pageContext.request.contextPath }/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
   <script src="${ pageContext.request.contextPath }/resources/vendor/daterangepicker/moment.min.js"></script>
   <script src="${ pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
   <script src="${ pageContext.request.contextPath }/resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
   <script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>
   <script src="${ pageContext.request.contextPath }/resources/js/tabmenu.js"></script>
</html>