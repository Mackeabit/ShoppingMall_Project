<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty adminVO }">
	<script>
		location.href = "admin_login_form.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="resources/css/main/main.css?after">

<script
	src="resources/js/httpRequest.js"></script>
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

	/* 버튼 */
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>
</head>

<body>

	<div id='wrap'>
		<section>
			<header>
				<img id="logo"
					src="https://blog.kakaocdn.net/dn/caiodL/btrEE1rTCxP/7gyg5XtCQxaBKVIn8TU3lk/img.jpg">

				<button id="main" class="btn0" onclick="location.href='admin.do'">메인페이지</button>
				<button id="logout" class="btn0"
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

					<div id="top_box">

						<div id="sales_box">
							<h2>매출 현황</h2>

							<ul>
								<c:forEach var="vo" items="${sales_list}" begin="0" end="2">
									<li class="graph"><span class="date">[
											${vo.od_date} ] : <fmt:formatNumber value="${vo.sales}"
												pattern="#,###" />원<br>
									</span> <span class="bar"
										style="width:calc(90%*(${vo.sales}/${sales_sum}))"></span></li>
								</c:forEach>
							</ul>

							<h3>
								총 매출:
								<fmt:formatNumber value="${sales_sum}" pattern="#,###" />
								원
							</h3>

							<button class="btn" onclick="location.href='admin_sales_list.do'">매출
								관리</button>
						</div>

						<div id="order_box">
							<h2>주문 현황</h2>
							<ul>
								<c:forEach var="vo" items="${order_num_list}" begin="0" end="2">
									<li><span class="od_date">[ ${vo.od_date} ] : 총
											${vo.total}건<br>
									</span> <span class="details"> 결제완료: ${vo.order_pay_complete}건
											/ 주문취소(결제취소): ${vo.order_cancel}건 / 주문완료(취소불가):
											${vo.order_complete}건 </span></li>
								</c:forEach>
							</ul>

							<h3>총 주문: ${order_sum}건</h3>

							<button class="btn" onclick="location.href='admin_order_list.do'">주문
								관리</button>
						</div>

					</div>

					<div id="bottom_box">
						<div id="user_box">
							<h2>유저 현황</h2>
							<ul>
								<li>
								<span class="gender">[남자: ${user_men}명]<br></span>
								<span class="bar" style="width:calc(90%*(${user_men}/${user_all})); min-width:1%;"><br></span>
								</li>
								<li>
								<span class="gender">[여자 : ${user_women}명]<br></span>
								<span class="bar" style="width:calc(90%*(${user_women}/${user_all})); min-width:1%;"><br></span>
								</li>
							</ul>
							
							<h3>총 유저: ${user_all}명</h3>
							
							<button type="button" class="btn" onclick="location.href='admin_user_list.do'">
								유저관리</button>
						</div>

						<div id="inquiry_box">
							<h2>문의 현황</h2>

							<div class="tabmenu">
								<ul>
									<li id="tab1" class="button"><input type="radio" checked
										name="tabmenu" id="tabmenu1" /> <label for="tabmenu1">전체문의</label>
										<div class="content">
											<ul>
												<c:forEach var="vo" items="${qna_list}" begin="0" end="2">
													<li>${vo.qna_title}<br>${vo.qna_date}</li>
												</c:forEach>
											</ul>
										</div></li>

									<li id="tab2" class="button"><input type="radio"
										name="tabmenu" id="tabmenu2" /> <label for="tabmenu2">답변문의</label>
										<div class="content">
											<ul>
												<c:forEach var="vo" items="${qna_res_list}" begin="0"
													end="2">
													<c:if test="${vo.qna_res ne null}">
														<li>${vo.qna_title}<br>${vo.qna_date}</li>
													</c:if>
												</c:forEach>
											</ul>
										</div></li>

									<li id="tab3" class="button"><input type="radio"
										name="tabmenu" id="tabmenu3" /> <label for="tabmenu3">미답변문의</label>
										<div class="content">
											<ul>
												<c:forEach var="vo" items="${qna_not_res_list}" begin="0"
													end="2">
													<c:if test="${vo.qna_res eq null}">
														<li>${vo.qna_title}<br>${vo.qna_date}</li>
													</c:if>
												</c:forEach>
											</ul>
										</div></li>
								</ul>
							</div>

							<button class="btn" onclick="location.href='admin_qna_list.do'">문의
								관리</button>
						</div>
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
