<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty adminVO }">
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
	href="${ pageContext.request.contextPath }/resources/css/product/product_list.css?after">

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
  	
  	
  	function send(){
  		/* select 선택값 가져오기 */
  	  	var search_menu = document.getElementById("search_menu");
  		var menu = search_menu.options[search_menu.selectedIndex].value.trim();
  		
  		var word = document.getElementById("search_word").value;
  		
  		if(word==''){
  			alert("검색어를 입력하세요");
  			return;
  		}
  		
  		location.href="admin_search_product.do?menu=" + menu +" &word=" + word;
  	}
  	
  	function view(idx){
  		location.href="admin_product_view.do?idx=" + idx;
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
					<h2>상품목록</h2>

					<div id="search_box">
						<select id="search_menu">
							<option value="pd_nm">상품명</option>
							<option value="category_cd">카테고리코드</option>
						</select> <input id="search_word" type="text" /> <img
							src="/loc_img/search.png" style="cursor: pointer"
							onclick="send();">
					</div>

					<div id="back_box">
						<button type="button" class="btn0" style="cursor: pointer"
							onclick="location.href='admin_product_list.do'">전체 목록으로</button>
					</div>

					<div id="product_list">
						<table>
							<tr>
								<th>상품번호</th>
								<th>카테고리</th>
								<th>상품명</th>
								<th>판매가격</th>
								<th>재고수량</th>
								<th>판매상태</th>
								<th>비고</th>
							</tr>

							<c:forEach var="vo" items="${list}">
								<tr>
									<td>${vo.pd_idx}</td>
									<td><c:if test="${vo.category_cd eq 0}">Cloths</c:if> <c:if
											test="${vo.category_cd eq 10}">Top</c:if> <c:if
											test="${vo.category_cd eq 20}">Bottom</c:if> <c:if
											test="${vo.category_cd eq 30}">Shoes</c:if> <c:if
											test="${vo.category_cd eq 40}">Acc</c:if></td>
									<td>${vo.pd_nm}</td>
									<td>${vo.pd_price}</td>
									<td>${vo.pd_cnt}</td>
									<td><c:if test="${vo.pd_status eq 0}">일반상품</c:if> <c:if
											test="${vo.pd_status eq 1}">품절</c:if> <c:if
											test="${vo.pd_status eq 2}">판매중지</c:if> <c:if
											test="${vo.pd_status eq 5}">이벤트상품</c:if> <c:if
											test="${vo.pd_status eq 6}">MD추천상품</c:if></td>
									<td>
										<button style="cursor: pointer" onclick="view(${vo.pd_idx});">상세보기</button>
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