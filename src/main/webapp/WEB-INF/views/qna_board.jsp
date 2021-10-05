<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 




<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Index 홈페이지</title>
</head>

<c:if test="${sessionScope.user_id != null }">

</c:if>


<body>
	<div id="root">
		<!-- S: Index(Home).jsp 의 div 총괄 시작 -->
		<!-- S: 헤더 부분 시작 -->
		<header id="header">
			<div id="header_box">
				<jsp:include page="/WEB-INF/views/include/header.jsp" />
			</div>
			<link rel="stylesheet" href="./resources/css/qna_frequently.css">
			<link rel="stylesheet" href="./resources/css/qna_comment.css">
			​
			<script src="./resources/js/qna_frequently.js"></script>
			<script src="./resources/js/qna_comment.js"></script>
			<script src="./resources/js/qna.js"></script>
		</header>
		<!-- E: 헤더 부분 끝 -->


		<!-- S: 본문 영역 시작 -->
		<main>
			<!--? Hero Area Start-->
			<!-- <div class="slider-area hero-bg1 hero-overly">
            <div class="single-slider hero-overly  slider-height1 d-flex align-items-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10 col-lg-10">
                            Hero Caption
                            <div class="hero__caption pt-100">
                                <h1>view단 InDEX</h1>
                                <p>Let's uncover the best places to eat, drink, and shop nearest to you.</p>
                            </div>
                            Hero form
                            <form action="#" class="search-box mb-100">
                                <div class="input-form">
                                    <input type="text" placeholder="What are you finding?">
                                </div>
                                <div class="select-form">
                                    <div class="select-itms">
                                        <select name="select" id="select1">
                                            <option value="">In where?</option>
                                            <option value="">Catagories One</option>
                                            <option value="">Catagories Two</option>
                                            <option value="">Catagories Three</option>
                                            <option value="">Catagories Four</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="search-form">
                                    <a href="#"><i class="ti-search"></i> Search</a>
                                </div>	
                            </form>	
                            hero category1 img
                            <div class="category-img text-center">
                                <a href="listing.html"> <img src="resources/img/gallery/hero_category1.png" alt=""></a>
                                <a href="listing.html"> <img src="resources/img/gallery/hero_category2.png" alt=""></a>
                                <a href="listing.html"> <img src="resources/img/gallery/hero_category3.png" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
			<!--Hero Area End-->








			<!--? Popular Locations Start 01-->
			<div class="popular-location border-bottom section-padding40">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<!-- Section Tittle -->
							<div class="section-tittle text-center mb-80">
								<h2>Q & A</h2>
								<p>Let's uncover the best places to eat, drink, and shop
									nearest to you.</p>
							</div>
						</div>
					</div>
					<div class="row">


						<!-- 1번째  S -->


						<div class="custom_page_123"></div>
						<div class="col col2" id="col2" style="">
							<div id="boxholder_1" class="section-tittle text-center mb-80">
								<h2>자주 묻는 질문</h2>
								<div class="box_content">
									<p>자주 묻는 질문</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>


							<div id="boxholder_2" class="box cpbox text">
								<h2>Why am I asking such a strange question?</h2>
								<div class="box_content">
									<p>Felis ultrices ac erat duis diam vestibulum scelerisque
										nisi condimentum praesent mus torquent suspendisse ullamcorper
										mi nam diam consectetur mi fusce adipiscing ad platea.Faucibus
										natoque quisque facilisi justo vestibulum dolor ullamcorper
										hac parturient risus nunc eu ad taciti phasellus a vestibulum
										malesuada at et parturient.A duis aliquet conubia vitae semper
										ut scelerisque a semper adipiscing vestibulum id nullam
										condimentum suspendisse phasellus vestibulum proin vivamus
										scelerisque.Augue est.</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>

							<div id="boxholder_2" class="box cpbox text">
								<h2>Why am I asking such a strange question?</h2>
								<div class="box_content">
									<p>Felis ultrices ac erat duis diam vestibulum scelerisque
										nisi condimentum praesent mus torquent suspendisse ullamcorper
										mi nam diam consectetur mi fusce adipiscing ad platea.Faucibus
										natoque quisque facilisi justo vestibulum dolor ullamcorper
										hac parturient risus nunc eu ad taciti phasellus a vestibulum
										malesuada at et parturient.A duis aliquet conubia vitae semper
										ut scelerisque a semper adipiscing vestibulum id nullam
										condimentum suspendisse phasellus vestibulum proin vivamus
										scelerisque.Augue est.</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>

							<div id="boxholder_2" class="box cpbox text">
								<h2>Why am I asking such a strange question?</h2>
								<div class="box_content">
									<p>Felis ultrices ac erat duis diam vestibulum scelerisque
										nisi condimentum praesent mus torquent suspendisse ullamcorper
										mi nam diam consectetur mi fusce adipiscing ad platea.Faucibus
										natoque quisque facilisi justo vestibulum dolor ullamcorper
										hac parturient risus nunc eu ad taciti phasellus a vestibulum
										malesuada at et parturient.A duis aliquet conubia vitae semper
										ut scelerisque a semper adipiscing vestibulum id nullam
										condimentum suspendisse phasellus vestibulum proin vivamus
										scelerisque.Augue est.</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>

							<div id="boxholder_2" class="box cpbox text">
								<h2>Why am I asking such a strange question?</h2>
								<div class="box_content">
									<p>Felis ultrices ac erat duis diam vestibulum scelerisque
										nisi condimentum praesent mus torquent suspendisse ullamcorper
										mi nam diam consectetur mi fusce adipiscing ad platea.Faucibus
										natoque quisque facilisi justo vestibulum dolor ullamcorper
										hac parturient risus nunc eu ad taciti phasellus a vestibulum
										malesuada at et parturient.A duis aliquet conubia vitae semper
										ut scelerisque a semper adipiscing vestibulum id nullam
										condimentum suspendisse phasellus vestibulum proin vivamus
										scelerisque.Augue est.</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>

							<div id="boxholder_2" class="box cpbox text">
								<h2>Why am I asking such a strange question?</h2>
								<div class="box_content">
									<p>Felis ultrices ac erat duis diam vestibulum scelerisque
										nisi condimentum praesent mus torquent suspendisse ullamcorper
										mi nam diam consectetur mi fusce adipiscing ad platea.Faucibus
										natoque quisque facilisi justo vestibulum dolor ullamcorper
										hac parturient risus nunc eu ad taciti phasellus a vestibulum
										malesuada at et parturient.A duis aliquet conubia vitae semper
										ut scelerisque a semper adipiscing vestibulum id nullam
										condimentum suspendisse phasellus vestibulum proin vivamus
										scelerisque.Augue est.</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>

							<div id="boxholder_2" class="box cpbox text">
								<h2>Why am I asking such a strange question?</h2>
								<div class="box_content">
									<p>Felis ultrices ac erat duis diam vestibulum scelerisque
										nisi condimentum praesent mus torquent suspendisse ullamcorper
										mi nam diam consectetur mi fusce adipiscing ad platea.Faucibus
										natoque quisque facilisi justo vestibulum dolor ullamcorper
										hac parturient risus nunc eu ad taciti phasellus a vestibulum
										malesuada at et parturient.A duis aliquet conubia vitae semper
										ut scelerisque a semper adipiscing vestibulum id nullam
										condimentum suspendisse phasellus vestibulum proin vivamus
										scelerisque.Augue est.</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>

							<div id="boxholder_2" class="box cpbox text">
								<h2>Why am I asking such a strange question?</h2>
								<div class="box_content">
									<p>Felis ultrices ac erat duis diam vestibulum scelerisque
										nisi condimentum praesent mus torquent suspendisse ullamcorper
										mi nam diam consectetur mi fusce adipiscing ad platea.Faucibus
										natoque quisque facilisi justo vestibulum dolor ullamcorper
										hac parturient risus nunc eu ad taciti phasellus a vestibulum
										malesuada at et parturient.A duis aliquet conubia vitae semper
										ut scelerisque a semper adipiscing vestibulum id nullam
										condimentum suspendisse phasellus vestibulum proin vivamus
										scelerisque.Augue est.</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>
						</div>


						<!-- 1번째  E -->






					</div>
				</div>
			</div>










			<!--? Popular Locations Start 01-->
			<div class="popular-location border-bottom section-padding40">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<!-- Section Tittle -->
							<div class="section-tittle text-center mb-80">
								<h2>문의 사항</h2>
								<p>자유롭게 문의사항 남겨주세요</p>
							</div>
						</div>
					</div>
					<div class="row">
						<!-- Popular Locations End -->







						<!-- 2번째  S -->

						<div class="comments">
							<div class="comment-wrap">
								<div class="photo">
									<div class="avatar"
										style="background-image: url('https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg')"></div>
								</div>
								<div class="comment-block">
									<form action="insert_qna.do" method="post">
										<textarea name="qna_board_content" id="" cols="150" rows="7"
											style="width: 100%; resize: none; border-color: black; border: solid;"
											placeholder="Add comment..."></textarea>
										<input type="submit" class="btn btn_default btn-lg" value="입력"
											style="float: right;" />
										<c:if test="${sessionScope.userId != null }">
											<input type="hidden" value="${sessionScope.userId}"
												name="user_id" />
										</c:if>
									</form>
								</div>
							</div>

							<c:forEach items="${qnaBoardList }" var="list">
								<div class="comment-wrap" style="padding-bottom: 15px">
									<div class="comment-block" style="width: 50%; resize: none; border-color: black; border: double;">
										<input type="hidden" value="${list.qna_board_num }" class="qnaNum" />
										<p class="comment-writer">${list.user_id }</p>
										<p class="comment-text">${list.qna_board_content }</p>
										<div class="bottom-comment">
										<div class="comment-date">${list.qna_board_date }</div>
											<ul class="comment-actions">

												<c:if test="${sessionScope.userId == list.user_id }">

													<a href="#" onclick="return false;"
														class="modifyQna genric-btn primary radius modify">수정</a>
													<a href="#" onclick="return false;"
														class="updateQna genric-btn primary radius modify">수정완료</a>
													<a href="#" onclick="return false;"
														class="updateQnaCancel genric-btn primary radius modify">수정취소</a>
													<a href="#" onclick="return false;"
														class="deleteQna genric-btn primary radius delete">삭제</a>
												</c:if>

											</ul>
											
											<a href="#" onclick="return false;" class="replyQna genric-btn primary radius modify">댓글(${list.qna_reply_count})</a>
											
											<div class="replyArea" style="margin: 10px auto;">
												<table>
													<tr>
														<td>
															<c:choose>
																<c:when test="${sessionScope.userId != null }">
																	<label for="reply_writer"
																		style="color: black; margin-right: 10px; margin-left: 10px; width: 10%">${sessionScope.userId }</label>
																	<input type="hidden" value="${sessionScope.userId }"
																		class="reply_writer" name="reply_writer" />
																</c:when>
																<c:otherwise>
																	<label for="reply_writer">로그인이 필요합니다</label>
																	<input type="hidden" class="reply_writer" name="reply_writer" value=""/>
																</c:otherwise>
															</c:choose></td>
														<td style="width: 80%;"><input type="text"
															name="reply_content" class="reply_content"
															style="border-color: black; border: solid; width: 100%;">
														</td>
														<td style="width: 10%;"><a href="#"
															onclick="return false;"
															class="replyQnaSubmit genric-btn primary radius modify"
															style="margin-left: 10px; float: rigth;">등록</a></td>
												</table>
											</div>
											<c:if test="${fn:length(list.qnaReplyVO) >= 1}">
											<table>
												<c:forEach items="${list.qnaReplyVO}" var="reply">
													<tr>
														<td>
															<label for="reply_writer">${reply.reply_user_id}</label>
														</td>
														<td>
															<input type="text" value="${reply.qna_reply_content}" style="border-color: black; border: solid; width: 100%;" disabled>
														</td>
													</tr>
												</c:forEach>
											</table>
											</c:if>
										</div>


									</div>

								</div>
							</c:forEach>
							<!-- <div class="comment-wrap">
				<div class="comment-block">
						<p class="comment-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto temporibus iste nostrum dolorem natus recusandae incidunt voluptatum. Eligendi voluptatum ducimus architecto tempore, quaerat explicabo veniam fuga corporis totam.</p>
						<div class="bottom-comment">
								<div class="comment-date">Aug 23, 2014 @ 10:32 AM</div>
								<ul class="comment-actions">
										<li class="complain">Complain</li>
										<li class="reply">Reply</li>
								</ul>
						</div>
				</div>
		</div> -->
						</div>



						<!-- 2번째  E -->

					</div>
				</div>
			</div>
			<!-- Popular Locations End -->














		</main>
	</div>

	<!— E: 본문 영역 끝 —>


	<!— S: 푸터 영역 시작 —>
	<footer id="footer">
		<div id="footer_box">
			<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		</div>
	</footer>
	<!— E: Index(Home).jsp 의 div 총괄 끝  —>
</body>
</html>