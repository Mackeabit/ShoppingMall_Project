<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product</title>
    <!--header source-->
    <link rel="stylesheet" href="resources/header.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@200&family=Open+Sans&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&family=Open+Sans:wght@300&family=Roboto:wght@900&display=swap" rel="stylesheet">
    <!--header source-->

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- CSS -->
    <link href="resources/product/style.css?after" rel="stylesheet">
    <link href="resources/product/tabmenu.css?after" rel="stylesheet">
    <meta name="robots" content="noindex,follow" />


    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" charset="utf-8"></script>
    <script src="resources/product/script.js" charset="utf-8"></script>
    <script src="resources/product/tabmenu.js" charset="utf-8"></script>
	
	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<style>
/* Left Column */
.left-column img {
    width: 500px;
    height: auto;
    position: absolute;
    top:15%;
    left:10%;
    opacity: 0;
    transition: all 0.3s ease;
}

.tabcontent{
margin-top:-40px;
height:auto;
}
.tab{

height:auto;
}
header{
  z-index: 1;
}

#minus_btn_id:hover {
	cursor: pointer;
}
#plus_btn_id:hover {
	cursor: pointer;
}

.writebtn:hover{
	cursor: pointer;
}
.container{
	left:7%;
} 

.writebtn{
	width:70px;
	height:30px;
	color:white;
	background-color:#333335;
	border-style:none;
	margin-top:-20px;
	}
	
