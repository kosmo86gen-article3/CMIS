<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세2</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	type="text/javascript"></script>
<script src='../resources/js/reply.js' type="text/javascript"></script>
</head>
<body>
	<h1>글 상세</h1>
	<hr>
	<form action="updateBoard.do" method="post">
		<input name="seq" type="hidden" value="${board.seq}" />
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="orange" width="70">제목</td>
				<td align="left"><input name="title" type="text"
					value="${board.title }" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">작성자</td>
				<td align="left">${board.writer }</td>
			</tr>
			<tr>
				<td bgcolor="orange">내용</td>
				<td align="left"><textarea name="content" cols="40" rows="10">
						${board.content }</textarea></td>
			</tr>
			<tr>
				<td bgcolor="orange">등록일</td>
				<td align="left">${board.regDate }</td>
			</tr>
			<tr>
				<td bgcolor="orange">조회수</td>
				<td align="left">${board.cnt }</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="글 수정" /></td>
			</tr>
		</table>
	</form>
	<hr />
	<hr />

	<!-- 댓글 추가 -->
	<form name='replyFrm' id='replyFrm'>
      <input type="hidden" name='bno' id='bno' value='${board.seq }'/>
      <input type='text' name='replyer' id='replyer' value='홍길동'/>
      <input type="text" name="reply" id="reply"/>
      <input type="button" id="replyConfirm" value="댓글추가"/>
      </form>
      
    <!-- 댓글 목록보기 -->
    <table id ='replyList' border='2'/>
    

</body>
</html>
