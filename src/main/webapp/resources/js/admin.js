$(document).ready(function(){

	// 자유게시판 글 삭제
	$('.delete-btn').click(function(){
		
		var result = confirm('이 글을 삭제하시겠습니까?');
		
		var board_num = $(this).parent().parent().children(':nth-child(1)').text();
		
		if(result){
			
			// ajax
	        $.ajax({
	          type : "post",
	          url : "adminBoardDelete.do",
	          contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
	          data : {board_num : board_num},
	          success:function(data){
	        	  alert(data);
	        	  location.reload();
	        	  return false;
	          }
	        });
		}
		else{
			return false;
		}
		
	})
	
	// 자유게시판 댓글 삭제
	$('.delete-btn2').click(function(){
		
		var result = confirm('이 댓글을 삭제하시겠습니꽈?');
		
		var board_num = $(this).parent().parent().children(':nth-child(1)').text();
		var comment_num = $(this).parent().parent().children(':nth-child(2)').text();
		var comment_writer = $(this).parent().parent().children(':nth-child(4)').text();
		
		if(result){
			
			// ajax
	        $.ajax({
	          type : "post",
	          url : "adminReplyDelete.do",
	          contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
	          data : {board_num:board_num, comment_num : comment_num, comment_writer:comment_writer},
	          success:function(data){
	        	  alert(data);
	        	  location.reload();
	        	  return false;
	          }
	        });
		}
		else{
			return false;
		}
		
	})
	
	
})

$(window).resize(function() {
	drawChart1();
	drawChart2();
	drawChart3();
	drawChart4();
	drawChart5();
	drawChart6();
	drawChart7();
});
