<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>이메일 절차</title>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			<h1 class="display-1" style="text-align: center;">이메일 전송 절차</h1>
			<hr>
			<div class="row">
				<div class="col-sm"></div> <!-- Left col-sm -->
				<div class="col-sm"> <!-- center col-sm -->
					<p style="text-align : center;">
					이메일 전송 절차입니다.
					</p>
					<br>
					<div id='idForm'>
					<!-- 비밀번호  찾기 결과 이메일 Form -->
						<form>
							<table class="table table-borderless">
								<tbody>
									<tr>
										<th scope="row">이메일</th>
										<td><input type="text" id="member_email" name="member_email" readonly class="form-control-plaintext"
										value="${findEmail.member_email}">
											<hr></td>
										
										<td>
												<div class="mail_check_button">
													<span style="border:solid">임시 비밀번호 전송</span>
												</div>
										</td>
									</tr>

								</tbody>
							</table>
							<a href="loginPage.do"><input type="button" id="loginMoving" class="btn btn-dark" 
							style="margin:10px; width:-webkit-fill-available; padding:18px 38px;" value="로그인 하기"></a>
						</form>
					</div>
				</div>
				<div class="col-sm"></div> <!-- Right col-sm -->

			</div>
		</div>
	</div>
	
	<script>
			var code =""; //이메일전송 인증번호 저장을 위한 코드
			
			/* 인증번호 이메일 전송 */
			$(".mail_check_button").click(function(){
			    var email = $("#member_email").val();		//입력한 이메일
			    alert("이메일이 전송 되었습니다 로그인 해주세요 :)")
			    $.ajax({
			    	
			        type:"GET",
			        url:"mailCheckPw.do?member_email=" + email,
			        success:function(data){
			        	//console.log("data : " +data);
			        	
			        	checkBox.attr("disabled",false);
			        	boxWrap.attr("id", "mail_check_input_box_true");
			        	code = data;
			        }
			    });
			    
			});
			</script>
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