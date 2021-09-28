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

#mail_check_input_box_false{
    background-color:#ebebe4;
}
 
#mail_check_input_box_true{
    background-color:white;
}

.correct{
    color : green;
}
.incorrect{
    color : red;
}

#mail_check_input{
   color:black;
}

span{
   color:white;
}

</style>

<!-- 카카오 로그인 --> 
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>

<script type="text/javascript"> //초기화 시키기. 

$(document).ready(function(){ Kakao.init('8863e3abb3c060c0a88afb8840b2e6f5'); Kakao.isInitialized(); }); 


function loginWithKakao() { Kakao.Auth.authorize({ redirectUri: 'http://localhost:8080/loginpage_kakao_callback' }); }



</script>

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
         <h1 class="display-1" style="text-align: center;">로그인 / 회원가입</h1>
         <hr/>
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
                                       <ul>
                                       
                                       
   <li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <img style="margin-tol:10px" src="resources/img/logo/kakao_login_medium_narrow.png">
      </a>
   </li>
   <li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
   </li>
</ul>

<!-- <!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
//8863e3abb3c060c0a88afb8840b2e6f5
window.Kakao.init('8863e3abb3c060c0a88afb8840b2e6f5'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
             alert(JSON.stringify(response));
             
             //가져온 값들을 변수에 넣는다
             const name = response.properties.nickname;
             const email = response.kakao_account.email;
             alert(name);
             alert(email);
             
             $('#kakaoemail').val(email);
             $('#kakaoname').val(name);
             //가져온 값 들을 해당 ID값에 일치하는 태그에  value 값으로 넣는다.
             document.login_frm.submit();
             console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
           console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>


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
                                          id="user_id" name="user_id" type="text" class="input" required="required" maxlength="12"
                                          placeholder="아이디를 입력하세요">
                                       <div class='valid'></div>
                                       <span id="msg1" class="msg1"></span>
                                    </div>
                                    <div class="group">
                                       <label for="member_email" class="label">Email</label> 
                                       <input id="member_email" name="member_email" type="text" class="input" required="required" maxlength="30">
                                       
                                       <span class="mail_input_box_warn"></span>
                                       
                                       <div class="mail_check_wrap">
                                          <div class="mail_check_input_box" id="mail_check_input_box_false">
                                          
                                             <input id="mail_check_input" class="input" disabled="disabled">
                                          </div>
                                          <div class="mail_check_button">
                                             <span style="border:solid">인증번호 전송</span>
                                          </div>
                                          <div class="clearfix"></div>
                                          <span id="mail_check_input_box_warn"></span>
                                       </div>
                                    </div>
                                    <div class="group">
                                       <label for="member_pw" class="label">Password</label> <input
                                          id="member_pw" name="member_pw" type="password"
                                          class="input" data-type="password" required="required" maxlength="12" placeholder="비밀번호를 입력하세요">
                                       <div class="valid"></div>
                                    </div>
                                    <div class="group">
                                       <label for="member_pw2" class="label">Password Check</label>
                                       <input id="member_pw2" name="member_pw2" type="password"
                                          class="input" data-type="password" required="required" maxlength="12" placeholder="비밀번호를 다시 입력하세요">
                                       <div class="valid"></div>
                                    </div>
                                    <div class="group">
                                       <label for="member_phone" class="label">PhoneNumber</label>
                                       <input id="member_phone" name="member_phone" type="text" class="input" required="required" maxlength="11" placeholder="핸드폰 번호를 입력하세요 ">
                                       <div class="valid"></div>
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
         
         <script>
         
         var code =""; //이메일전송 인증번호 저장을 위한 코드
         
         /* 인증번호 이메일 전송 */
         $(".mail_check_button").click(function(){
             
             var email = $("#member_email").val();      //입력한 이메일
             var checkBox = $('#mail_check_input');       //인증번호 입력한
             var boxWrap = $('.mail_check_input_box');   //인증번호 입력란 박스
             var warnMsg = $(".mail_input_box_warn");    // 이메일 입력 경고글
             
             if(mailFormCheck(email)){
                 warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
                 warnMsg.css("display", "inline-block");
             } else {
                 warnMsg.html("올바르지 못한 이메일 형식입니다.");
                 warnMsg.css("display", "inline-block");
                 return false;
             }
             
             
             $.ajax({
                
                 type:"GET",
                 url:"mailCheck.do?email=" + email,
                 success:function(data){
                    //console.log("data : " +data);
                    
                    checkBox.attr("disabled",false);
                    boxWrap.attr("id", "mail_check_input_box_true");
                    code = data;
                 }
             });
             
         });
         
         /* 인증번호 비교 */
         $("#mail_check_input").blur(function(){
             
            var inputCode = $('#mail_check_input').val(); //입력코드
            var checkResult = $('#mail_check_input_box_warn'); //비교결과
            var emailCheck = $('member_email');
            if(inputCode == code){ //일치할 경우
               checkResult.html("인증번호가 일치합니다.");
               checkResult.attr('class','correct');
               emailCheck.attr('disabled',true);
            }else{               //일치하지 않을 경우
               checkResult.html("인증번호를 다시 확인해주세요.");
               checkResult.attr("class","incorrect");
               emailCheck.attr('disabled',false);
            }
             
         });
         </script>
         
         <script type="text/javascript">
         $(function(){
            $('#user_id').blur(getIdCheck);
            /* $('#user_id').blur(function(){
               alert($('#user_id').val());
            }); */
            
            //아이디 중복 검사
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
               var emailExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
               
               var name = document.getElementById("member_name");
                 var id = document.getElementById("user_id");
                 var pw = document.getElementById("member_pw");
                 var pw2 = document.getElementById("member_pw2");
                 var phone = document.getElementById("member_phone");
                 var email = $("#member_email").val();
                   
                 alert(email);
                   //alert(email.val());
                   
                   //var emailCheck = $('member_email');
                 var warnMsg = $(".mail_input_box_warn"); //이메일 입력 경고글
                 
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

                // 이메일 유효성 검사 실패버전
                 if(emailExp.test(email) == false){
                 alert("email주소를 확인해주세요");
                 return false;
                 
                 }
                alert($('member_email').attr("disabled"));
                //이메일 인증 유효성 검사
                if($('member_email').attr("disabled") == "" || $('member_email').attr("disabled") == false || $('member_email').attr("disabled") == undefined){
                	alert("email인증을 완료해주세요");
                	return false;
                }

                return false;
              } 
         
            
             /* 입력 이메일 형식 유효성 검사 */
             function mailFormCheck(email){
                var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
                return form.test(email);
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