<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link href="resources/popup/review_view.css?after" rel="stylesheet">
        	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
    	button:hover{
    		cursor: pointer;
    	}
    	.star_grade{
    	height:120px;
    	}
    	
    	hr{
    	margin-top:30px;
    	}
    </style>
    
    <script>
    window.onload=(function () {
	    $('input[value=${rv.rv_score}]').attr('checked', true);
	})
    </script>
  </head>
  <body>
    <div class="popup_container">
      <div class="main_caption">
        <h1 class="main_title">${ rv.user_nm }님의 리뷰</h1>
      </div>
      <div class="main_product_name">
        <img src="/loc_img/${rv.pd_img1}" alt="">
        <ul class="product_info">
          <li class="prd_name">${ rv.pd_nm }</li>
          <li class="prd_option">Size : ${rv.pd_size }</li>
          <li class="prd_option">작성일자 : ${fn:split(rv.rv_date,' ')[0]}</li>
        </ul>
      </div>
      <div class="star_grade">
        <h2>상품 평점</h2>
        <div class="star-rating">
          <input type="radio" id="5-stars" name="rating" value="5" disabled="disabled"/>
          <label for="5-stars" class="star">&#9733;</label>
          <input type="radio" id="4-stars" name="rating" value="4" disabled="disabled"/>
          <label for="4-stars" class="star">&#9733;</label>
          <input type="radio" id="3-stars" name="rating" value="3" disabled="disabled"/>
          <label for="3-stars" class="star">&#9733;</label>
          <input type="radio" id="2-stars" name="rating" value="2" disabled="disabled"/>
          <label for="2-stars" class="star">&#9733;</label>
          <input type="radio" id="1-star" name="rating" value="1" disabled="disabled"/>
          <label for="1-star" class="star">&#9733;</label>
        </div>
        <hr>
      </div>
      <div class="review_title">
        <p>리뷰</p>
        <div class="write_title">
          <input type="text" name="wr_title" id="wr_title" class="wr_title"
          value="${ rv.rv_title }"
          onFocus="a(this);" disabled="disabled">
        </div>
		
		<c:if test="${ rv.rv_img ne 'no_file' }">
        <ul class="hoverbox">
        <li>
        <a href="#"><img src="/loc_img/reviews/${rv.rv_img}" alt="description" /><img src="/loc_img/reviews/${rv.rv_img}" alt="description" class="preview" /></a>
        </li>
        </ul>
        </c:if>
      </div>

      <div class="input_write">
        <textarea class="input_review" style="resize: none;" disabled="disabled">${ rv.rv_content }</textarea>
      </div>
      <div class="final_btn">
      <c:if test="${user.user_idx == rv.user_idx }">
        <button type="button" class="send-btn send" onclick="del(${rv.rv_idx});">삭제</button>
      </c:if>
        <button type="button" class="send-btn cancel" onclick="self.close();">닫기</button>
      </div>
      
      <script>
      	
      function del(rv_idx) {
    	  
    	  if(!confirm("삭제 이후 리뷰를 다시 등록하실 수 없습니다. 삭제하시겠습니까?")){
    		  return false;
    	  }
    	  
		location.href = "delReview.do?rv_idx="+rv_idx;
	}
      	
      </script>
      
  </body>
</html>