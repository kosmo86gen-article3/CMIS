<%-- 
<div>
	<div class="comment-txt">
		<textarea id="cmtCnt" name="cmtCnt' placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
	</div>
	<div class="comment-button">
		<button id="cmtCnt-btn">댓글달기</button>
	</div>
</div>


<script>
$("#cmtCnt-btn").click(function(){
	<%
		if (id==null){
	%>
	alert("로그인이 필요합니다.");
	location.href='{url}.do';
	<%
		}else {
	%>
	$.ajax({
		url: "",
		type: "POST",
		data: {
			num : '<%=vo.getB_sq()%>',
			content : $("#cmtCnt").val()
		},
		success: function() {
			console.log("보내기 성공");
			location.reload()
		},
	})
	<%	} %>
})

</script> --%>