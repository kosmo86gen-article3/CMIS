<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
<title>로그인 페이지</title>

<style>
body{
  margin:0;
  color:#6a6f8c;
  background:#c8c8c8;
  font:600 16px/18px 'Open Sans',sans-serif;
}
*,:after,:before{box-sizing:border-box}
.clearfix:after,.clearfix:before{content:'';display:table}
.clearfix:after{clear:both;display:block}
a{color:inherit;text-decoration:none}

.login-wrap{
  width:100%;
  margin:auto;
  max-width:525px;
  min-height:790px;
  position:relative;
  background:url(https://raw.githubusercontent.com/khadkamhn/day-01-login-form/master/img/bg.jpg) no-repeat center;
  box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
}
.login-html{
  width:100%;
  height:100%;
  position:absolute;
  padding:30px 70px 50px 70px;
  background:rgba(40,57,101,.9);
}
.login-html .sign-in-htm,
.login-html .sign-up-htm{
  top:0;
  left:0;
  right:0;
  bottom:0;
  position:absolute;
  transform:rotateY(180deg);
  backface-visibility:hidden;
  transition:all .4s linear;
}
.login-html .sign-in,
.login-html .sign-up,
.login-form .group .check{
  display:none;
}
.login-html .tab,
.login-form .group .label,
.login-form .group .button{
  text-transform:uppercase;
}
.login-html .tab{
  font-size:22px;
  margin-right:15px;
  padding-bottom:5px;
  margin:0 15px 10px 0;
  display:inline-block;
  border-bottom:2px solid transparent;
}
.login-html .sign-in:checked + .tab,
.login-html .sign-up:checked + .tab{
  color:#fff;
  border-color:#1161ee;
}
.login-form{
  min-height:345px;
  position:relative;
  perspective:1000px;
  transform-style:preserve-3d;
}
.login-form .group{
  margin-bottom:15px;
}
.login-form .group .label,
.login-form .group .input,
.login-form .group .button{
  width:100%;
  color:#fff;
  display:block;
}
.login-form .group .input,
.login-form .group .button{
  border:none;
  padding:15px 20px;
  border-radius:25px;
  background:rgba(255,255,255,.1);
}
.login-form .group input[data-type="password"]{
  text-security:circle;
  -webkit-text-security:circle;
}
.login-form .group .label{
  color:#aaa;
  font-size:12px;
}
.login-form .group .button{
  background:#1161ee;
}
.login-form .group label .icon{
  width:15px;
  height:15px;
  border-radius:2px;
  position:relative;
  display:inline-block;
  background:rgba(255,255,255,.1);
}
.login-form .group label .icon:before,
.login-form .group label .icon:after{
  content:'';
  width:10px;
  height:2px;
  background:#fff;
  position:absolute;
  transition:all .2s ease-in-out 0s;
}
.login-form .group label .icon:before{
  left:3px;
  width:5px;
  bottom:6px;
  transform:scale(0) rotate(0);
}
.login-form .group label .icon:after{
  top:6px;
  right:0;
  transform:scale(0) rotate(0);
}
.login-form .group .check:checked + label{
  color:#fff;
}
.login-form .group .check:checked + label .icon{
  background:#1161ee;
}
.login-form .group .check:checked + label .icon:before{
  transform:scale(1) rotate(45deg);
}
.login-form .group .check:checked + label .icon:after{
  transform:scale(1) rotate(-45deg);
}
.login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
  transform:rotate(0);
}
.login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
  transform:rotate(0);
}