.writebtn:active{
	background-color: black;
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
					<span>
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

    <main class="container">

      <!-- Left Column / Headphones Image -->
      <c:forEach var="product" items="${ list }" begin="0" end="0">
      <div class="left-column">
      	<img class="active" src="/loc_img/${product.pd_img}">
      </div>


      <!-- Right Column -->
      <div class="right-column">

        <!-- Product Description -->
        <div class="product-description">
          <span>No Product</span>
          <h1>${product.pd_nm }</h1>
          <!-- <p>선불 택배 (CJ대한통운)</p> -->
        </div>
      </c:forEach>

        <!-- Product Configuration -->
        <div class="product-configuration">

          <!-- Cable Configuration -->
          <div class="cable-config">
            <span>Size</span>
			<form id="insertCart_frm">
            <div class="cable-choose">
            <c:forEach var="product" items="${ list }">
            	<button type="button" id="size_btn" class="size_btn" value="${ product.pd_idx }">${ product.pd_size }
            	<input type="hidden" id="pd_cnt" class="pd_cnt" value="${ product.pd_cnt }">
            	</button>
            </c:forEach>
            	<input type="hidden" id="pd_idx" name="pd_idx" value="">
            	<input type="hidden" id="user_idx" name="user_idx" value="${ user.user_idx }">
            	<input type="hidden" id="cnt" name="cnt" value="">
            </div>
            </form>

            <div class="amount">
              <input id="minus_btn_id" type='button' onclick='count("minus")' value='-'/>
              <span id='result'>0</span>
              <input id="plus_btn_id" type='button' onclick='count("plus")' value='+'/>
            </div>

            <a href="#">옵션을 선택해주세요</a>
          </div>
        </div>

        <!-- Product Pricing -->
        <div class="product-price">
          <span id="result2"></span>
          <span>&#8361;</span>
          <a href="#" onclick="cart_btn();" class="cart-btn">Add to cart</a>
          <a href="#" onclick="buy_btn();" class="buy-btn">Buy</a>
        </div>
      </div>
    </main>
    
      <hr>
      <div class="product_page">
        <img src="/loc_img/${list[0].pd_img2}" alt="">
      </div>

      <div class="tab">
        <ul class="tabnav">
          <li><a href="#tab01">상품문의</a></li>
          <li><a href="#tab02">상품리뷰</a></li>
        </ul>
        <div class="tabcontent">
          <div id="tab01">
          <!-- 문의 tab -->
            <table class="qna">
            <tr class="caption">
              <th>no.</th>
              <th>문의내용</th>
              <th>날짜</th>
            </tr>
            <!-- 문의 내용 -->
            <c:forEach var="qna" items="${ qnaList }">
            <tr class="qna_board">
              <td>${ qna.qna_idx }</td>
              <!-- 조건1 비공개일 경우 해당 user만 보이게한다. -->
              <c:if test="${ qna.qna_secret == -1 }">
	              <c:if test="${ qna.user_idx == user.user_idx }">
	              	<td><a href="#" onclick="qna_openPopup(${qna.qna_idx});">${ qna.qna_title }</a></td>
	              </c:if>
	              <c:if test="${ qna.user_idx != user.user_idx || empty user }">
	              	<td>비공개 게시글입니다.</td>
	              </c:if>
              </c:if>
              <c:if test="${ qna.qna_secret != -1 }">
              <td><a href="#" onclick="qna_openPopup(${qna.qna_idx});">${ qna.qna_title }</a></td>
              </c:if>
              <td>${fn:split(qna.qna_date,' ')[0]}</td>
            </tr>
            <!-- 문의 내용 끝 -->
            </c:forEach>
            </table>
         <!-- 문의 tab 끝 -->
            <c:if test="${ !empty user }">
            <input type="button" value="문의하기" class="writebtn" onclick="qna_writePopup();">
            </c:if>
          </div>
          <div id="tab02">
           <!-- 리뷰 tab -->
            <table class="qna">
            <tr class="caption">
              <th>no.</th>
              <th>리뷰내용</th>
              <th>날짜</th>
            </tr>
            <c:forEach var="rv" items="${ reviewList }">
            <c:if test="${ rv.rv_title != '' || rv.rv_title != null }">
            <tr class="qna_board">
              <td></td>
              <td><a href="#" onclick="openPopup(${rv.rv_idx});">${ rv.rv_title }</a></td>
              <td>${ rv.rv_date }</td>
            </tr>
            </c:if>
            </c:forEach>
            </table>
          <!-- 리뷰 tab 끝 -->
            <c:if test="${ !empty user }">
            <c:if test="${fn:length(viewList) > 0}">
            <input type="button" class="writebtn" value="리뷰작성" onclick="writePopup()">
            </c:if>
            </c:if>
          </div>
        </div>
      </div><!--tab-->
      
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
    
    function writePopup(){
    	
        window.open("review_Write.do?pd_nm=${viewList[0].pd_nm}", "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=525, height=960, left=600, top=100" );
		    
    }

    function qna_openPopup(qna_idx){
        window.open("qna_Open.do?qna_idx="+qna_idx, "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=525, height=700, left=600, top=100" );
    }
    function qna_writePopup(){
        window.open("qna_Write.do?pd_nm=${list[0].pd_nm}", "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=525, height=700, left=600, top=100" );
    }
    
    
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


<script>
	
	let size = '';
	let number = 0;
	let price = ${list[0].pd_price};
	let pd_cnt = 0;
	let cnt_check = 'no';
	
	$("#result2").text(price*number);
	
	$(".size_btn").click(function() {
		
		$(this).siblings().css('border','2px solid #E1E8EE');
		$(this).css('border','2px solid black');
		
		if(cnt_check == 'no'){
			cnt_check = $(this).text();
		}else if(cnt_check != $(this).text()){
			$('#result').text(0);
			$("#result2").text(price*0);
			$('#cnt').val(0);
			number = 0;
			cnt_check = $(this).text();
		}
		
		
		/* 장바구니에 넘기기 전에 체크해야하는 size 선택유무
		선택한 사이즈 값에 맞는 pd_idx 구하기*/
		size = $(this).text();
		let pd_idx2 = $(this).val();
		$("#pd_idx").val(pd_idx2);
		
		/* 재고수량을 pd_cnt에 담아주기 */
		let $this = $(this);
		let $input = $this.find('input');
		pd_cnt = $input.val();
		
	});
	
	
	function count(type)  {
		
		if(size == ''){
			alert("Size를 선택해주세요.");
			return false;
		}
		
		  // 결과를 표시할 element
		  const resultElement = document.getElementById('result');

		  // 현재 화면에 표시된 값
		  number = resultElement.innerText;
		  
		  // 더하기/빼기
		  if(type === 'plus') {
			  
			  if(number > pd_cnt-1){
				  alert("재고 수량이 부족합니다.");
				  return false;
			  }
			  
		    number = parseInt(number) + 1;
		  }else if(type === 'minus')  {
		  	if(number < 1){
		  		return false;
		  	}
		    number = parseInt(number) - 1;
		  }

		  // 결과 출력
		  resultElement.innerText = number;
		  
		  $("#result2").text(price*number);
		  
		}
	
	function cart_btn() {
		
		$("#cnt").val(number);
		
		let user_idx = $("#user_idx").val();
		
		if(user_idx == null || user_idx == ''){
			alert("로그인 후 이용하실 수 있습니다.");
			location.href = "/project/login.do";
			return false;
		}
		
		if(size == ''){
			alert("Size를 선택해주세요.");
			return false;
		}
		
		if(number == 0){
			alert("상품 수량을 선택해주세요");
			return false;
		}
		
		var f = $('#insertCart_frm');
		var formData = f.serialize();
		
		
		$.ajax({
			type : "POST",
			url : "/project/cart_select.do",
			data : formData,
			success: function(data){
				if(data == "Y"){
					alert("장바구니에 추가되었습니다.");
					location.reload();
				}else if(data == "N"){
					alert("이미 장바구니에 추가 되어 있는 상품입니다.");
				}else{
					alert("장바구니에 추가할 수 없습니다.");
				}
			},
			error: function(data){
				alert("장바구니 에러 발생!");
				console.log(data);
			}
		});
		
	}
	
	function buy_btn() {
		
		if(${ empty user }){
			alert("로그인 후 이용하실 수 있습니다.");
			location.href = "/project/login.do";
			return false;
		}
		
		$("#cnt").val(number);
		
		if(size == ''){
			alert("Size를 선택해주세요.");
			return false;
		}
		
		if(number == 0){
			alert("상품 수량을 선택해주세요");
			return false;
		}
		
		var f = $('#insertCart_frm');
		var formData = f.serialize();
		
		location.href = "/project/payPageOne.do?"+formData;
	}
	
</script>

    </body>
</html>