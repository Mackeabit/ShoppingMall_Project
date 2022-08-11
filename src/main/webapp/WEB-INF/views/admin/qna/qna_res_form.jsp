<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test = "${empty adminVO }">
	<script>
		alert("로그인 후 이용해주세요");
		location.href="admin_login_form.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/qna/qna_res_form.css?after">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	/* 왼쪽 카테고리 */
	jQuery(document).ready(function() {
		$('#category>li').mouseover(function() {
			$(this).find('.sub_category').stop().slideDown(400);
		}).mouseout(function() {
			$(this).find('.sub_category').stop().slideUp(300);
		});
	});
</script>
<script>
	function send(f) {
		var qna_res = f.qna_res.value;
		var qna_idx = ${vo.qna_idx};
		if (qna_res == '') {
			alert("답변을 입력하세요");
			return;
		}
		f.action = "admin_qna_res.do";
		f.method = "post";
		f.submit();
	}
	function send2(f) {
		f.action = "admin_qna_delete.do";
		f.method = "post";
		f.submit();
	}
</script>
</head>

<body>
	<div id='wrap'>
		<section>
			<header>
				<img id="logo"
					src="https://blog.kakaocdn.net/dn/caiodL/btrEE1rTCxP/7gyg5XtCQxaBKVIn8TU3lk/img.jpg">

				<button id="main" type="button" class="btn0" onclick="location.href='admin.do'">메인페이지</button>
				<button id="logout" type="button" class="btn0" onclick="location.href='admin_logout.do'">로그아웃</button>
			</header>

			<section id="container">
				<aside>
					<ul id="category">
						<li><a href="admin_user_list.do">회원관리</a></li>

						<li><a href="admin_sales_list.do">매출관리</a></li>

						<li><a href="#">상품관리</a>
							<ul class="sub_category">
								<li><a href="admin_product_register.do">상품등록</a></li>
								<li><a href="admin_product_list.do">상품조회</a></li>
							</ul></li>

						<li><a href="#">주문관리</a>
							<ul class="sub_category">
								<li><a href="admin_order_list.do">주문조회</a></li>
								<li><a href="admin_cancel_list.do">주문취소조회</a></li>
							</ul></li>

						<li><a href="#">문의관리</a>
							<ul class="sub_category">
								<li><a href="admin_qna_list.do">문의</a></li>
								<li><a href="admin_review_list.do">리뷰</a></li>
							</ul></li>
					</ul>
				</aside>

				<div id="container_box">
					<h2>문의답변</h2>

					<div id="qna_res_form_box">
						<table>
							<caption>구매한 상품정보</caption>
							<tr>
								<th width=15%>상품번호</th>
								<th width="45%">상품명</th>
								<th>상품사이즈</th>
								<th>상품이미지</th>
							</tr>
							<tr>
								<td>${vo.pd_idx}</td>
								<td>${vo.pd_nm}</td>
								<td>${vo.pd_size}</td>
								<td><img class="active" src="/loc_img/${vo.pd_img}"></td>
							</tr>
						</table>
						
						<form>
						<table>
							<caption>유저 문의</caption>
							<tr>
								<th>문의번호</th>
								<th>문의제목</th>
								<th>작성자 ID</th>
								<th>공개여부</th>
								<th>문의날짜</th>
							</tr>
							<tr>
								<td>${vo.qna_idx}</td>
								<td>${vo.qna_title}</td>
								<td>${vo.user_id}</td>
								<c:if test = "${vo.qna_secret eq 0 }">
									<td>공개</td>
								</c:if>
								<c:if test = "${vo.qna_secret ne 0 }">
									<td>비공개</td>
								</c:if>
								<td>${fn:split(vo.qna_date, ' ')[0]}</td>
							</tr>
							<tr>
								<th>문의내용</th>
								<td colspan="4" width=85%>${vo.qna_content}</td>
							</tr>
							<tr>
								<td colspan="5"><input type="hidden" value="${vo.qna_idx}"
									name="qna_idx">
									<button type="button" onclick="send2(this.form);">삭제하기</button></td>
							</tr>
						</table>
						</form>
						
						<form>
							<table>
								<caption>답변</caption>
								<tr>
									<th width=15%>답변내용</th>
									<td colspan="3"><textarea id="qna_res" name="qna_res" rows="5"
										cols="70" style="resize: none;"></textarea></td>
								</tr>
								<tr>
									<td colspan="5" style="background:none">
										<input type="hidden" name="qna_idx" value="${vo.qna_idx}">
										<button type="button" class="btn1" id="qna_res_btn" 
										onclick="send(this.form);">답변등록하기</button></td>
								</tr>
							</table>
						</form>
						
						<button type="button" class="btn1" id="qna_list_btn" 
							onclick="location.href='admin_qna_list.do'">문의목록보기</button>
					</div>

				</div>
			</section>

		</section>

		<footer>
			<div id="f_box">
				<ul id="f_inf">
					<li>©4조</li>
					<li>대표자: 정용훈</li>
					<li>연락처: 010-111-2222</li>
					<li>주소: 서울특별시 마포구 서강로 136 아이비타워 2,3층</li>
				</ul>
			</div>
		</footer>
	</div>
</body>
</html>