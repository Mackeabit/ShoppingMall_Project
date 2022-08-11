<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/order/order_view.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
      <img id="logo" src="https://blog.kakaocdn.net/dn/caiodL/btrEE1rTCxP/7gyg5XtCQxaBKVIn8TU3lk/img.jpg">

      <button id="main" type="button" class="btn0" onclick="location.href='admin.do'">메인페이지</button>
      <button id="logout" type="button" class="btn0" onclick="location.href='admin_logout.do'">로그아웃</button>
    </header>
    
    <section id="container">
      <aside>
        <ul id="category">
          <li>
            <a href="admin_user_list.do">회원관리</a>
          </li>
          
          <li>
          	<a href="admin_sales_list.do">매출관리</a>
          </li>
          
          <li>
            <a href="#">상품관리</a>
            <ul class="sub_category">
              <li><a href="admin_product_register.do">상품등록</a></li>
              <li><a href="admin_product_list.do">상품조회</a></li>
            </ul>
          </li>
          <li>
            <a href="#">주문관리</a>
            <ul class="sub_category">
              <li><a href="admin_order_list.do">주문조회</a></li>
              <li><a href="admin_cancel_list.do">주문취소조회</a></li>
            </ul>
          </li>
          
          <li>
            <a href="#">문의관리</a>
            <ul class="sub_category">
              <li><a href="admin_qna_list.do">문의</a></li>
              <li><a href="admin_review_list.do">리뷰</a></li>
            </ul>
          </li>
          
        </ul>
      </aside>
      
      <div id="container_box">
      	<h2>주문정보</h2>
      	
      	<div id="member_view">
			<div class="outputArea">
				<label for="od_idx">주문번호</label>
				<input type="text" id="od_idx" value="${vo.od_idx}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_idx">회원번호</label>
				<input type="text" id="user_idx" value="${vo.user_idx}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="pd_idx">상품번호</label>
				<input type="text" id="pd_idx" value="${vo.pd_idx}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="od_date">주문일자</label>
				<input type="text" id="od_date" value="${fn:split(vo.od_date,' ')[0]}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="od_destination">배송지</label>
				<input type="text" id="od_destination" value="${vo.od_destination}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="od_name">수취인명</label>
				<input type="text" id="od_name" value="${vo.od_name}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="od_tel">수취인 전화번호</label>
				<input type="text" id="od_tel" value="${vo.od_tel}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="od_cnt">주문수량</label>
				<input type="text" id="od_cnt" value="${vo.od_cnt}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="od_money">주문금액</label>
				<input type="text" id="od_money" value="${vo.od_money}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="od_status">주문상태</label>
				<c:if test="${vo.od_status eq 0}">
					<input type="text" id="od_status" value="결제완료" disabled/>
				</c:if>
				<c:if test="${vo.od_status eq 1}">
					<input type="text" id="od_status" value="주문취소(결제취소)" disabled/>
				</c:if>
				<c:if test="${vo.od_status eq 2}">
					<input type="text" id="od_status" value="주문완료(취소불가)" disabled/>
				</c:if>
			</div>
			
			<div class="outputArea">
				<button class="btn0" type="button" onclick="location.href='admin_cancel_list.do'">목록으로</button>
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