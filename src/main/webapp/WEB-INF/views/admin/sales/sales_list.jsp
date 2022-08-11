<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<c:if test = "${empty adminVO }">
	<script>
		alert("로그인 후 이용해주세요");
		location.href="admin_login_form.do";
	</script>
</c:if>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/sales/sales_list.css?after">
<style>
	header{
	  z-index: 1;
	}
	header > #s{
	position:absolute; right:12%; top:25%; width:8%; height:40%; text-align:center; 
	margin:0 10px; padding:5px;
}
</style>
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
    
  	/* 버튼 */
    $(".hover").mouseleave(
    	function() {
			$(this).removeClass("hover");
    	}
   	);
</script>
</head>

<body>
<div id='wrap'>
  <section>
    <header>
      <img id="logo" src="https://blog.kakaocdn.net/dn/caiodL/btrEE1rTCxP/7gyg5XtCQxaBKVIn8TU3lk/img.jpg">
	  <button id="s" type="button" class="btn0" onclick="location.href='admin.do'">메인페이지</button>
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
      	<h2>매출관리</h2>
      	
      	<div id="pd_box">
      		<h3>상품별 판매순위</h3>
      	
      		<c:forEach var="vo" items="${pd_sales_list}" varStatus="loop" begin="0" end="3">
      			<div class="pd_content">
	      			<h5 style="color:#CA5F5F;">${loop.index + 1}위</h5>
		      		<a href="#"><img class="active" src="/loc_img/${vo.pd_img}"></a>
		      		<h5>상품명 : ${vo.pd_nm}</h5>
		      		<h5>주문수량 : ${vo.cnt}</h5>
		      		<h5>판매금액 : ${vo.sales}</h5>
      			</div>
      		</c:forEach>
      	</div>
      	
      	<div id="sales_box">
      		<h3>매출조회</h3>
      	
	         <ul>
	         	<c:forEach var="vo" items="${sales_list}">
	         		<li><span class="date">[ ${vo.od_date} ] : <fmt:formatNumber value="${vo.sales}" pattern="#,###"/>원<br></span>
	        	   	  <span class="bar" style="width:calc(90%*(${vo.sales}/${sum}))"></span>
	      	     	</li>
	         	</c:forEach>
	         </ul>
	          
	         <h3 id="sum">총 매출: <fmt:formatNumber value="${sum}" pattern="#,###"/>원</h3>
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
