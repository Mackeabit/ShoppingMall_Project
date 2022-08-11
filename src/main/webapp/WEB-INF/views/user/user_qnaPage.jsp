<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${ empty user }">
	<script>
		alert("로그인 후 이용해주세요.");
		location.href="/project/login.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My page</title>

    <link rel="stylesheet" href="resources/qnaPage/header.css">
    <link rel="stylesheet" href="resources/qnaPage/mypage_style.css?after">
    <link rel="stylesheet" href="resources/qnaPage/style.css?after">

    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <meta name="robots" content="noindex,follow" />

    <!--qna-->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
    <!-- <script  src="resources/qnaPage/more_view_script.js"></script> -->
    <link rel="stylesheet" href="resources/qnaPage/more.css">
    <!-- fonts-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&family=Open+Sans:wght@300&family=Roboto:wght@900&display=swap" rel="stylesheet">

  
  </head>
  <body>
   <div class="top">
      <header>
		<div class="top">
			<a href="/project"><img
				src="https://blog.kakaocdn.net/dn/caiodL/btrEE1rTCxP/7gyg5XtCQxaBKVIn8TU3lk/img.jpg"
				alt=""></a>
			</h1>
			<span class="small_menu"> <c:if test="${ empty user }">
					<a href="/project/sign.do">
					<span class="material-icons md-36 signup">person_add_alt_1</span>
						<div class="small_menu_txt">join</div>
					</a>
				</c:if>
				<c:if test="${ empty user }">
					<a href="/project/login.do"> <span class="material-icons md-36">login</span>
						<div class="small_menu_txt">Login</div>
					</a>
				</c:if>
				<c:if test="${!empty user }">
					<a href="/project/logout.do">
					<span class="material-icons md-36">logout</span>
						<div class="small_menu_txt">Logout</div>
					</a>
				</c:if>
				<a href="/project/mypage.do">
				<span class="material-icons md-36 mypage">person</span>
					<div class="small_menu_txt">My page</div>
				</a>
					<a href="/project/cart.do">
				<span class="material-icons md-36">shopping_cart</span>
					<div class="small_menu_txt cart">Cart</div>
					</a>
			</span>
		</div>

		<nav class="menu">
			<div class="menu_bar">
			<c:forEach var="cate" items="${ category }">
				<c:if test="${ cate.category_cd ne 0 }">
					<span>
						<a href="/project/product_list.do?category_cd=${ cate.category_cd }">
							${ cate.category_nm }
						</a>
					</span>
				</c:if>
			</c:forEach>
			</div>

		</nav>
      </header>
    </div>

    <div class="row">
    
    <!-- 마이페이지 카테고리 영역 시작 -->
      <div class="column x1">
        <section class="menu_tit">
          <span class="material-icons md-36 user-icon">assignment_ind</span><br>
          <span class="userID"><a href="/project/mypage.do">${ user.user_nm }</a></span><br>
          <span class="greet"> 님의 마이페이지</span>
        </section>
        <ul class="left_menu">
		  <li><a href="/project/orderDetail.do">주문조회</a></li>
          <li><a href="/project/userOrderCancle.do">결제취소</a></li>
          <li><a href="/project/userQnA.do">문의내역</a></li>
          <li><a href="/project/userReview.do">리뷰내역</a></li>
          <li><a href="/project/user_modi.do">회원정보수정</a></li>
          <c:if test="${ user.user_status eq 2 }">
          <li><a href="/project/drop_cancle.do" class="drop_ac">탈퇴 취소</a></li>
          <li>탈퇴 예정일 : <br> ${fn:split(user.user_signout,' ')[0]}</li>
          </c:if>
          <c:if test="${ user.user_status ne 2 }">
          <li><a href="/project/drop_account.do" class="drop_ac">회원탈퇴</a></li>
          </c:if>
        </ul>
      </div>
    <!-- 마이페이지 카테고리 영역 끝 -->
    
      <div class="column main">
      <!-- 주문현황 -->
        <div class="user_order">
          <h2 class="my_order">나의 주문 현황</h2>
            <div class="order_present">
              <ul>
                장바구니
                <li>
                  <a href="/project/cart.do">${mypage.cartCnt}</a>
                  <span>건</span>
                </li>
              </ul>
              <ul>
                결제완료
                <li>
                  <a href="/project/orderDetail.do">${mypage.payCnt}</a>
                  <span>건</span>
                </li>
              </ul>
              <ul class="user-cancel">
                결제취소
                <li>
                  <a href="/project/userOrderCancle.do">${mypage.cancleCnt}</a>
                  <span>건</span>
                </li>
              </ul>
            </div>
            <hr>
        </div>
        <!-- 주문현황 카테고리 끝 -->
        <div class="order_list">
          <h2 class="my_order">상품문의</h2>

          <div class="order-caption">
            <span>문의번호</span>
            <span>상품명</span>
            <span>답변상태</span>
            <span>보기</span>
          </div>

<c:forEach var="qna" items="${ qnaviewList }">

          <div class="item">
            <div class="buttons">
              <div class="oder_no">${qna.qna_idx}</div>
              <div class="oder_date">${fn:split(qna.qna_date,' ')[0] }</div>
            </div>

            <div class="image">
              <img src="/loc_img/${qna.pd_img1}" alt=""/>
            </div>

            <div class="description">
              <span>${ qna.pd_nm }</span>
              <span>${ qna.pd_size }</span>
            </div>

            <div class="quantity">
            </div>
            <c:if test="${ qna.qna_status eq 0 }">
            <div class="delivery">답변대기</div>
            </c:if>
            <c:if test="${ qna.qna_status eq -1 }">
            <div class="delivery">답변완료</div>
            </c:if>
            <div class="delv_info morev">
              <ul>
                  <span onclick="qna_openPopup(${qna.qna_idx})">
					<button type="button" class="view_btn" name="button">문의보기</button>
                  </span>
              </ul>
            </div>
          </div>
          <!-- 문의 제목 끝 -->
</c:forEach>
      </div>
      </div>
    </div>

<!-- footer -->
    <div class="footer">
      <footer class="txt">
        <ul class="info">
          <li>프로젝트 조원 : 사조</li>
          <li>조원 이름 : <b>송승호</b> 이동근 김민 김인호 정다경</li>
          <li>E-mail: babucpu3@gmail.com</li>
        </ul>
        <span class="footer-logo">
          <a href="/project"><img src="https://blog.kakaocdn.net/dn/x9wZZ/btrEyuoLrQz/ZzQS6fe14wOJ81lMJ3kdI1/img.jpg" alt=""></a>
          <ul class="cs">
            <li class="cs-title">고객센타</li>
            <li class="cs-callno">1544-58826</li>
          </ul>
        </span>
      </footer>
    </div>
<!-- footer -->

<script>

function qna_openPopup(qna_idx){
    window.open("qna_Open.do?qna_idx="+qna_idx, "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=525, height=700, left=600, top=100" );
}

</script>
  </body>
</html>