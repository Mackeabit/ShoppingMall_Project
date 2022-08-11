<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/member/member_view.css?after">
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
      	<h2>회원정보</h2>
      	
      	<div id="member_view">
			<div class="outputArea">
				<label for="user_idx">회원번호</label>
				<input type="text" id="user_idx" value="${vo.user_idx}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_nm">이름</label>
				<input type="text" id="user_nm" value="${vo.user_nm}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_id">아이디</label>
				<input type="text" id="user_id" value="${vo.user_id}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_pwd">비밀번호</label>
				<input type="text" id="user_pwd" value="${vo.user_pwd}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_gen">성별</label>
				<input type="text" id="user_gen" value="${vo.user_gen}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_jubun">주민번호</label>
				<input type="text" id="user_jubun" value="${vo.user_jubun}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_height">키</label>
				<input type="text" id="user_height" value="${vo.user_height}cm" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_weight">몸무게</label>
				<input type="text" id="user_weight" value="${vo.user_weight}kg" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_tel">연락처</label>
				<input type="text" id="user_tel" value="${vo.user_tel}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_email">이메일</label>
				<input type="text" id="user_email" value="${vo.user_email}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_addr">주소</label>
				<input type="text" id="user_addr" value="${vo.user_addr}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_date">가입일자</label>
				<input type="text" id="user_date" value="${vo.user_date}" disabled/>
			</div>
			
			<div class="outputArea">
				<label for="user_status">계정상태</label>
				<c:if test="${vo.user_status eq 0}">
					<input type="text" id="user_status" value="기본" disabled/>
				</c:if>
				<c:if test="${vo.user_status eq 1}">
					<textarea id="qna_res" name="qna_res" rows="3" cols="20" style="resize: none;">휴면
최근접속일 : ${fn:split(vo.user_logindate,' ')[0]}</textarea>
				</c:if>
				<c:if test="${vo.user_status eq 2}">
				<textarea id="qna_res" name="qna_res" rows="3" cols="20" style="resize: none;">탈퇴대기
탈퇴예정일 : ${fn:split(vo.user_signout,' ')[0]}</textarea>
				</c:if>
				<c:if test="${vo.user_status eq 3}">
					<input type="text" id="user_status" value="탈퇴" disabled/>
				</c:if>
			</div>
			
			<div class="outputArea">
				<button type="button" class="btn0" onclick="location.href='admin_user_list.do'">목록으로</button>
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