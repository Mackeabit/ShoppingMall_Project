<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/main/login_form.css">
<script src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script>
	function send(f) {
		
		
		var id = f.admin_id.value.trim();
		var pwd = f.admin_pwd.value.trim();
		
		if (id == '') {
			alert("아이디를 입력하세요");
			return;
		}
		if (pwd == '') {
			alert("비밀번호를 입력하세요");
			return;
		}
		var url = "admin_login.do";
		var param = "admin_id=" + encodeURIComponent(id) + "&admin_pwd=" + encodeURIComponent(pwd);
		sendRequest(url, param, myCheck, "post");
	}
	
	//콜백메서드
	function myCheck() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = xhr.responseText;
			if (data == "no_id") {
				alert("아이디가 존재하지 않습니다");
				return;
			} else if (data == "no_pwd") {
				alert("잘못된 비밀번호입니다");
				return;
			} else {
				alert("로그인 성공");
				location.href="admin.do";
			}
		}
	}
	
	function enterkey(f) {

		if(window.event.keyCode == 13){
			send(f);
		}
	}
	
</script>
</head>

<body>
	<div id="login_box">
		<h1>관리자 로그인</h1>
		<form>
			<div class="int_area">
				<input type="text" name="id" id="admin_id" autocomplete="off"
					placeholder="아이디" onkeyup="enterkey(this.form);" required>
			</div>
			<div class="int_area">
				<input type="password" name="pwd" id="admin_pwd" autocomplete="off"
					placeholder="비밀번호" onkeyup="enterkey(this.form);" required>
			</div>
			<div class="btn_area">
				<button id="btn" type="button" onclick="send(this.form);">로그인</button>
			</div>
		</form>
	</div>
</body>
</html>