.hr{
  height:2px;
  margin:60px 0 50px 0;
  background:rgba(255,255,255,.2);
}
.foot-lnk{
  text-align:center;
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
		<section id="container">
			<div id="container_box">
				<main>
					<!--? Hero Area Start-->
					<div class="slider-area hero-bg1 hero-overly">
						<div class="single-slider hero-overly  slider-height1 d-flex align-items-center">
							<div class="login-wrap">
								<div class="login-html">
									<input id="tab-1" type="radio" name="tab" class="sign-in" checked>
									<label for="tab-1" class="tab">Sign In</label>
									<input id="tab-2" type="radio" name="tab" class="sign-up">
									<label for="tab-2" class="tab">Sign Up</label>
									<div class="login-form">
										<form action="login.do" method="post">
											<div class="sign-in-htm">
												<div class="group">
													<label for="user_id1" class="label">Userid</label> <input
														id="user_id1" name="user_id" type="text" class="input"
														required="required">
												</div>
												<div class="group">
													<label for="member_pw1" class="label">Password</label> <input
														id="member_pw1" name="member_pw" type="password"
														class="input" data-type="password" required="required">
												</div>
												<div class="group">
													<input id="check" type="checkbox" class="check" checked>
													<label for="check"><span class="icon"></span> Keep
														me Signed in</label>
													<!-- 로그인 정보 저장 또는 자동 로그인 기능. 추가해야함 -->
												</div>
												<div class="group">
													<input type="submit" class="button" value="Sign In">
												</div>
												<div class="hr"></div>
												<div class="foot-lnk">
													<a href="#forgot">Forgot Password?</a>
													<!-- 비밀번호 찾기 기능. 추가해야함 -->
												</div>
											</div>
										</form>
										<form onsubmit="return validate();" name="join" action="signUpDo.do" method="post">
											<div class="sign-up-htm">
												<div class="group">
													<label for="member_name" class="label">Username</label> <input
														id="member_name" name="member_name" type="text"
														class="input" required="required" maxlength="20">
												</div>
												<div class="group">
													<label for="user_id" class="label">Userid</label> <input
														id="user_id" name="user_id" type="text" class="input" required="required" maxlength="12">
													<div class='valid'>아이디를 입력하세요<br/> (영문 대소문자, 숫자만 입력 가능)</div>
													<span id="msg1" class="msg1"></span>
												</div>
												<div class="group">
													<label for="member_pw" class="label">Password</label> <input
														id="member_pw" name="member_pw" type="password"
														class="input" data-type="password" required="required" maxlength="12">
													<div class="valid">비밀번호를 입력하세요<br/> (영문 대소문자, 숫자만 입력 가능)</div>
												</div>
												<div class="group">
													<label for="member_pw2" class="label">Password Check</label>
													<input id="member_pw2" name="member_pw2" type="password"
														class="input" data-type="password" required="required" maxlength="12">
													<div class="valid">비밀번호를 다시 입력하세요</div>
												</div>
												<div class="group">
													<label for="member_phone" class="label">Userphone</label>
													<input id="member_phone" name="member_phone" type="text" class="input" required="required" maxlength="11">
													<div class="valid">핸드폰 번호를 입력하세요 (숫자만)</div>
												</div>
												<div class="group">
													<input type="submit" class="button" value="Sign Up" id="submitButton"
														style="cursor: pointer">
												</div>
											</div>
										</form>
										<div class="hr"></div>
										<div class="foot-lnk"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
			</main>
			
			<script type="text/javascript">
			$(function(){
				$('#user_id').blur(getIdCheck);
				/* $('#user_id').blur(function(){
					alert($('#user_id').val());
				}); */
				
				function getIdCheck() {
		               $.ajax({
		                  url:"idCheck.do", 
		                  type:"post", 
		                  contentType:"application/x-www-form-urlencoded;charset=UTF-8",
		                  data:{user_id:$('#user_id').val()}, 
		                  success:function(result){
		                     $('#msg1').html(result);
		                     $('#msg1').css('display','block');
		                     
		                     if(result == "이미 사용중인 아이디입니다") {
		                        $('#submitButton').attr('disabled', true);
		                       	$('#submitButton').click(function(){
		                       		alert("아이디 중복을 확인 해주세요.");
		                       });
		                       	
		                     } else if(result == "사용가능한 아이디입니다") {
		                        $('#submitButton').removeAttr('disabled');
		                       
		                     }
		                  }
		               })
		            }
				
			});
				function validate() {
					var idPassExp = /^[a-zA-Z0-9]{5,12}$/; // 아이디,비밀번호 유효성 검사식
					var nameExp = /^[가-힣|a-z|A-Z]{3,20}$/; // 이름 유효성 검사식
					var phoneExp = /^[0-9]{11,11}$/g; // 휴대폰 유효성 검사식
					
					var name = document.getElementById("member_name");
			        var id = document.getElementById("user_id");
			        var pw = document.getElementById("member_pw");
			        var pw2 = document.getElementById("member_pw2");
			        var phone = document.getElementById("member_phone");
			        
			    	// 이름 유효성 검사
			        if(nameExp.test(name.value) == false){
			         alert("이름은 한글 또는 영문자만 입력해주세요");
			         return false;
			        } 
			    	
			        // 아이디 유효성 검사
			        if (!check(idPassExp, id, "아이디는 5~12자의 영문 대소문자와 숫자로만 입력해주세요")) {
			            return false;
			        }
			 
			        // 비밀번호 유효성 검사
			        if (!check(idPassExp, pw, "패스워드는 5~12자의 영문 대소문자와 숫자로만 입력해주세요")) {
			            return false;
			        }
			 
			        // 비밀번호 확인 유효성 검사
			        if (join.member_pw.value != join.member_pw2.value) {
			            alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
			            join.member_pw2.focus();
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
			<!--Hero Area End-->
	</div>
	</section>
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