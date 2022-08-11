<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty adminVO }">
	<script>
		alert("로그인 후 이용해주세요");
		location.href = "admin_login_form.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/product/image_modify.css?after">

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

	function send(f) {
		f.action = "admin_image_modify.do";
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

				<button id="main" type="button" class="btn0"
					onclick="location.href='admin.do'">메인페이지</button>
				<button id="logout" type="button" class="btn0"
					onclick="location.href='admin_logout.do'">로그아웃</button>
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
					<h2>대표이미지 수정</h2>

					<div id="img_box">
						<form method="post" enctype="multipart/form-data">
							<h3>
								대표이미지 : <input type="file" name="photo">
							</h3>
							<input type="hidden" value="${pd_idx}" name="pd_idx"> <input
								type="hidden" value="${pd_nm}" name="pd_nm">

							<div id="btn_box">
								<button type="button" class="btn0" onclick="send(this.form);">이미지
									수정</button>
								<button type="button" class="btn0"
									onclick="location.href='admin_product_view.do?idx=${pd_idx}'">취소</button>
							</div>
						</form>
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