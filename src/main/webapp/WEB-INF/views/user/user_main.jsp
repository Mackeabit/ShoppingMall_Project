<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>NOPRODUCT</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200&family=Open+Sans&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&family=Open+Sans:wght@300&family=Roboto:wght@900&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200&family=Noto+Sans+KR:wght@700&family=Open+Sans&display=swap"
	rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="resources/main_index.css">
<link rel="stylesheet" href="resources/header.css">
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<!-- fonts-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
	
	<style>
		header{
		  z-index: 1;
		}
	.item-title .item-name{
      height:40px;}
    .sch_btn{
  	cursor: pointer;
	}    
	</style>
	
<script>
	$(function(){
		  var $slider = $('.slider'),
		      $firstSlide = $slider.find('li').first() // 첫번째 슬라이드
		      .stop(true).animate({'opacity':1},200); // 첫번째 슬라이드만 보이게 하기

		  function PrevSlide(){ // 이전버튼 함수
		    stopSlide();startSlide(); //타이머 초기화
		    var $lastSlide = $slider.find('li').last() //마지막 슬라이드
		    .prependTo($slider); //마지막 슬라이드를 맨 앞으로 보내기  
		    $secondSlide = $slider.find('li').eq(1)//두 번째 슬라이드 구하기
		    .stop(true).animate({'opacity':0},1000); //밀려난 두 번째 슬라이드는 fadeOut 시키고
		    $firstSlide = $slider.find('li').first() //맨 처음 슬라이드 다시 구하기
		    .stop(true).animate({'opacity':1},1000);//새로 들어온 첫 번째 슬라이드는 fadeIn 시키기
		  }
		  
		  function NextSlide(){ // 다음 버튼 함수
		    stopSlide();startSlide(); //타이머 초기화
		    $firstSlide = $slider.find('li').first() // 첫 번째 슬라이드
		    .appendTo($slider); // 맨 마지막으로 보내기
		    var $lastSlide = $slider.find('li').last() // 맨 마지막으로 보낸 슬라이드
		    .stop(true).animate({'opacity':0},1000); // fadeOut시키기
		    $firstSlide = $slider.find('li').first()// 맨 처음 슬라이드
		    .stop(true).animate({'opacity':1},1000);// fadeIn 시키기
		  }
		  
		  $('#next').on('click', function(){ //다음버튼 클릭
		    NextSlide();
		  });
		  $('#prev').on('click', function(){ //이전 버튼 클릭
		    PrevSlide();
		  });

		  startSlide(); // 자동 슬라이드 시작
		  
		  var theInterval;

		  function startSlide() {
		    theInterval = setInterval(NextSlide, 3000); //자동 슬라이드 설정
		  }

		  function stopSlide() { //자동 멈추기
		    clearInterval(theInterval);
		  }
		  
		  $('.slider').hover(function(){ //마우스 오버시 슬라이드 멈춤
		    stopSlide();
		  }, function (){
		    startSlide();
		  });
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
					<span>
						<a href="/project/product_list.do?category_cd=${ cate.category_cd }">
							${ cate.category_nm }
						</a>
					</span>
				</c:if>
			</c:forEach>
			</div>

			<div class="search">
				<input type="text" id="keyword" class="sch_bar" placeholder="검색어를 입력하세요" onkeyup="enterkey();" value="">
				<input type="button" class="sch_btn" value="검색" onclick="sendsearch();">
			</div>
		</nav>
	</header>
	
	<!-- 무한 자동 슬라이드 배너 -->
	<div id="slideshow" class="slider">
		<ul>
			<li>
				<div><!-- 2슬라이드 -->
					<a href="/project/product_.do?pd_nm=페라가모 머니클립"> <img
						src="https://blog.kakaocdn.net/dn/lMTXD/btrEDQKFM9z/h4ZwPTgOfUQ9k8upax5l81/img.jpg">
					</a>
				</div>
			</li>
			<li>
				<div><!-- 3슬라이드 -->
					<a href="/project/product_.do?pd_nm=노프로덕트 여성 하얀셔츠"> <img
						src="https://blog.kakaocdn.net/dn/oPmSW/btrEE0GhaMT/9bZxKhSz507mNPTI9TfJEk/img.jpg">
					</a>
				</div>
			</li>
			<li>
				<div><!-- 1슬라이드 -->
					<a href="/project/product_.do?pd_nm=리바이스 청바지"> <img
						src="https://blog.kakaocdn.net/dn/dgdCoI/btrEzohiJao/uTTC3IQ4ooKPG2BbD4Rsw0/img.jpg">
					</a>
				</div>
			</li>
		</ul>
	</div>

	<!-- 세일 페이지 -->
	<div class="main-bann">
		<div class="title">
			<h2 class="main-title">오픈이벤트 딜</h2>
			<span>오픈기념 초대박 행사상품 !</span>
		</div>
		<c:forEach var="sale" items="${ saleList }">
			<div class="deal_01">
				<a href="/project/product_.do?pd_nm=${ sale.pd_nm }">
					<div class="deal-img">
						<img src="/loc_img/${sale.pd_img}"/>
					</div>
					<div class="item-title">
						<div class="item-name">[오픈기념행사상품] ${sale.pd_nm}</div>
						<div class="price"><fmt:formatNumber>${sale.pd_price}</fmt:formatNumber>원</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>

	<!-- 중간 이미지 -->

	<div class="middle-ad">
		<img
			src="https://blog.kakaocdn.net/dn/cUCD8M/btrECzJkVY6/QflDSpdNNIjgBKyiobt4jK/img.jpg"
			alt="">
	</div>

	<!-- MD추천 상품 -->

	<div class="main-bann">
		<div class="title">
			<h2 class="main-title-02">노프로덕트 MD추천 상품</h2>
			<span>오픈기념 초대박 행사상품 !</span>
		</div>
		<c:forEach var="md" items="${ mdList }">
			<div class="deal_01">
				<a href="/project/product_.do?pd_nm=${ md.pd_nm }">
					<div class="deal-img">
						<img src="/loc_img/${md.pd_img}"/>
					</div>
					<div class="item-title">
						<div class="item-name">[MD추천 상품] ${md.pd_nm}</div>
						<div class="price"><fmt:formatNumber>${md.pd_price}</fmt:formatNumber>원</div>
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
				<li>조원 이름 : 이동근 송승호 김민 김인호 정다경</li>
				<li>E-mail: babucpu3@gmail.com</li>
			</ul>
			<span class="footer-logo"> <img
				src="https://blog.kakaocdn.net/dn/x9wZZ/btrEyuoLrQz/ZzQS6fe14wOJ81lMJ3kdI1/img.jpg"
				alt="">
				<ul class="cs">
					<li class="cs-title">고객센터</li>
					<li class="cs-callno">1544-58826</li>
				</ul>
			</span>
		</footer>
	</div>

</body>
</html>