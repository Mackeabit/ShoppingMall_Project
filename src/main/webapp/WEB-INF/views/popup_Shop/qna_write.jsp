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
    <link href="resources/popup/qna_write.css?after" rel="stylesheet">
    	<!-- 제이쿼리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
    	button:hover{
    		cursor: pointer;
    	}
    	.prd_option{
    		display: inline;
    	}
    </style>

  </head>
  <body>
    <div class="popup_container">
      <div class="main_caption">
        <h1 class="main_title">상품 문의하기</h1>
      </div>
      <div class="main_product_name">
        <img src="/loc_img/${pdList[0].pd_img1}" alt="">
        <ul class="product_info">
          <li class="prd_name">${pdList[0].pd_nm}</li>
          <li class="prd_option">Size : 
			<select id="pd_size" onchange="selectidx(this.value);">
				<option value="사이즈">사이즈를 선택해주세요.</option>
				<c:forEach var="pd" items="${ pdList }">
				<option value="${ pd.pd_idx }">${ pd.pd_size }</option>
				</c:forEach>
			</select>
          </li>
        </ul>
      </div>
      <form>
      <div class="review_title">
        <p>문의 작성</p>
      <div class="input_title">
        <input type="text" id="qna_title" name="qna_title" class="input_tit" autocomplete="off" placeholder="제목을 입력해주세요">
        <input id="secret_ck" type='checkbox' id='checkbox-btn-2'/>
        <span class="input-label radio-label" style="color: rgb(102, 102, 102);">비공개</span>
      </div>
      <div class="input_write">
        <textarea class="input_review" id="qna_content" name="qna_content" style="resize: none;"></textarea>
      </div>
		<input type="hidden" id="pd_idx" name="pd_idx">
		<input type="hidden" id="qna_secret" name="qna_secret">
      <div class="final_btn">
        <button type="button" class="send-btn send" onclick="send(this.form);">등록</button>
        <button type="button" class="send-btn cancel" onclick="self.close();">닫기</button>
      </div>
      </form>
      
      
    <script type="text/javascript">
    
    let secret = false;
    let selval = -1;
    let idx = -1;
    let qna_title = '';
    let qna_content = '';
    
    
    $("#secret_ck").click(function() {
    	secret = !secret;
    	if(secret){
    		$("#qna_secret").val(-1);
    	}else{
    		$("#qna_secret").val(0);
    	}
	});
    
      function a(y){
        if (y.defaultValue==y.value) {y.value = ""; } }
      
      function selectidx(value) {
    	  selval = value;
    	  $("#pd_idx").val(value);
		
		}//selectidx
      
	function send(f) {
		
		qna_title = $("#qna_title").val();	
		qna_content = $("#qna_content").val();	
		
    	if(secret){
    		$("#qna_secret").val(-1);
    	}else{
    		$("#qna_secret").val(0);
    	}
		
		if(selval == -1){
			alert("사이즈를 선택해주세요.");
			return false;
		}	
		
		if( qna_title == ''){
			alert("제목을 입력해주세요.");
			return false;
		}
		if( qna_content == ''){
			alert("내용을 입력해주세요.");
			return false;
		}
		
		f.action = "uploadQna.do";
		f.submit();
		
	}
		
    </script>
  </body>
</html>