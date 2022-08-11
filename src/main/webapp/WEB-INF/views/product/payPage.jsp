<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 로그인 한 상태에서만 접속 가능 ,css는 cart폴더 참조 -->
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
    <title>Payment</title>

    <link rel="stylesheet" href="resources/cart/buy_style.css?after" media="screen" title="no title" charset="utf-8">
    <link rel="stylesheet" href="resources/cart/header.css">
    <link rel="stylesheet" href="resources/cart/checkbox.css">
    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
    <meta name="robots" content="noindex,follow" />
    <script src="resources/cart/cart.js"></script>
	<!-- 카카오 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- fonts-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
	#pay_input:hover {
		cursor: pointer;
	}
	
	.pay-btn{
	/*   margin-top: 60px;
	  margin-right: -320px;
	  float: right; */
	  margin-right: 10px;
	  margin-bottom: 10px;
	  float: right;
	}
	
    </style>
    <style>
    summary{
    margin-left:30px;
    color:#5E6977;
    font-size:18px;
    }
    
    hr{
    border: 1px solid #E1E8EE;
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

		</nav>
    </header>

    <div class="shopping-cart">
      <!-- Title -->
      <div class="title">
        주문하기
      </div>

      <!-- Product -->
      <!--  장바구니에서 넘어왔을 때 보여줄 화면  -->
      <form id="order_frm">
      <c:if test="${ !empty cartList }">
      <c:set var = "total" value = "0" />
      <c:forEach var="cart" items="${ cartList }">
      <div class="item">
        <div class="buttons">
        </div>
        <div class="image">
          <img src="/loc_img/${cart.pd_img1}" alt="" />
        </div>

        <div class="description">
          <span>${ cart.pd_nm }</span>
          <span>${ cart.pd_size }</span>
        </div>

        <div class="quantity">
        <button class="plus-btn" type="button" disabled="disabled">
            ㅡ
        </button>
          <input type="text" value="${ cart.cart_cnt }" readOnly/>
        <button class="minus-btn" type="button" disabled="disabled">
        ㅡ
        </button>
        </div>
        <input type="hidden" id="cart_idx_btn" name="pd_idx" value="${cart.pd_idx}">
        <input type="hidden" name="od_cnt" value="${cart.cart_cnt }">
        <input type="hidden" name="od_money" value="${cart.cart_cnt * cart.pd_price}">

        <div class="total-price">${cart.pd_price*cart.cart_cnt}</div>
      </div>
      <c:set var= "total" value="${total + cart.cart_cnt * cart.pd_price }"/>
      </c:forEach>
      </c:if>
<!-- -------------------------------------------------------------------------------------------------------------- -->
      <!-- 상품페이지에서 넘어왔을 때 보여줄 화면 -->
      <c:if test="${!empty product }">
       <div class="item">
        <div class="buttons">
        </div>
        <div class="image">
          <img src="/loc_img/${product.pd_img1}" alt="" />
        </div>

        <div class="description">
          <span>${ product.pd_nm }</span>
          <span>${ product.pd_size }</span>
        </div>

        <div class="quantity">
        <button class="plus-btn" type="button" disabled="disabled">
            ㅡ
        </button>
          <input type="text" name="pd_cnt" value="${ cnt }" readOnly/>
        <button class="minus-btn" type="button" disabled="disabled">
        ㅡ
        </button>
        </div>

        <div class="total-price">${product.pd_price}</div>
        <input type="hidden" id="pd_idx_btn" name="pd_idx" value="${product.pd_idx}">
        <input type="hidden" name="pd_money" value="${ cnt * product.pd_price }">
      </div>
      </c:if>
      <!-- 받는 사람 정보 입력 -->

    <div class="order_info">
      <div class="title oder_info">
        배송지정보 입력
        <input type="hidden" name="user_idx" value="${user.user_idx}">
        <input type="hidden" name="cart_no" value="${cartList[0].cart_no}">
       
      </div>
      <details>
      <summary style="cursor: pointer;" onclick="checking();">수취인 정보 입력</summary>
      <hr>

      <div class="dlv_input">
        <div class="dlv_tit">
          수취인 이름
        </div>
        <input id="od_name" class="input_info" type="text" name="od_name" value="">
      </div>

      <div class="dlv_input phone">
        <div class="dlv_tit">
          수취인 연락처
        </div>
        <div class="phone_input">
          <input type="text" id="tel1">-
          <input type="text" id="tel2">-
          <input type="text" id="tel3">
          <input type="hidden" id="tel" name="od_tel">
        </div>
      </div>

      <div class="dlv_input">
        <div class="dlv_tit">
          배송지 주소
        </div>
        <div class="input_info">
          <input type="text" id="addr1" class="addr_auth" oninput="send();"><br>
          <input type="text" id="addr2" placeholder="상세주소 입력">
          <input type="hidden" id="postcode">
          <input type="hidden" id="od_addr" name="od_addr">
        </div>
      </div>
      </details>
    </div>
</form>
    <div class="payment">
      <div class="title oder_info">
        <span class="total">
          <span class="price"><fmt:formatNumber>${total}</fmt:formatNumber></span>
          <span class="total-won">총 결제 금액 :</span>
        </span>
     </div>
    </div>
   	<div class="pay-btn">
        <input id="pay_input" class="pay-btn" type="button" value="결제하기" onclick="order();">
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

<script type="text/javascript">
    
    let add_ck = false;
    
	function send() {
		new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	document.getElementById("postcode").value = data.zonecode;//우편번호
            	document.getElementById("addr1").value = data.address; // 주소 넣기
                $("#addr2").focus(); //상세입력 포커싱
                add_ck = true;
            }
        }).open();
	}

	/* KAKAO ADDRESS */
	window.onload = function(){
		
		$(".addr_auth").click(function() { //class = addr_auth 클릭시 동작
			new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	document.getElementById("postcode").value = data.zonecode;//우편번호
	            	document.getElementById("addr1").value = data.address; // 주소 넣기
	                $("#addr2").focus(); //상세입력 포커싱
	                add_ck = true;
	            }
	        }).open();
		});

	}
	
	let check = false;
	
	function checking() {
		check = !check;
	}
	
	function order() {
		
		if(check){
			let tel = $("#tel1").val()+$("#tel2").val()+$("#tel3").val();
			let od_addr = "( "+$("#postcode").val()+" )"+$("#addr1").val()+", "+$("#addr2").val();
			
			$("#tel").val(tel);
			$("#od_addr").val(od_addr);
			
			
			
			if(!add_ck||od_addr ==''){
				alert("주소를 입력해주세요.");
				return false;
			}
			
			if($("#od_name").val()==''){
				alert("받으실분의 이름을 입력해주세요.")
				return false;
			}
			
			if(tel == ''){
				alert("받으실 분의 핸드폰 번호를 입력해주세요.")
				return false;
			}
		}
		
		if(!check){
			
			let tel = '${user.user_tel}';
			let od_addr = '${user.user_addr}';
			let user_name = '${user.user_nm}';
			$("#tel").val(tel);
			$("#od_addr").val(od_addr);
			$("#od_name").val(user_name);
			
		}
		
		requestPay();
		
	}
	
	
	function order_foward(paycd, shopid) {
		let cnt = ${fn:length(cartList)};
		
		
		if(cnt > 0){
		
		$('#pd_idx_btn').attr('disabled', true);
			
		var f = $('#order_frm');
		var formData = f.serialize()+"&pay_cd="+paycd+"&od_mi="+shopid;
		
		
		$.ajax({
			type : "POST",
			url : "/project/creat_Order.do",
			data : formData,
			success: function(data){
				if(data == "Y"){
					location.href="/project/payCompli.do";
				}else{
					alert("주문 실패");
				}
			},
			error: function(data){
				alert("주문 에러 발생!");
				console.log(data);
			}
		});
		
		}else{
			
			$('#cart_idx_btn').attr('disabled', true);			
			var f = $('#order_frm');
			var formData = f.serialize()+"&pay_cd="+paycd+"&od_mi="+shopid;
			
			$.ajax({
				type : "POST",
				url : "/project/creat_OrderByOne.do",
				data : formData,
				success: function(data){
					if(data == "Y"){
						location.href="/project/payCompli.do";
					}else{
						alert("주문 실패");
					}
				},
				error: function(data){
					alert("주문 에러 발생!");
					console.log(data);
				}
			});
			
		}
	}
	
	
	
