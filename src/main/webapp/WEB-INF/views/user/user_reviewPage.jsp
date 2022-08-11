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

<!--     <link rel="stylesheet" href="resources/reviewPage/header.css">
    <link rel="stylesheet" href="resources/reviewPage/mypage_review_style.css">
 -->
    <link rel="stylesheet" href="resources/orderDetail/buy_style.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="resources/orderDetail/header.css">
    <link rel="stylesheet" href="resources/reviewPage/mypage_style.css">
    <link rel="stylesheet" href="resources/orderDetail/style.css?after">

 
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <meta name="robots" content="noindex,follow" />

    <!-- fonts-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR&family=Open+Sans:wght@300&family=Roboto:wght@900&display=swap" rel="stylesheet">
	<style>
		.order-caption span:nth-child(2){
  margin-left: 190px;
}

.order-caption span:nth-child(3){
  margin-left: 100px;
}

.order-caption span:nth-child(4){
  margin-left: 20px;
}

.order-caption span:nth-child(5){
  margin-left: 40px;
}

.order-caption span:nth-child(6){
  margin-left: 45px;
}

.review_btn{
	border-style:none;
	color:white;
	background-color:#333335;
	width:70px;
	height:30px;
}

.review_btn:active{
	background-color:black;
}

	</style>
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
          <h2 class="my_order">작성 가능한 리뷰</h2>

          <div class="order-caption">
            <span>주문일자</span>
            <span>상품명</span>
            <span>주문수량</span>
            <span>주문금액</span>
            <span>리뷰상황</span>
            <span>리뷰보기</span>
          </div>

<!-- 리뷰영역 시작 -->
<c:forEach var="rv" items="${ orderviewList }">
<c:if test="${ rv.od_status ne 1 && rv.od_review eq 0}">
         <div class="item">
            <div class="buttons">
              <span class="oder_date">${fn:split(rv.od_date,' ')[0]}</span>
            </div>

            <div class="image">
              <img src="/loc_img/${rv.pd_img1}" alt=""/>
            </div>

            <div class="description">
              <span><a href ="/project/product_.do?pd_nm=${ rv.pd_nm }">${ rv.pd_nm }</a></span>
              <span>${ rv.pd_size }</span>
            </div>

            <div class="quantity">
              </button>
              <input type="text" name="name" value="${ rv.od_cnt }" disabled="disabled">개
              </button>
            </div>
            <div class="total-price">${ rv.od_money }</div>
            <div class="delivery"><b>작성가능</b></div>
            <div class="delv_info">
              <ul>
                <li>
                  <c:if test="${ rv.od_review eq 0 }">
                    <button type="button" style="cursor: pointer;" class="review_btn" name="button" onclick="writePopup('${rv.pd_nm}');">리뷰작성</button>
                  </c:if>
                </li>
              </ul>
              </div>
          </div>
</c:if>
</c:forEach>
        </div>
        <!-- 리뷰 가능 영역 끝 -->
        
        
        <div class="order_list">
          <h2 class="my_order">작성한 리뷰</h2>

          <div class="order-caption">
            <span>주문일자</span>
            <span>상품명</span>
            <span>주문수량</span>
            <span>주문금액</span>
            <span>리뷰상황</span>
            <span>리뷰보기</span>
          </div>

<!-- 작성한 리뷰 영역 시작 -->
<c:forEach var="rv" items="${ orderviewList2 }">
<c:if test="${ rv.od_status ne 1 && rv.od_review eq -1}">
         <div class="item">
            <div class="buttons">
              <span class="oder_date">${fn:split(rv.od_date,' ')[0]}</span>
            </div>

            <div class="image">
              <img src="/loc_img/${rv.pd_img1}" alt=""/>
            </div>

            <div class="description">
              <span><a href ="/project/product_.do?pd_nm=${ rv.pd_nm }">${ rv.pd_nm }</a></span>
              <span>${ rv.pd_size }</span>
            </div>

            <div class="quantity">
              </button>
              <input type="text" name="name" value="${ rv.od_cnt }" disabled="disabled">개
              </button>
            </div>
            <div class="total-price">${ rv.od_money }</div>
            <div class="delivery">작성완료</div>
            <div class="delv_info">
              <ul>
                <li>
                  <button type="button" class="review_btn" style="cursor: pointer;" name="button" onclick="openPopup('${rv.rv_idx}')">리뷰보기</button>
                </li>
              </ul>
              </div>
          </div>
</c:if>
</c:forEach>
        </div>
        <!-- 작성한 리뷰 영역 끝 -->     
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
    function openPopup(rv_idx){
        window.open("review_Open.do?rv_idx="+rv_idx, "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=525, height=960, left=600, top=100" );
    }
    
    function writePopup(pd_nm){
        window.open("review_Write.do?pd_nm="+pd_nm, "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=525, height=960, left=600, top=100" );
		    
    }
</script>
  </body>
</html>