<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 찾기 결과</title>
</head>
<body>
	<div id="root">
		<!-- S: Index(Home).jsp 의 div 총괄 시작 -->
		<!-- S: 헤더 부분 시작 -->
		<header id="header">
			<div id="header_box">
				<jsp:include page="/WEB-INF/views/include/header.jsp" />
			</div>
		</header>
		<!-- E: 헤더 부분 끝 -->


		<!-- S: 본문 영역 시작 -->

		<div class="container">
			<h1 class="display-1" style="text-align: center;">아이디 찾기</h1>
			<hr>
			<div class="row">
				<div class="col-sm"></div> <!-- Left col-sm -->
				<div class="col-sm"> <!-- center col-sm -->
					<p style="text-align : center;">
					고객님 아이디 찾기가 완료 되었습니다.
					</p>
					<br>
					<div id='idForm'>
					<!-- 아이디 찾기 결과 Form -->
						<form>
							<table class="table table-borderless">
								<tbody>
									<tr>
										<th scope="row">아이디</th>
										<td><input type="text" id="member_name" name="member_name"readonly class="form-control-plaintext"
										value="${findId.user_id}">
											<hr></td>

									</tr>

								</tbody>
							</table>
							<a href="loginPage.do"><input type="button" id="loginMoving" class="btn btn-dark" 
							style="margin:10px; width:-webkit-fill-available; padding:18px 38px;" value="로그인 하기"></a>
							<a href="findPassword.do"><input type="button" id="loginMoving" class="btn btn-dark" 
							style="margin:10px; width:-webkit-fill-available; padding:18px 38px;" value="비밀번호 찾기"></a>
						</form>
					</div>
				</div>
				<div class="col-sm"></div> <!-- Right col-sm -->

			</div>
		</div>
	</div>
	<!-- E: 본문 영역 끝 -->


	<!-- S: 푸터 영역 시작 -->
	<footer id="footer">
		<div id="footer_box">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
	</footer>

	<!-- E: Index(Home).jsp 의 div 총괄 끝  -->
</body>
</html>