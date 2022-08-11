<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>휴면페이지</title>
      <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
      <link rel="stylesheet" href="resources/dormant/Dormant_account.css">

<style>
	button:hover{
		cursor: pointer;
	}
</style>

   </head>
   <body>
    <div class="dirmant_account">
      <section class="login100-form-logo">
        <img src="https://blog.kakaocdn.net/dn/MCnb9/btrEYgPF9Tt/Co0OP2W2TopKNGhuFsVtN1/img.jpg" alt="">
      </section>
      <form id="rest_frm">
        <input type="hidden" id="user_idx" name="user_idx" value="${ vo.user_idx }">

        <article class="greet">
          <section class="icon">
            <img src="https://blog.kakaocdn.net/dn/bIhaMi/btrFvrwtBCa/8Ugwn8ygBw1cPGUG8CtOGk/img.png" alt="">
          </section>
          <h2 class="userid">${vo.user_nm}</h2><span class="content_after">님</span>
          <section class="guide">
            <p>휴면계정 상태입니다.</p>
            <p>계정을 활성화 해주세요.</p>
          </section>
        </article>


        <button class="btn" id="call" type="button">계정 활성화</button>
      </form>
      <button class="cancel_btn" id="recall" type="button">취소하기</button>
    </div>

   <script>
      $("#call").click(function() {

         let f = $('#rest_frm');
         let formData = f.serialize();


         $.ajax({
            type : "POST",
            url : "/project/user_status_C.do",
            data : formData,
            success: function(data){
               if(data == "Y"){
                  alert("정상적으로 처리되었습니다. 다시 로그인 해주세요.");
                  location.href="/project/login.do";
               }else{
                  alert("정상 처리에 실패하였습니다.");
               }
            },
            error: function(data){
               alert("휴면계정 오류 발생!");
               console.log(data);
            }
         });

      });
      $("#recall").click(function() {

         location.href = "/project/login.do";

      });
   </script>
   </body>
</html>