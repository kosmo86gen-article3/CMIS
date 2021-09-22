<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>CMIS MY PAGE</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<style type="text/css">
@import
	url(https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,800)
	;

body {
	font-size: 16px;
	line-height: 22px;
	color: #555;
	font-family: 'Raleway', sans-serif;
	font-weight: 300;
	text-shadow: rgba(0, 0, 0, .01) 0 0 1px;
}

#myPageAtag {
	color: black;
	font-size: 150%;
	display: flex;
}

#navList {
	margin-bottom: 10px;
	background-color: #050d15;
}
</style>


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
		<section id="section-feature" class="container">
			<div id="container">
				<h1 class="display-1" style="text-align: center;">마이페이지</h1>
				<h2 style="text-align: center;">${sessionScope.memberName}님
					안녕하세요</h2>
				<hr />

				<div class="container" style="margin-top: 30px">
					<div class="row">
						<div class="col-sm-4">
							<h3 style="text-align: center">Menu</h3>
							<ul class="nav nav-pills flex-column">
								<li class="nav-item"><a class="nav-link active"
									id="navList" href="modifyMember.do">회원정보수정</a></li>
								<li class="nav-item"><a class="nav-link active"
									id="navList" href="showBoard.do">등록글 조회</a></li>
								<li class="nav-item"><a class="nav-link active"
									id="navList" href="showReply.do">등록댓글보기</a></li>
								<li class="nav-item"><a class="nav-link active"
									id="navList" href="wishList.do">관심 물품</a></li>
							</ul>
							<hr class="d-sm-none">
						</div>
						<div class="col-sm-8">
							<h2>회원이신 고객님의 개인정보를 관리하는 공간입니다.</h2>

							<hr style="height: 5px;">

							<form onsubmit="return validate();" action="updateMember.do" method="post" name="updateMember">
								<table class="table table-borderless">
									<tbody>
										<tr>
											<th scope="row">아이디</th>
											<td>
											<input type="text" id="user_id" name="user_id" placeholder="아이디"
												onfocus="this.placeholder = ''"
												onblur="this.placeholder = '아이디'" required
												class="single-input" value="${member.user_id }" readonly>
												<hr></td>
												
										</tr>
										
										<tr>
											<th scope="row">비밀번호</th>
											<td><input type="password" id="member_pw" name="member_pw" placeholder="비밀번호"
										onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" required
										class="single-input" >
										<div class="valid">비밀번호를 입력하세요<br/> (영문 대소문자, 숫자만 입력 가능)</div>
										<hr></td>
										</tr>
										<tr>
											<th scope="row">비밀번호 확인</th>
											
											<td colspan="2"><input type="password" id="member_pw1" name="member_pw2" placeholder="비밀번호 확인"
										onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'" required
										class="single-input" >
										<hr></td>
										</tr>
										<tr>
											<th scope="row">이름</th>
											
											<td colspan="2"><input type="text" name="member_name" placeholder="이름"
										onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" required
										class="single-input" value="${member.member_name }" readonly>
									
										<hr>
										</td>
										</tr>
										
										<tr>
											<th scope="row">나이</th>
											<td>
											<input type="text" name="member_age" placeholder="나이"
												onfocus="this.placeholder = '나이'"
												onblur="this.placeholder = '나이'" 
												class="single-input" value="${member.member_age }">
												<hr></td>
												
										</tr>
										
										<tr>
											<th scope="row">휴대폰</th>
											<td><input type="text" id="member_phone" name="member_phone" placeholder="휴대폰"
										onfocus="this.placeholder = ''" onblur="this.placeholder = '휴대폰'" 
										class="single-input" value="${member.member_phone }" >
										<hr></td>
										</tr>
										<tr>
											<th scope="row">주소</th>
											
											<td colspan="2"><input type="text" name="member_address" placeholder="주소"
										onfocus="this.placeholder = ''" onblur="this.placeholder = '주소'"
										class="single-input"  value="${member.member_address}">
										<hr></td>
										</tr>
										
									</tbody>
								</table>
								<input type="submit" class="btn" style="float:right;" value="회원정보수정하기">
							</form>

							<script type="text/javascript">

		function validate() {
			var idPassExp = /^[a-zA-Z0-9]{5,12}$/; // 아이디,비밀번호 유효성 검사식
			var nameExp = /^[가-힣|a-z|A-Z]{3,20}$/; // 이름 유효성 검사식
			var phoneExp = /^[0-9]{11,11}$/g; // 휴대폰 유효성 검사식
			
			var name = document.getElementById("member_name");
	        var id = document.getElementById("user_id");
	        var pw = document.getElementById("member_pw").value;
	        var pw2 = document.getElementById("member_pw1").value;
	        var phone = document.getElementById("member_phone");
	 
	        // 비밀번호 유효성 검사
	        if (!check(idPassExp, pw, "패스워드는 5~12자의 영문 대소문자와 숫자로만 입력해주세요")) {
	            return false;
	        }
	 
	        // 비밀번호 확인 유효성 검사
	        if (pw != pw2) {
	            alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
	            
	            member_pw1.focus();
	            return false;
	        } 
	 
	     	// 휴대폰 유효성 검사
	        if(phoneExp.test(phone.value) == false){
	         alert("휴대폰번호 11자리만 입력해주세요");
	         return false;
	        } 
		}
		
		function check(test1, what, message) {
	        if (test1.test(what.value)) {
	            return true;
	        }
	        alert(message);
	        what.focus();
	    }
</script>
							

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- E :본문 목록  -->

		<!-- E: 본문 영역 끝 -->

		<!-- S: 푸터 영역 시작 -->
		<footer id="footer">
			<div id="footer_box">
				<jsp:include page="/WEB-INF/views/include/footer.jsp" />
			</div>
		</footer>
	</div>
	<!-- E: Index(Home).jsp 의 div 총괄 끝  -->
</body>
</html>