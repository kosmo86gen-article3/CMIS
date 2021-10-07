<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 




<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="resources/img/favicon.png" type="image/png">
<link rel="icon" href="resources/img/favicon.png" type="image/png">
<title>Q / A</title>
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
								<p>		</p>
							</div>
						</div>
					</div>
					<div class="row">


						<!-- 1번째  S -->


						<div class="custom_page_123"></div>
						<div class="col-lg-12" id="col2" style="">
							<div id="boxholder_1" class="section-tittle text-center mb-80">
								<h2>자주 묻는 질문</h2>
								<div class="box_content">
									<p>   </p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>


							<div id="boxholder_2" class="box cpbox text">
								<h2>상품별 최저가와 매장별 최저가를 따로 나눈 이유가 무엇인가요?</h2>
								<div class="box_content">
								<hr>
									<p> 회원님들마다 원하시는 정보가 각각 다르기 때문에,
										모든 회원님들의 요구사항을 만족시켜드리면서 조작 편의성을 위해
										카테고리를 상품별 최저가와, 매장별 최저가로 따로 나누었습니다.
										
										고객님이 위치한 곳의 매장에 대한 최저가를 알고 싶으신지,
										원하시는 상품의 최저가와 판매 매장을 를 알고 싶으신지를 
										필요에 따라 구분해서 이용해주시면 됩니다.
									</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>

							<div id="boxholder_2" class="box cpbox text">
								<h2>상품 검색에서 이미지 검색을 어떻게 사용해야 하나요?</h2>
								<div class="box_content">
								<hr>
									<p> 일반적인 검색이 아니라 이미지 검색을 원하시는 경우,
										기본적으로 원하시는 상품에 대한 이미지 파일이 준비되어 있어야 합니다.
										파일 선택 버튼을 눌러 해당 이미지 파일을 선택하여주시고,
										오른쪽의 이미지 업로드 버튼을 누르시면 자체적으로 해당 이미지 파일이
										어떤 상품인지 검색을 하고, 해당 삼품에 대한 결과를 보여드립니다.
										네를 누르시면 해당 상품에 대한 상세 페이지로 연결이 되며,
										견적 담기를 누르시면 해당 상품을 회원님의 위치를 기반으로 가장 가까운 5곳의
										매장을 추천해드립니다.
									</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>

							<div id="boxholder_2" class="box cpbox text">
								<h2>뉴스 / Hot Issue 의 업데이트 주기는 어떻게 되나요?</h2>
								<div class="box_content">
								<hr>
									<p> 
										매주 월요일 오전 1시에 일주일 분량의 뉴스가 업데이트됩니다.
									</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>

							<div id="boxholder_2" class="box cpbox text">
								<h2>상품 가격비교는 어떻게 사용하는 건가요?</h2>
								<div class="box_content">
								<hr>
									<p> 상품 가격비교는 회원님이 상품검색을 통해 담으신 상품들 혹은
										상품 가격비교 화면에서 직접 검색하신 상품들을 회원님의 현재 접속 위치를 기반으로
										 5km 범위 안의 매장에서 상품들의 총합 및 각 상품에 대한 가격을 가장 저렴한 순으로 5개를 보여드리립니다.
										 간혹, 검색하신 상품들을 한번에 구매 할 있는 매장이 존재 하지 않는 경우, 담은 상품을 전부 판매하는 매장이 없습니다.라는
										 문구가 화면에 출력됩니다.이러한 경우 목록 비우기를 통해 재검색을 하실 수 있습니다.
									</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>

							<div id="boxholder_2" class="box cpbox text">
								<h2>전국 매장 정보에서 어떤 정보를 얻을 수 있나요?</h2>
								<div class="box_content">
								<hr>
									<p> 전국 매장 정보화면에서는 전국에 있는 매장을 지역별, 업종 형태별로 세분화 해서 조회할 수 있는데,
										지역은 서울을 비롯하여 전국 팔도를. 업종 형태는 대형마트, 백화점, 슈퍼마켓, 전통시장, 편의점. 대표적인 5개 업종으로 구분을 해놓았습니다.
										회원님들은 이를 통하여 알고 싶은 지역, 더나아가 업종 형태를 검색하셔서 상호명 및 위치 정보를 얻으실 수 있으시고, 지도에 해당되는 매장들의 
										위치를 시각적으로 확인하실 수 있습니다. 
									</p>
								</div>
								<div class="clear">
									<!--space-->
								</div>
							</div>

							<div id="boxholder_2" class="box cpbox text">
								<h2>실시간 채팅은 무엇인가요?</h2>
								<div class="box_content">
								<hr>
									<p> 본인만이 알고 있는 정보나 알고 싶은 정보 등을 익명을 통해 실시간으로 다른 접속자와 대화 및 공유 
										하실 수 있는 기능으로서 현재 접속 되어 있는 회원이 존재한다면 시간과 장소에 구애받지 않고 이용 가능합니다. <hr>
										추가) 익명이라고 할지라도 스팸 및 악성 유저라고 판단 될 시에 제재가 들어간다는 점 유의 해주세요.
										
									</p>
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
								<div class="comment-write">
									<form action="insert_qna.do" method="post">
										<textarea name="qna_board_content" id="" cols="150" rows="7"
											style="width: 100%; resize: none;box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.8);"
											placeholder="Add comment..."></textarea>
										<input type="submit" class="btn btn_default btn-lg" value="입력"
											style="float: right; margin: 10px auto;" />
										<c:if test="${sessionScope.userId != null }">
											<input type="hidden" value="${sessionScope.userId}"
												name="user_id" />
										</c:if>
									</form>
								</div>
							</div>

							<c:forEach items="${qnaBoardList }" var="list">
								<div class="comment-wrap" style="padding-bottom: 15px">
									<div class="comment-block" style="width: 50%; resize: none;">
										<input type="hidden" value="${list.qna_board_num }" class="qnaNum" />
										<p class="comment-writer" style="padding-top: 20px;padding-left: 20px;">${list.user_id }</p>
										<p class="comment-text" style="padding-left: 20px;">${list.qna_board_content }</p>
										<div class="comment-date" style="color: lightslategray;padding-left: 20px;">${list.qna_board_date }</div>
										<div class="bottom-comment" style="margin: 20px auto;width: 100%;">
										
											<ul class="comment-actions" style="width: 100%;text-align: end;height: 60px;">

												<c:if test="${sessionScope.userId == list.user_id }">

													<a href="#" onclick="return false;"
														class="modifyQna genric-btn orange radius modify">수정</a>
													<a href="#" onclick="return false;"
														class="updateQna genric-btn orange radius modify">수정완료</a>
													<a href="#" onclick="return false;"
														class="updateQnaCancel genric-btn orange radius modify">수정취소</a>
														</c:if>
														<c:if test="${sessionScope.userId == list.user_id || sessionScope.memberLv == 9 }">
													<a href="#" onclick="return false;"
														class="deleteQna genric-btn orange radius delete">삭제</a>
												</c:if>

											</ul>
											
											
											
											
											<c:if test="${fn:length(list.qnaReplyVO) >= 1}">
											
												<c:forEach items="${list.qnaReplyVO}" var="reply">
												<div class="row" style="flex-wrap:nowrap;color:black;">
												<div class="col-md-2">
												<label for="reply_writer">${reply.reply_user_id}</label>
												</div>
												<div class="col-md-8">
												${reply.qna_reply_content}
												</div>
												<div class="col-md-2">
													<c:if test="${sessionScope.userId == reply.reply_user_id }">
														<a href="#" onclick="deleteReply(${reply.qna_reply_num});"
															class="genric-btn orange radius delete" style="float:right;">댓글삭제</a>
												</c:if>
												</div>
												</div>
													<%-- <tr>
														<td>
															<label for="reply_writer">${reply.reply_user_id}</label>
														</td>
														<td>
															<input type="text" value="${reply.qna_reply_content}" style="border-color: black; border: solid; width: 500%;" disabled>
															
															<textarea name="qna_reply_content" id="" cols="150" rows="2"
															style="width: 80%; resize: none; border-color: black; border: solid;"
															placeholder="Add comment..."><c:out value="${reply.qna_reply_content}" /></textarea>
														</td>
														
											<div class="qna_reply_content">${reply.qna_reply_content}
											
											
											<div class=""></div>
											
											</div>
											
											
											
												
														
														
													</tr> --%>
													<hr style="margin: 0px;"/>
												</c:forEach>
											
											</c:if>
											<div style="width: 100%; height: 120px;">
											<a href="#" onclick="return false;" class="replyQna genric-btn orange radius modify" style="margin: 10px;float: right;">댓글(${list.qna_reply_count})</a>
											</div>
											<div class="replyArea row" style="margin: 20px auto;">
			
														<div class="col-md-2">
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
															</c:choose></div>
														<div class="col-md-8"><input type="text"
															name="reply_content" class="reply_content"
															style="box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.8); width: 100%;">
														</div>
														<div class="col-md-2"><a href="#"
															onclick="return false;"
															class="replyQnaSubmit genric-btn orange radius modify"
															style="margin-left: 10px; float: rigth;">등록</a></div>
												
											</div>
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