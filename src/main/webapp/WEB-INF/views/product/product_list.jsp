<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex,follow" />
    <title></title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200&family=Open+Sans&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&family=Open+Sans:wght@300&family=Roboto:wght@900&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200&family=Noto+Sans+KR:wght@700&family=Open+Sans&display=swap" rel="stylesheet">


    <link rel="stylesheet" href="resources/category/categori.css">
    <link rel="stylesheet" href="resources/category/header.css">
    <!--slide-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans%3A400%2C400italic%2C600%2C700%2C700italic%7COswald%3A400%2C300%7CVollkorn%3A400%2C400italic'>
    <link rel="stylesheet" href="resources/category/style.css">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.1/TweenMax.min.js'></script>
    <script  src="resources/category/script.js"></script>

    <!-- fonts-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  
  <style>
  .item-title .item-name{
      height:40px;}
  .sch_btn{
  	cursor: pointer;
  }    
  </style>
  
  </head>
  <body>
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
					<span id="${ cate.category_nm }">
						<a href="/project/product_list.do?category_cd=${ cate.category_cd }">
							${ cate.category_nm }
						</a>
					</span>
				</c:if>
			</c:forEach>
			</div>

			<div class="search">
				<input type="text" id="keyword" class="sch_bar" placeholder="검색어를 입력하세요" autocomplete="off" onkeyup="enterkey();" value="">
				<input type="button" class="sch_btn" value="검색" onclick="sendsearch();">
			</div>

		</nav>
	</header>
    <div class="empty">
      1
    </div>

    </div>
    <!-- slide -->
      <main class="main-content">
        <section class="slideshow">
        <div class="slideshow-inner">
          <div class="slides">
          <!-- 0 -->
            <div class="slide is-active ">
              <div class="slide-content">
                <div class="caption">
                  <div class="title">No Product TOP</div>
                  <div class="text">
                    <p>One-piece</p>
                  </div>
                  <a href="/project/product_list.do?category_cd=10" class="btn">
                    <span class="btn-inner">Learn More</span>
                  </a>
                </div>
              </div>
              <div class="image-container">
                <img src="https://www.alixbdanthenay.fr/wp-content/uploads/2015/07/Indispensable-1.jpg" alt="" class="image" />
              </div>
            </div>
            <!-- 0 -->
            <!-- 1 -->
            <div class="slide">
              <div class="slide-content">
                <div class="caption">
                  <div class="title">T-shirt</div>
                  <div class="text">
                    <p>tommy</p>
                  </div>
                  <a href="/project/product_.do?pd_nm=디즈니 픽사 티셔츠" class="btn">
                    <span class="btn-inner">Learn More</span>
                  </a>
                </div>
              </div>
              <div class="image-container">
                <img src="https://www.alixbdanthenay.fr/wp-content/uploads/2015/07/Indispensable-4-1.jpg" alt="" class="image" />
              </div>
            </div>
            <!-- 1 -->
            <!-- 2 -->
            <div class="slide">
              <div class="slide-content">
                <div class="caption">
                  <div class="title">NEW CATEGORY OPEN</div>
                  <div class="text">
                    <p>accessories</p>
                  </div>
                  <a href="/project/product_list.do?category_cd=40" class="btn">
                    <span class="btn-inner">Learn More</span>
                  </a>
                </div>
              </div>
              <div class="image-container">
                <img src="https://www.alixbdanthenay.fr/wp-content/uploads/2016/11/11.jpg" alt="" class="image" />
              </div>
            </div>
            <!-- 2 -->
            <!-- 3 -->
            <div class="slide">
              <div class="slide-content">
                <div class="caption">
                  <div class="title">NEW ACC ITEM</div>
                  <div class="text">
                    <p>Jew</p>
                  </div>
                  <a href="/project/product_.do?pd_nm=노프로덕트 반지" class="btn">
                    <span class="btn-inner">Learn More</span>
                  </a>
                </div>
              </div>
              <div class="image-container">
                <img src="https://www.alixbdanthenay.fr/wp-content/uploads/2016/11/20mars17-sans-typo.jpg" alt="" class="image" />
              </div>
            </div>
            <!-- 3 -->
          </div>
          <div class="pagination">
            <div class="item is-active">
              <span class="icon">1</span>
            </div>
            <div class="item">
              <span class="icon">2</span>
            </div>
            <div class="item">
              <span class="icon">3</span>
            </div>
            <div class="item">
              <span class="icon">4</span>
            </div>
          </div>
          <div class="arrows">
            <div class="arrow prev">
              <span class="svg svg-arrow-left">
                <svg version="1.1" id="svg4-Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="14px" height="26px" viewBox="0 0 14 26" enable-background="new 0 0 14 26" xml:space="preserve"> <path d="M13,26c-0.256,0-0.512-0.098-0.707-0.293l-12-12c-0.391-0.391-0.391-1.023,0-1.414l12-12c0.391-0.391,1.023-0.391,1.414,0s0.391,1.023,0,1.414L2.414,13l11.293,11.293c0.391,0.391,0.391,1.023,0,1.414C13.512,25.902,13.256,26,13,26z"/> </svg>
                <span class="alt sr-only"></span>
              </span>
            </div>
            <div class="arrow next">
              <span class="svg svg-arrow-right">
                <svg version="1.1" id="svg5-Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="14px" height="26px" viewBox="0 0 14 26" enable-background="new 0 0 14 26" xml:space="preserve"> <path d="M1,0c0.256,0,0.512,0.098,0.707,0.293l12,12c0.391,0.391,0.391,1.023,0,1.414l-12,12c-0.391,0.391-1.023,0.391-1.414,0s-0.391-1.023,0-1.414L11.586,13L0.293,1.707c-0.391-0.391-0.391-1.023,0-1.414C0.488,0.098,0.744,0,1,0z"/> </svg>
                <span class="alt sr-only"></span>
              </span>
            </div>
          </div>
        </div>
      </section>
      </main>
    <!-- slide -->
    <div class="align">
      <span class="align-munu">
      </span>
    </div>
    <div class="main-bann">
        <div class="title">
        <h2 class="main-title">${ param.category_nm }</h2>
      </div>
		<c:forEach var="product" items="${ list }">
			<div class="deal_01">
				<a href="/project/product_.do?pd_nm=${ product.pd_nm }">
					<div class="deal-img">
						<img src="/loc_img/${product.pd_img}">
					</div>
					<div class="item-title">
						<div class="item-name">${product.pd_nm}</div>
						<div class="price"><fmt:formatNumber>${product.pd_price}</fmt:formatNumber>원</div>
					</div>
				</a>
			</div>
		</c:forEach>
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

window.onload=(function() {
	
	$("#${param.category_nm}").find('a').css("color","white");
	
});


function enterkey() {
	if(window.event.keyCode == 13){
		sendsearch();
	}
}

function sendsearch() {
	let keyword = $("#keyword").val();
	
	location.href = "keyword.do?keyword="+keyword;
	
}
</script>
    
  </body>
</html>