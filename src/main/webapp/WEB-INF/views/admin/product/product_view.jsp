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
	href="${ pageContext.request.contextPath }/resources/css/product/product_view.css?after">

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

	function changeStatus(f) {
		f.action = "admin_status_modify.do";
		f.method = "post";
		f.submit();
	}

	function changeCost(f) {
		const num = /^[0-9]+$/;
		var pd_cost = f.pd_cost.value.trim();
		if (!num.test(pd_cost)) {
			alert("원가는 숫자로만 입력하세요");
			return;
		}
		
		f.action = "admin_cost_modify.do";
		f.method = "post";
		f.submit();
	}

	function changePrice(f) {
		const num = /^[0-9]+$/;
		var pd_price = f.pd_price.value.trim();
		if (!num.test(pd_price)) {
			alert("판매가격은 숫자로만 입력하세요");
			return;
		}
		
		f.action = "admin_price_modify.do";
		f.method = "post";
		f.submit();
	}

	function changeCnt(f) {
		const num = /^[0-9]+$/;
		var pd_cnt = f.pd_cnt.value.trim();
		var pd_cnt2 = f.pd_cnt2.value.trim();
		if (!num.test(pd_cnt)) {
			alert("재고수량은 숫자로만 입력하세요");
			return;
		}
		
		f.action = "admin_cnt_modify.do";
		f.method = "post";
		if (pd_cnt2 == 0) {
			alert("품절 상태의 상품을 재입고할 경우 판매상태가 일반상품으로 등록됩니다");
		}
		f.submit();
	}

	function changeNm(f) {
		f.action = "admin_nm_modify.do";
		f.method = "post";
		f.submit();
	}

	function changeEx(f) {
		f.action = "admin_ex_modify.do";
		f.method = "post";
		f.submit();
	}

	function modify(f) {
		f.action = "admin_image_modify_form.do";
		f.method = "post";
		f.submit();
	}
	function modify1(f) {
		f.action = "admin_image_modify_form1.do";
		f.method = "post";
		f.submit();
	}

	function modify2(f) {
		f.action = "admin_image_modify_form2.do";
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
					<h2>상품정보</h2>

					<div id="product_view">
						<div class="outputArea">
							<label for="pd_idx">상품번호</label> <input type="text" id="pd_idx"
								value="${vo.pd_idx}" disabled />
						</div>

						<div class="outputArea">
							<label for="category_cd">카테고리</label>
							<c:if test="${vo.category_cd eq 0}">
								<input type="text" id="category_cd" value="Cloths" disabled />
							</c:if>
							<c:if test="${vo.category_cd eq 10}">
								<input type="text" id="category_cd" value="Top" disabled />
							</c:if>
							<c:if test="${vo.category_cd eq 20}">
								<input type="text" id="category_cd" value="Bottom" disabled />
							</c:if>
							<c:if test="${vo.category_cd eq 30}">
								<input type="text" id="category_cd" value="Shoes" disabled />
							</c:if>
							<c:if test="${vo.category_cd eq 40}">
								<input type="text" id="category_cd" value="Acc" disabled />
							</c:if>
						</div>

						<form>
							<div class="outputArea">
								<label for="pd_nm">상품명</label> <input type="text" name="pd_nm"
									id="pd_nm" value="${vo.pd_nm}"> <input type="hidden"
									name="pd_nm2" value="${vo.pd_nm }"> <input
									type="hidden" name="pd_idx" value="${vo.pd_idx}">
								<button type="button" style="cursor: pointer"
									onclick="changeNm(this.form);">상품명수정</button>
							</div>
						</form>

						<form>
							<div class="outputArea">
								<label for="pd_img" class="img_label">대표이미지</label> <input
									type="hidden" name="pd_idx" value="${vo.pd_idx}"> <input
									type="hidden" name="pd_nm" id="pd_nm" value="${vo.pd_nm}">
								<img class="active" src="/loc_img/${ vo.pd_img}" width="200">
								<button class="img_btn" type="button" style="cursor: pointer"
									onclick="modify(this.form);">이미지수정</button>
							</div>
						</form>

						<form>
							<div class="outputArea">
								<label for="pd_img" class="img_label">상품이미지1</label> <input
									type="hidden" name="pd_idx" value="${vo.pd_idx}"> <input
									type="hidden" name="pd_nm" id="pd_nm" value="${vo.pd_nm}">
								<img class="active" src="/loc_img/${ vo.pd_img1}" width="200">
								<button class="img_btn" type="button" style="cursor: pointer"
									onclick="modify1(this.form);">이미지수정</button>
							</div>
						</form>

						<form>
							<div class="outputArea">
								<label for="pd_img" class="img_label">상품이미지2</label> <input
									type="hidden" name="pd_idx" value="${vo.pd_idx}"> <input
									type="hidden" name="pd_nm" id="pd_nm" value="${vo.pd_nm}">
								<img class="active" src="/loc_img/${ vo.pd_img2}" width="200">
								<button class="img_btn" type="button" style="cursor: pointer"
									onclick="modify2(this.form);">이미지수정</button>
							</div>
						</form>

						<form>
							<div class="outputArea">
								<label for="pd_ex" id="ex_label">상품설명</label>
								<textarea rows="5" cols="50" id="pd_ex" name="pd_ex"
									style="resize: none;">${vo.pd_ex}</textarea>
								<input type="hidden" name="pd_nm" id="pd_nm" value="${vo.pd_nm}">
								<input type="hidden" name="pd_idx" value="${vo.pd_idx}">
								<button type="button" id="ex_btn" style="cursor: pointer"
									onclick="changeEx(this.form);">상세정보수정</button>
							</div>
						</form>

						<div class="outputArea">
							<label for="pd_size">사이즈</label> <input type="text" id="pd_size"
								name="pd_size" value="${vo.pd_size}">
						</div>

						<form>
							<div class="outputArea">
								<label for="pd_price">판매가격</label> <input type="text"
									id="pd_price" name="pd_price" value="${vo.pd_price}">원
								<input type="hidden" name="pd_idx" value="${vo.pd_idx}">
								<input type="hidden" name="pd_nm" id="pd_nm" value="${vo.pd_nm}">
								<button type="button" style="cursor: pointer"
									onclick="changePrice(this.form);">가격수정</button>
							</div>
						</form>

						<form>
							<div class="outputArea">
								<input type = "hidden" name = "pd_cnt2" value = "${vo.pd_cnt}">
								<label for="pd_cnt">재고수량</label> <input type="text" id="pd_cnt"
									name="pd_cnt" value="${vo.pd_cnt}">개 <input
									type="hidden" name="pd_idx" value="${vo.pd_idx}">
								<button type="button" style="cursor: pointer"
									onclick="changeCnt(this.form);">재고수정</button>
							</div>
						</form>

						<form>
							<div class="outputArea">
								<label for="pd_cost">원가</label> <input type="text" id="pd_cost"
									name="pd_cost" value="${vo.pd_cost}">원 <input
									type="hidden" name="pd_idx" value="${vo.pd_idx}"> <input
									type="hidden" name="pd_nm" id="pd_nm" value="${vo.pd_nm}">
								<button type="button" style="cursor: pointer"
									onclick="changeCost(this.form);">원가수정</button>
							</div>
						</form>

						<form>
							<div class="outputArea">
								<label for="pd_status">판매상태</label>
								<c:if test="${vo.pd_status eq 5}">
									<select name="status">
										<option>일반상품</option>
										<option selected>이벤트상품</option>
										<option>MD추천상품</option>
										<option>품절</option>
										<option>판매중지</option>
									</select>
								</c:if>
								<c:if test="${vo.pd_status eq 6}">
									<select name="status">
										<option>일반상품</option>
										<option>이벤트상품</option>
										<option selected>MD추천상품</option>
										<option>품절</option>
										<option>판매중지</option>
									</select>
								</c:if>
								<c:if test="${vo.pd_status eq 0}">
									<select name="status">
										<option selected>일반상품</option>
										<option>이벤트상품</option>
										<option>MD추천상품</option>
										<option>품절</option>
										<option>판매중지</option>
									</select>
								</c:if>
								<c:if test="${vo.pd_status eq 1}">
									<select name="status">
										<option>일반상품</option>
										<option>이벤트상품</option>
										<option>MD추천상품</option>
										<option selected>품절</option>
										<option>판매중지</option>
									</select>
								</c:if>
								<c:if test="${vo.pd_status eq 2}">
									<select name="status">
										<option>일반상품</option>
										<option>이벤트상품</option>
										<option>MD추천상품</option>
										<option>품절</option>
										<option selected>판매중지</option>
									</select>
								</c:if>
								<input type="hidden" name="pd_idx" value="${vo.pd_idx}">
								<button style="cursor: pointer"
									onclick="changeStatus(this.form);">판매상태수정</button>
							</div>
						</form>

						<div class="outputArea" id="last_area">
							<button type="button" class="btn0"
								onclick="location.href='admin_product_list.do'">목록으로</button>
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