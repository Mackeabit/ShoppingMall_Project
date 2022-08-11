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
	href="${ pageContext.request.contextPath }/resources/css/review/review_product_list.css?after">

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
					<h2>리뷰목록</h2>

					<div id="review_box">
						<h3>해당 상품 리뷰목록</h3>
					
						<button type="button" class="btn1" id="review_list_btn"
							onclick="location.href='admin_review_list2.do?standard=${standard}'">
							전체 리뷰 목록으로</button>
					
						<table>
							<tr>
								<th>상품명</th>
								<th>상품사이즈</th>
								<th>상품사진</th>
								<th>평균평점</th>
								<th>리뷰수</th>
								<th>비고</th>
							</tr>
							<c:forEach var="vo" items="${list }">
								<tr>
									<td>${vo.pd_nm}</td>
									<td>${vo.pd_size}</td>
									<td><img class="active" src="/loc_img/${ vo.pd_img }"></td>
									<td>${vo.rv_score_avg}</td>
									<td>${vo.rv_count }</td>
									<td><button type="button" class="btn1" id="review_view_btn"
										onclick="location.href='admin_review_product_list2.do?pd_idx=${vo.pd_idx}&standard=${standard}'">
										상세보기</button>
									</td>
								</tr>
							</c:forEach>
						</table>
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