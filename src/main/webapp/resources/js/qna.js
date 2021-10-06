$(document).ready(function(){
   
   // 수정 완료 버튼 숨기기
   $('.updateQna').hide();
   $('.updateQnaCancel').hide();
   $('.replyArea').hide();
   
   // 수정 버튼 클릭시
   $('.modifyQna').click(function() {
      // QNA 내용을 수정할수 있도록 textarea로 변경
      $(this).parent().parent().parent().children('.comment-text').contents().unwrap().wrap( '<textarea class="comment-text" id="comment-text" style="width: 100%;"></textarea>' );
      // 수정 버튼 숨김
      $(this).hide();
      // 수정 완료 버튼 보이기
      $(this).parent().children('.updateQna').show();
      $(this).parent().children('.updateQnaCancel').show();
      
   });
   
   // 수정 완료 버튼 클릭시
   $('.updateQna').click(function() {
      
      // 글번호
      var qnaNum = $(this).parent().parent().parent().children('.qnaNum').val();
      // 회원 아이디
      var userId = $(this).parent().parent().parent().children('.comment-writer').text();
      // 글 내용
      var qnaBoardContent = $(this).parent().parent().parent().children('#comment-text').val();
      
      // ajax 호출
       $.ajax({
          type : "post",
          url : "update_qna.do",
          contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
          // json 구조로 데이터 전송
          data : { "qna_board_num": qnaNum, "user_id" : userId, "qna_board_content" : qnaBoardContent},
          success:function(data){
             // 함수 성공시 페이지 리로딩
//             alert(data.result);
             location.reload()

          },error:function(request,status,error){
             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
       });
   })
   
   // 수정 취소 버튼 클릭시
   $('.updateQnaCancel').click(function() {
      // QNA 내용을 수정할수 있도록 textarea로 변경
      $(this).parent().parent().parent().children('.comment-text').contents().unwrap().wrap( '<p class="comment-text" id="comment-text" style="width: 100%;"></p>' );
      // 수정완료 / 수정취소 버튼 숨김
      $(this).hide();
      $(this).parent().children('.updateQna').hide();
      // 수정 버튼 보이기
      $(this).parent().children('.modifyQna').show();
   })

   
   // 삭제 버튼 클릭시
   $('.deleteQna').click(function() {
	   if (confirm("글을 삭제하시겠습니까?") == true){
	   	  // 글번호
	      var qnaNum = $(this).parent().parent().parent().children('.qnaNum').val();
	      // 회원 아이디
	      var userId = $(this).parent().parent().parent().children('.comment-writer').text();

	      alert(qnaNum)
		  alert(userId)
	      
	      // ajax 호출
	       $.ajax({
	          type : "post",
	          url : "delete_qna.do",
	          contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
	          // json 구조로 데이터 전송
	          data : { "user_id" : userId, "qna_board_num" : qnaNum},
	          success:function(){
	             // 함수 성공시 페이지 리로딩
//	             alert(data.result);
	             location.reload()

	          },error:function(request,status,error){
	             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          }
	       });
	   }
   });
   
   $('.replyQna').click(function(){
		$(this).parent().next().toggle();
	})

	// 댓글 등록 버튼
	$('.replyQnaSubmit').click(function(){
		
		var reply_writer = $(this).parent().parent().children().first().children('.reply_writer').val();
		
		var reply_content = $(this).parent().parent().children(2).children('.reply_content').val();
		
		var reply_board_num = $(this).parent().parent().parent().parent().children('.qnaNum').val();
				
		if(reply_writer == null || reply_writer == ''){
			alert("로그인이 필요합니다")
		}else{
			
			data = { "reply_user_id" : reply_writer, "qna_board_num" : reply_board_num, "qna_reply_content" : reply_content}
			
			 // ajax 호출
		       $.ajax({
		          type : "post",
		          url : "insert_qna_reply.do",
		          contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
		          // json 구조로 데이터 전송
		          data : data,
		          success:function(){
		             // 함수 성공시 페이지 리로딩
//		             alert(data.result);
		             location.reload()

		          },error:function(request,status,error){
		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		          }
		       });
			
		}
	})
   
});