<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!-- css 참조 > resources/cart -->
<!-- 회원일 경우만 접속 가능하게 하는 코드 -->
<c:if test="${ empty user }">
	<script>
		alert("장바구니는 로그인 후 이용 가능합니다.");
		location.href="/project/login.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shopping Cart</title>

    <link rel="stylesheet" href="resources/cart/style.css" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="resources/cart/header.css">
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <meta name="robots" content="noindex,follow" />
<!-- <script src="resources/cart/cart.js"></script> -->

<!-- fonts-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <style>
	#paying_btn:hover {
		cursor: pointer;
	}
	
	.buy-btn > .delete_btn{
		background-color:#ececec;
		margin-right: 10px;
		color:gray;}
		
	.buy-btn > .delete_btn:hover{
		background-color:#e1e1e1;
	}
	
	.footer{
		position: absolute;
		top:100%;
	}
	
	body {
	 height: 900px;
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

    <div id="total_div" class="shopping-cart">
      <!-- Title -->
      <div class="title">
        장바구니
      </div>
      
      <!-- Product #1 -->
      <c:set var = "total" value = "0" />
      <c:forEach var="cart" items="${ cartList }">
      <div class="item">
        <div class="buttons">
        <input type="hidden" value="${ cart.cart_idx }">
          <span class="delete-btn">
          </span>
        </div>

        <div class="image">
          <img src="/loc_img/${cart.pd_img1}"/>
        </div>

        <div class="description">
          <span>${ cart.pd_nm }</span>
          <span>${ cart.pd_size }</span>
        </div>
        <div class="quantity">
          <button class="plus-btn" type="button" value="${ cart.cart_idx }">
            <img src="resources/cart/plus.svg"/>
          </button>
          <input type="text" value="${ cart.cart_cnt }" readOnly/>
          <button class="minus-btn" type="button" value="${ cart.cart_idx }">
            <img src="resources/cart/minus.svg"/>
          </button>
        </div>
        <div class="total-price"><fmt:formatNumber>${cart.pd_price}</fmt:formatNumber></div>
      </div>
      <c:set var= "total" value="${total + cart.cart_cnt * cart.pd_price }"/>
        <input type="hidden" class="pd_cnt_hd" value="${ cart.pd_cnt }">
     </c:forEach>
<form id="updateCart_frm">
        <input type="hidden" id="cart_idx_hd"  name="cart_idx" value="">
        <input type="hidden" id="cart_cnt_hd"  name="cart_cnt" value="">
</form>
        <form id="payfrm">
    <div class="total">
        <span class="total-won">총 금액 :</span>
        <span class="price"><fmt:formatNumber>${total}</fmt:formatNumber>원</span>
        <input type="hidden" name="user_idx" value="${ user.user_idx }">
        <input type="hidden" name="total" value="${ total }">
        <input type="hidden" name="total" value="${fn:length(cartList) > 0}">
        <span class="buy-btn">
        <c:if test="${fn:length(cartList) > 0}">
          <input type="button" id="paying_btn" value="구매하기" onclick="paying(this.form);">
        	<input type="button" class="delete_btn" style="cursor: pointer;" value="전체삭제" onclick="delAll();">
        </c:if>
        </span>
    </div>
        </form>
	</div>

<!-- footer -->
    <div class="footer">
      <footer class="txt">
        <ul class="info">
          <li>프로젝트 조원 : 사조</li>
          <li>조원 이름 : 송승호 이동근 김민 김인호 정다경</li>
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
   
    let pd_cnt = 0;
    let user_idx = ${user.user_idx};
    
    function paying(f) {
		
    	f.method = "POST";
    	f.action = "payPage.do";
    	f.submit();
    	
	}
    
      $('.minus-btn').on('click', function(e) {
    		e.preventDefault();
    		var $this = $(this);
    		var $input = $this.closest('div').find('input');
    		var value = parseInt($input.val());
    		
    		if (value > 1) {
    			value = value - 1;
    		} else {
    			value = 0;
    		}

        $input.val(value);
        
		let cart_idx = $(this).val();
		$("#cart_idx_hd").val(cart_idx);
		
		let cart_cnt = $input.val();
		$("#cart_cnt_hd").val(cart_cnt);
		
		
		var f = $('#updateCart_frm');
		var formData = f.serialize();
		
		$.ajax({
			type : "POST",
			url : "/project/cart_cnt_update.do",
			data : formData,
			success: function(data){
				if(data == 1){
					reloadDivArea(); //함수 실행
				}else{
					alert("수량 변동 중 문제 발생");
				}
			},
			error: function(data){
				alert("수량 에러 발생!");
				console.log(data);
			}
		});

    	});

    	$('.plus-btn').on('click', function(e) {
    		e.preventDefault();
    		var $this = $(this);
    		var $input = $this.closest('div').find('input');
    		var value = parseInt($input.val());
    		
    		pd_cnt = $(".pd_cnt_hd").val();

/*     		if (value < 100) { */
    		if (value < pd_cnt) {
      		value = value + 1;
    		} else {
    			/* value =100; */
    			value = pd_cnt;
    		}

    		$input.val(value);
    		
    		let cart_idx = $(this).val();
    		$("#cart_idx_hd").val(cart_idx);
    		
    		let cart_cnt = $input.val();
    		$("#cart_cnt_hd").val(cart_cnt);
    		
    		
    		var f = $('#updateCart_frm');
    		var formData = f.serialize();
    		
    		$.ajax({
    			type : "POST",
    			url : "/project/cart_cnt_update.do",
    			data : formData,
    			success: function(data){
    				if(data == 1){
    					reloadDivArea(); //함수 실행
    				}else{
    					alert("수량 변동 중 문제 발생");
    				}
    			},
    			error: function(data){
    				alert("수량 에러 발생!");
    				console.log(data);
    			}
    		});
    		
    	});
	
		function reloadDivArea() {
			location.reload();
		}

	   function delAll() {
			
		   let user_idx = ${user.user_idx};
		   
		   
			$.ajax({
				type : "POST",
				url : "/project/del_cartAll.do",
				data : {user_idx : user_idx},
				success: function(data){
					if(data == "Y"){
						if(!confirm("목록을 전부 삭제하시겠습니까?")){
							return false;
						}
						reloadDivArea(); //함수 실행
					}else if(data == "N"){
						reloadDivArea(); //함수 실행
					}else{
						alert("삭제하지 못했습니다.");
					}
				},
				error: function(data){
					alert("장바구니 삭제 에러 발생!");
					console.log(data);
				}
			});
	}
      
		
	  $('.delete-btn').hover(function() {
        $(this).toggleClass('is-active');
      });
      
      $(".delete-btn").click(function() {
		
    	  if(!confirm("현 품목을 장바구니에서 삭제하시겠습니까?")){
    		  return false;
    	  }
  		var $this = $(this);
		var $input = $this.closest('div').find('input');  
		let cart_idx = $input.val();
    	  
		$.ajax({
			type : "POST",
			url : "/project/del_cart.do",
			data : {cart_idx : cart_idx},
			success: function(data){
				if(data == "Y"){
					reloadDivArea(); //함수 실행
				}else{
					alert("삭제하지 못했습니다.");
				}
			},
			error: function(data){
				alert("장바구니 삭제 에러 발생!");
				console.log(data);
			}
		});
		
	});
      
    </script>
  </body>
</html>