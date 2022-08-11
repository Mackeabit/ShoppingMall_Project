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
	href="${ pageContext.request.contextPath }/resources/css/product/product_register.css?after">

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
		var pd_img = f.pd_img.value;
		var pd_nm = f.pd_nm.value.trim();
		var pd_ex = f.pd_ex.value.trim();
		var pd_size = f.pd_size.value.trim();
		var pd_price = f.pd_price.value.trim();
		var pd_cnt = f.pd_cnt.value.trim();
		var pd_cost = f.pd_cost.value.trim();

		if (pd_img == '') {
			alert("상품이미지를 등록하세요");
			return;
		}
		if (pd_nm == '') {
			alert("상품명을 입력하세요");
			return;
		}
		if (pd_ex == '') {
			alert("상품설명을 입력하세요");
			return;
		}
		if (pd_size == '') {
			alert("사이즈를 입력하세요");
			return;
		}
		if (pd_price == '') {
			alert("판매가격을 입력하세요");
			return;
		}
		if (pd_cnt == '') {
			alert("재고수량을 입력하세요");
			return;
		}
		if (pd_cost == '') {
			alert("원가를 입력하세요");
			return;
		}

		const num = /^[0-9]+$/;

		if (!num.test(pd_price)) {
			alert("판매가격은 숫자로만 입력하세요");
			return;
		}
		if (!num.test(pd_cnt)) {
			alert("재고수량은 숫자로만 입력하세요");
			return;
		}
		if (!num.test(pd_cost)) {
			alert("원가는 숫자로만 입력하세요");
			return;
		}
		
		
		f.action = "admin_product_insert_form.do";
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
					<h2>상품등록</h2>

					<div id="product_box">
						<form method="post" enctype="multipart/form-data">
							<div class="inputArea">
								<label>카테고리</label> <select class="category1" name="category_cd">
									<option value="0">Cloths</option>
									<option value="10">Top</option>
									<option value="20">Bottom</option>
									<option value="30">Shoes</option>
									<option value="40">Acc</option>
								</select>
							</div>

							<div class="inputArea">
								<label for="pd_img">대표이미지</label> <input type="file"
									accept="image/*" required multiple id="pd_img" name="pd_img" />
							</div>

							<div class="inputArea">
								<label for="pd_img">상품이미지1</label> <input type="file"
									accept="image/*" required multiple id="pd_img1" name="pd_img1" />
							</div>

							<div class="inputArea">
								<label for="pd_img">상품이미지2</label> <input type="file"
									accept="image/*" required multiple id="pd_img2" name="pd_img2" />
							</div>

							<div class="inputArea">
								<label for="pd_nm">상품명</label> <input type="text" id="pd_nm"
									name="pd_nm" />
							</div>

							<div class="inputArea">
								<label id="ex_label" for="pd_ex">상품설명</label>
								<textarea rows="5" cols="50" id="pd_ex" name="pd_ex"
									style="resize: none;"></textarea>
							</div>

							<div class="inputArea">
								<label for="pd_size">사이즈</label> <input type="text" id="pd_size"
									name="pd_size" />
							</div>

							<div class="inputArea">
								<label for="pd_price">판매가격</label> <input type="text"
									id="pd_price" name="pd_price" />
							</div>

							<div class="inputArea">
								<label for="pd_cnt">재고수량</label> <input type="text" id="pd_cnt"
									name="pd_cnt" />
							</div>

							<div class="inputArea">
								<label for="pd_cost">원가</label> <input type="text" id="pd_cost"
									name="pd_cost" />
							</div>


							<div class="inputArea">
								<label for="pd_status">판매상태</label>
								<select name="status">
									<option>일반상품</option>
									<option>이벤트상품</option>
									<option>MD추천상품</option>
								</select>
							</div>

							<div class="inputArea">
								<button type="submit" id="register_Btn" class="btn0"
									onclick="send(this.form);">등록</button>
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