</script>

<script type="text/javascript">
let nm = "${cartList[0].pd_nm}";

/* IMPORT 결제 API */
var IMP = window.IMP; // 생략 가능
IMP.init('imp59352402'); // 예: imp00000000
function requestPay() {
	
	let num = ${total};
	let cnt = ${fn:length(cartList)};
	if(cnt > 0){
		nm = "${cartList[0].pd_nm} 등 ${fn:length(cartList)}개";
	}else{
		nm = "${product.pd_nm}";
	}
	
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "kakao",
        pay_method: "card",
        merchant_uid: 'merchant_' + new Date().getTime(),
       	name: nm,
        amount: num,
        buyer_email: "${user.user_email}",
        buyer_name: "${user.user_nm}",
        buyer_tel: "${user.user_tel}",
        buyer_addr: "${user.user_addr}",
        buyer_postcode: "${user.user_postcode}"
    }, function (rsp) { // callback
        if (rsp.success) {
            // 결제 성공 시 로직,
        	var msg = '결제가 완료되었습니다.';
    		msg += '고유ID : ' + rsp.imp_uid; //결제번호
    		msg += '상점 거래ID : ' + rsp.merchant_uid; //가맹점 아이디
    		msg += '결제 금액 : ' + rsp.paid_amount; // 결제 금액
    		
    		let paycd = rsp.imp_uid;
    		let shopid = rsp.merchant_uid;
    		
    		order_foward(paycd, shopid);
    		
        } else {
            // 결제 실패 시 로직,
        	var msg = '결제에 실패하였습니다.';
    		msg += '에러내용 : ' + rsp.error_msg;
        }
    });


}
  
  
  
</script>

  </body>
</html>