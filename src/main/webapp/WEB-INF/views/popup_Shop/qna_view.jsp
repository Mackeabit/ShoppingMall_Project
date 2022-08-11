<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link href="resources/popup/qna_view_edit.css?after" rel="stylesheet">
     <style>
    	button:hover{
    		cursor: pointer;
    	}
    </style>
  </head>
  <body>
    <div class="popup_container">
      <div class="main_caption">
        <h1 class="main_title">${pv.user_nm }</h1>
      </div>
      <div class="main_product_name">
        <img src="/loc_img/${pv.pd_img1}" alt="">
        <ul class="product_info">
          <li class="prd_name">${ pv.pd_nm }</li>
          <li class="prd_option">Size : ${pv.pd_size }</li>
          <li class="prd_option">등록일자 : ${fn:split(pv.qna_date,' ')[0]}</li>
        </ul>
      </div>
      <div class="review_title">
        <p>문의 내용</p>
      <div class="input_write">
        <textarea class="input_review" style="resize: none;" readonly>${pv.qna_content }</textarea>
      </div>

      <div class="final_btn">
      <c:if test="${user.user_idx == pv.user_idx }">
        <button type="button" class="send-btn send" onclick="del(${pv.qna_idx});">삭제</button>
      </c:if>
        <button type="button" class="send-btn cancel" onclick="self.close();">닫기</button>
      </div>
      <c:if test="${ pv.qna_status eq -1 }">
        <details class="reply">
        <!--<button type="button" class="reply_btn" name="button">답변보기</button>-->
        <summary>답변보기</summary>
        <div class="input_reply">
          <textarea class="input_repl" style="resize: none;" readonly>
			${ pv.qna_res }
          </textarea>
        </div>
      </details>
      </c:if>
    <script type="text/javascript">
    
    function del(qna_idx) {
  	  
  	  if(!confirm("삭제하시겠습니까?")){
  		  return false;
  	  }
  	  
		location.href = "delQna.do?qna_idx="+qna_idx;
	}
    
      function a(y){
        if (y.defaultValue==y.value) {y.value = ""; } }
    </script>
  </body>
</html>