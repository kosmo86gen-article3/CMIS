
$(function(){

	
// 댓글목록 출력하기
replyList()	
function replyList(){
	$.ajax({
		type : 'get',
		url : '../replies',
		dataType : 'json',  // 받는 데이타 형식
		success : function(result){
			//화면에 출력
			var replyList = $('#replyList'); // table tag
			replyList.empty();
			
			for(row of result){
				var tr = $('<tr/>');
				var rno = $('<td/>').html(row['rno']) // <td> 9 </td>
				var replyer = $('<td/>').html(row['replyer'])
				var reply = $('<td/>').html(row['reply'])
			
				
				tr.append(rno);
				tr.append(replyer);
				tr.append(reply);
				
				// 수정과 삭제 버튼 추가하기
				tr.append('<td><button id="modify" class="modify">수정</button></td>')
				tr.append('<td><button id="delete" class="delete">삭제</button></td>')
				replyList.append(tr)
			}
		},
		error : function(err){
			alert('에러')
			console.log(err)
		}
	})
}	


// 수정, 삭제 버튼이 눌렸을 때 (** 동적으로 생성된 객체 )
$('#replyList').on('click', 'button', function(){
	var btn = $(this);
	//var rno = btn.parent().parent().children('td:first').text();
	var rno = $(this).parent(0).siblings().prev("td:first").text();

	//alert(rno);
	
	if( btn.text() == '수정'){
		replyModifyForm();
	}else if( btn.text() == '삭제'){
		replyDelete()
	}else if( btn.text().trim() == '수정하기'){
		replyModify()
	}
	
	// '수정하기' 버튼이 눌렸을 때
	function replyModify(){
		var replyer = btn.parents('tr').children().eq(1).text();
		var reply = btn.parents('tr').find('input').eq(0).val();
		
		var params = { rno : rno, 
				replyer : replyer,
				reply : reply }
		
		$.ajax({
			type : 'put',
			url : '../replies/' + rno,
			data : JSON.stringify(params),
			contentType : 'application/json; charset=utf-8',
			success : function(result){
				replyList();
			},
			error : function(err){
				alert('error')
				console.log(err)
			}
		})
		
	}
	
	
	// '수정'버튼 눌렸을 때 수정모드로 변경
	function replyModifyForm(){
		var replytd = btn.parents('tr').children().eq(2);
		var replytdText = replytd.text();
		//alert(replytdText)
		replytd.text('')
		replytd.append('<input type="text" name="mod_reply" value="' + 
				replytdText +'">')
		
		btn.text('수정하기') // '수정'이라는 버튼을 클릭하면 '수정하기' 변경
	}
	
	function replyDelete(){
		$.ajax({
			type : 'delete',
			url :  '../replies/' + rno,
			success : function(result){
				replyList();
			},
			error : function(err){
				alert('error')
			}
		})
	}
}) // end of on()




// 댓글추가 버튼이 눌렸을 때
$('#replyConfirm').click(function(){
	//alert('클릭')
	var param = $('#replyFrm').serialize()
	
	$.ajax({
		type : 'post',
		/*data : { reply : $('#reply').val(),
			replyer : $('#replyer').val(),
			bno : $('#bno').val()
		},*/
		data : param,
		url : '../replies/new',
		success : function(result){
			alert(result)
			$('#reply').val('')
			replyList(); // 댓글목록보기
		},
		error : function(err){
			alert('error')
			console.log(err)
		}
	})
})	



});