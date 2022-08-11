<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${ empty user }">
	<script>
		alert("로그인 후 이용해주세요.");
		self.close();
	</script>
</c:if>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link href="resources/popup/review_write.css?after" rel="stylesheet">
    	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
    	button:hover{
    		cursor: pointer;
    	}
    	.prd_option{
    		display: inline;
    	}
    	#od_date{
    		display: block;
    	}
    	
    	#photo_input{
    		visibility: hidden;
    	}
    </style>
    
  </head>
  <body>
    <div class="popup_container">
      <div class="main_caption">
        <h1 class="main_title">상품 리뷰 작성</h1>
      </div>
      <div class="main_product_name">
        <img src="/loc_img/${viewList[0].pd_img1}" alt="">
        <ul class="product_info">
          <li class="prd_name">${ viewList[0].pd_nm }</li>
          <c:if test="${fn:length(viewList) > 1  }">
          <c:if test="${viewList[0].pd_size != viewList[1].pd_size}">
          	<li class="prd_option">Size : 
				<select id="pd_size" onchange="selectidx(this.value);">
					<option value="사이즈를 선택해주세요.">사이즈를 선택해주세요.</option>
					<c:forEach var="ov" items="${ viewList }">
					<option value="${ ov.pd_idx },${ ov.od_idx }">${ ov.pd_size }</option>
					</c:forEach>
				</select>
          	</li>
          </c:if>
		  <c:if test="${viewList[0].pd_size == viewList[1].pd_size}">
          <li class="prd_option">Date : ${ viewList[0].od_date }</li>
          <input type="hidden" value="${ viewList[0].pd_nm }">
          </c:if>
          </c:if>
          <c:if test="${fn:length(viewList) < 2  }">
	          <li class="prd_option">Size : ${ viewList[0].pd_size }</li>
          </c:if>
          <!-- 옵션 선택 끝 -->
        </ul>
      </div>
      <div class="star_grade">
        <h2>상품 평점</h2>
        <div class="star-rating">
          <input type="radio" id="5-stars" name="rating" value="5" onclick="star(this.value);"/>
          <label for="5-stars" class="star">&#9733;</label>
          <input type="radio" id="4-stars" name="rating" value="4" onclick="star(this.value);"/>
          <label for="4-stars" class="star">&#9733;</label>
          <input type="radio" id="3-stars" name="rating" value="3" onclick="star(this.value);"/>
          <label for="3-stars" class="star">&#9733;</label>
          <input type="radio" id="2-stars" name="rating" value="2" onclick="star(this.value);"/>
          <label for="2-stars" class="star">&#9733;</label>
          <input type="radio" id="1-star" name="rating" value="1" onclick="star(this.value);"/>
          <label for="1-star" class="star">&#9733;</label>
        </div>
        <p>원하시는 별점을 클릭해 주세요</p>
        <hr>
      </div>
      <form method="POST" enctype="multipart/form-data">
      <div class="review_title">
        <p>리뷰 작성</p>
        <div class="write_title">
          <input type="text" name="rv_title" id="wr_title" autocomplete="off" class="wr_title"
          placeholder="리뷰 제목을 입력해주세요."
          onFocus="a(this);" >
        </div>
      </div>
      <div class="input_write">
        <textarea class="input_review" name="rv_content" style="resize: none;"></textarea>
      </div>
      <div class="photo_uproad_btn">
        <button type="button" class="photo_btn" onclick="upload();">사진업로드하기</button>
      </div>
      <div class="final_btn">
        <button type="button" class="send-btn send" onclick="send(this.form);">등록</button>
        <button type="button" class="send-btn cancel" onclick="self.close();">닫기</button>
      </div>
      
      	<input type="file" id="photo_input" name="photo" accept=".gif, .jpg, .png">
      	<input type="hidden" id="pd_idx" name="pd_idx">
      	<input type="hidden" id="od_idx" name="od_idx">
      	<input type="hidden" id="rv_score" name="rv_score">
      </form>

    <script>
    
    let idx = 0;
    
    	function upload() {
    		document.getElementById("photo_input").click();
		}
    	
    
      function a(y){
        if (y.defaultValue==y.value) {y.value = ""; } }
      
      
      function selectidx(value) {
    	  
    	  idx = value.split(',');
    	  
    	  $("#pd_idx").val(idx[0]);
		  $("#od_idx").val(idx[1]);
		
		}//selectidx
      
		
		
      function star(value) {
    	  $("#rv_score").val(value);
		}
      
      function send(f) {
		
    	  if(${fn:length(viewList) < 2 } || ${viewList[0].pd_size == viewList[1].pd_size}){
    		  $("#pd_idx").val(${viewList[0].pd_idx});
    		  $("#od_idx").val(${viewList[0].od_idx});
    		  idx = -1;
    	  }
    	
    	if(idx == 0){
    		alert("사이즈를 선택해주세요.");
    		return false;
    	}  
    	  
	   	if($("#rv_score").val() == ''){
	   		alert("별점을 입력해주세요");
	   		return false;
	   	}
	   	
		
	   	if(!confirm("리뷰 등록 후엔 환불이 불가능합니다. 리뷰를 등록하시겠습니까?")){
	   		return false;
	   	}
	   	
		f.action = "uploadReview.do";
		f.submit();
	   	
	}
      
      
    </script>
  </body>
</html>