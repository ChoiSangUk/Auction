<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<style>
.question {
	padding: 20px 10px;
	padding-left: 70px;
	border-bottom: 1px dashed #ddd;
	background: no-repeat 15px 15px;
}

.questionCell {
	display: table-cell;
	vertical-align: middle;
	padding: 12px 0;
	font-size: medium;
}

.questionDiv {
	border-top: 1px solid;
	border-bottom: 1px solid #C3C3C3;
	margin: 0px 200px 0px 200px;
}

.width100 {
	width: 100px;
}

.width180 {
	width: 180px;
}

.width270 {
	width: 270px;
}

.width500 {
	width: 500px;
}
</style>
<div
	style="margin-right: 100px; margin-left: 100px; margin-bottom: 1px;"
	id="top">
	<!-- 헤더 부분 -->
	<div>
		<!-- <div style="margin-top:5px;">
			<span>카테고리 뿌릴 곳</span>
		</div> -->
		<div style="text-align: center">
			<h1 style="font-size: 300%">${auctionGoods.auctionGoodsName}</h1>
		</div>
	</div>
	<!-- 헤더 부분 end -->
	<hr>

	<!-- 물품 정보  -->
	<div class="row content">
		<!-- 왼쪽 물품 정보(사진) -->
		<div class="col-sm-12 col-md-6 image">
			<div class="bigImage" style="text-align: center">
				<img src="${auctionGoodsImages[0].auctionGoodsImagePath}"
					style="width: 400px; height: 450px;" />
			</div>
		</div>
		<!-- 왼쪽 물품 정보(사진)  end-->

		<!-- 오른쪽 물품 정보(내용) -->
		<div class="col-sm-12 col-md-6">
			<div style="text-align: center">
				<h3>
					<span style="color: blue">현재가 : </span> <span class="nowPrice"
						style="color: blue">${nowPrice}</span>
				</h3>

				<h4>
					<span>남은 시간</span> <span style="background-color: #B2EBF4">
						<span class="glyphicon glyphicon-hourglass"></span> <span
						id="timer"> 00:00:00 </span>
					</span>
				</h4>
			</div>

			<span id="instantBuySpan" style="display: none">${auctionGoods.auctionGoodsInstantBuyPrice}</span>
			<span id="SysSpan" style="display: none">${auctionGoods.auctionGoodsSys}</span>
			<span id="bidSysSpan" style="display: none">${auctionGoods.auctionGoodsBidSys}</span>
			<table class="table">
				<tbody>
					<tr>
						<th>판매자</th>
						<th>${auctionGoods.userId}</th>
					</tr>
					<tr>
						<th>물품번호</th>
						<th>${auctionGoods.auctionGoodsCode}</th>
					</tr>
					<tr>
						<th>경매기간</th>
						<th><span>${auctionGoods.auctionGoodsStartDate}</span> ~ <span
							id="endDate">${auctionGoods.auctionGoodsEndDate}</span></th>
					</tr>
					<tr>
						<th>시작가</th>
						<th>${auctionGoods.auctionGoodsStartPrice}</th>
					</tr>
					<tr>
						<th>경매방식</th>
						<th id="Sys"></th>
					</tr>
					<tr>
						<th>입찰방식</th>
						<th id="bidSys"></th>
					</tr>
					<tr>
						<th>입찰단위</th>
						<th>${auctionGoods.auctionGoodsBidUnit}</th>
					</tr>
					<c:choose>
						<c:when test="${auctionGoods.auctionGoodsBidSys eq 'normal'}">
							<tr>
								<th>입찰 수</th>
								<th>${auctionGoods.auctionGoodsBidHits}&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-info btn-sm"
										data-toggle="modal" data-target="#myModal">경매기록보기</button>
								</th>
							</tr>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<div style="text-align: center;" class="myButton">
				<a class="btn btn-primary btn-lg" id="bidButton"
					href="${pageContext.request.contextPath} 
								/bid/bidform?auctionGoodsName=${auctionGoods.auctionGoodsName}
								&userId=${auctionGoods.userId}
								&auctionGoodsBidUnit=${auctionGoods.auctionGoodsBidUnit}
								&auctionGoodsStartPrice=${auctionGoods.auctionGoodsStartPrice}
								&auctionGoodsCode=${auctionGoods.auctionGoodsCode}"= >입찰하기

				</a> <a class="btn btn-default btn-lg questionBtn" href="#questionMain"
					data-toggle="modal" data-target="#doQuestion">문의하기 </a>
			</div>
			<div id="auctionGoodsEnd"
				style="display: none; font-size: 300%; text-align: center; color: red">판매
				종료</div>
		</div>
		<!-- 오른쪽 물품 정보(내용) end -->
	</div>
	<!-- 물품 정보 end -->

	<!--입찰자 리스트 modal.Start  -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="closeBtn" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">입찰자 리스트</h4>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>입찰자</th>
									<th>입찰가격</th>
									<th>입찰시간</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="goodsbid" items="${goodsbidlist}">
									<tr>
										<td>${goodsbid.userBuyerId}</td>
										<td><fmt:formatNumber value="${goodsbid.bidPrice}"
												groupingUsed="true" />원</td>
										<td>${goodsbid.bidDate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
				</div>
			</div>
		</div>
	</div>
	<!--입찰자 리스트 modal.End  -->

	<!-- 물품 상세정보 -->
	<div class="row content">
		<div>
			<ol class="breadcrumb" id="goodsDetail" style="font-size: large;">
				<li><a href="#top">맨 위로</a></li>
				<li class="breadcrumb-item active">물품 상세 내용</li>
				<li><a href="#goodsQuestion">물품 문의</a></li>
			</ol>
		</div>

		<div class="row">
			<div style="width: 100%;">${auctionGoods.auctionGoodsContents}</div>
		</div>


		<div>
			<ol class="breadcrumb" id="goodsQuestion" style="font-size: large;">
				<li><a href="#top">맨 위로</a></li>
				<li><a href="#goodsDetail">물품 상세 내용</a></li>
				<li class="breadcrumb-item active">물품 문의</li>
			</ol>

			<div id="questionMain">
				<div class="questionDiv" align="center"
					style="background-color: #E7E7E7">
					<ul style="">
						<li class="questionCell width100">번호</li>
						<li class="questionCell width180">질문구분</li>
						<li class="questionCell width500">제목</li>
						<li class="questionCell width270">등록자</li>
						<li class="questionCell width180">등록일</li>
					</ul>
				</div>
			</div>
			<div class="text-right questionBtn"
				style="margin: 10px 200px 0px 0px">
				<a href="#none" class="btn btn-success " data-toggle="modal"
					data-target="#doQuestion">문의하기 <span
					class="glyphicon glyphicon-pencil"></span></a>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="doQuestion" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">
								${auctionGoods.auctionGoodsName}</h4>
						</div>

						<!-- Modal Body -->
						<div class="row modal-body">

							<form class="form-horizontal" id="questionForm"
								action="${pageContext.request.contextPath}/question/questionInsert"
								method="post">
								<div class="form-group">
									<label class="control-label col-sm-2">물품 번호</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											name="auctionGoodsCode"
											value="${auctionGoods.auctionGoodsCode}" readonly />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">판매자</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="userSellerId"
											value="${auctionGoods.userId}" readonly />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">질문자</label>
									<div class="col-sm-10">
										<input id="questioner" type="text" class="form-control"
											name="userBuyerId" value="${userLoginInfo.userId}" readonly />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">문의 유형</label>
									<div class="col-sm-10">
										<label class="radio-inline"> <input type="radio"
											name="questionType" value="auctionGoods">상품
										</label> <label class="radio-inline"> <input type="radio"
											name="questionType" value="delivery">배송
										</label> <label class="radio-inline"> <input type="radio"
											name="questionType" value="etc">기타
										</label>
									</div>
								</div>
								<label class="control-label col-sm-2">문의 형식</label>
								<div class="col-sm-10" style="margin-bottom: 10px">
									<label class="radio-inline"> <input type="radio"
										name="questionState" value="normal">공개
									</label> <label class="radio-inline"> <input type="radio"
										name="questionState" value="blind">비공개
									</label>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">제목</label>
									<div class="col-sm-10">
										<input type="text" name="questionTitle" class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-2">내용</label>
									<textarea class="form-control" style="width: 80%"
										name="questionContents" rows="8" placeholder="문의 내용을 입력하시오">
										</textarea>
								</div>
								<!-- Modal Footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">닫기</button>
									<input type="submit" class="btn btn-primary"
										id="questionSubmit" value=" 문의 등록">

								</div>
							</form>

						</div>


					</div>
				</div>
			</div>
			<!-- modal end -->
		</div>

	</div>

</div>
<script>
	var buyerId = "${userLoginInfo.userId}"
	var sellerId = "${auctionGoods.userId}"
	if (buyerId == sellerId) {
		$('.questionBtn').hide();
	}

	//물품문의 등록
	$('#questionSubmit').click(
					function() {
						var params = $('#questionForm').serialize();
						console.log(params)
						$.ajax({
									type : 'post',
									data : params,
									url : '${pageContext.request.contextPath}/question/questionInsert',
									success : function(data) {
										var auctionGoodsCode = "${auctionGoods.auctionGoodsCode}"
										var auctionGoodsCodeJson = {
											"auctionGoodsCode" : auctionGoodsCode
										}
										console.log(auctionGoodsCode)
										$.ajax({
													type : 'get',
													data : auctionGoodsCodeJson,
													datatype : 'json',
													url : '${pageContext.request.contextPath}/question/getQuestion',
													error : function(request,
															status, error) {
														console.log("물품받기ajax 에러")
														console.log("code:"
																		+ request.status
																		+ "\n"
																		+ "message:"
																		+ request.responseText
																		+ "\n"
																		+ "error:"
																		+ error)
														alert('auction goodsList ajax Error');
													},
													success : function(getData) {
														var questionObj = jQuery
																.parseJSON(JSON
																		.stringify(getData));
														console
																.log(questionObj)
														$('#questionMain')
																.empty();
														for (i = 0; i < questionObj.length; i++) {
															if (questionObj[i].questionState == "blind"
																	&& buyerId != sellerId) {
																questionObj[i].questionTitle = "비공개 문의 입니다"
															}
															$('#questionMain')
																	.append(
																			'<div class="questionDiv" align="center">'
																					+ '<ul style="table">'
																					+ '<li class="questionCell width100" class="questionCode">'
																					+ questionObj[i].questionCode
																					+ '</li>'
																					+ '<li class="questionCell width180">'
																					+ questionObj[i].questionType
																					+ '</li>'
																					+ '<li class="questionCell width500">'
																					+ questionObj[i].questionTitle
																					+ '</li>'
																					+ '<li class="questionCell width270">'
																					+ questionObj[i].userBuyerId
																					+ '</li>'
																					+ '<li class="questionCell width180">'
																					+ questionObj[i].questionDate
																					+ '</li>'
																					+ '</ul>'
																					+ '<div class="question" align="center" style="display:none">'
																					+ questionObj[i].questionContents
																					+ '</div>'
																					+ '</div>')
															var questionCode = $(this).find('#questionCode').text();
															var questionCodeJson = {
																"questionCode" : questionCode
															}
															//답변 확인
															$
																	.ajax({
																		type : 'get',
																		data : questionCodeJson,
																		datatype : 'json',
																		url : '${pageContext.request.contextPath}/question/getQuestionReply',
																		error : function(
																				request,
																				status,
																				error) {
																			console
																					.log("답변ajax 에러")
																			console
																					.log("code:"
																							+ request.status
																							+ "\n"
																							+ "message:"
																							+ request.responseText
																							+ "\n"
																							+ "error:"
																							+ error)
																			alert('auction goodsList ajax Error');
																		},
																		success : function(
																				getData) {
																			var questionReplyObj = jQuery
																					.parseJSON(JSON
																							.stringify(getData));
																			console
																					.log('답변추가 ajax까지')
																			if (questionReplyObj.questionReplyCode != "0") {
																				var qrQuestionCode = questionReplyObj.questionCode
																				var questionReplyContents = questionReplyObj.questionReplyContents
																				var questionReplyDate = questionReplyObj.questionReplyDate
																				console
																						.log('답변 div 추가 되나')
																				$(
																						'.questionDiv')
																						.find(
																								'.'
																										+ qrQuestionCode
																										+ '')
																						.append(
																								'<div><span><b>답변 내용 :</b></span>'
																										+ questionReplyObj.questionReplyContents
																										+ '</div>')
																			}
																		}
																	})

														}

														$('.questionDiv')
																.click(
																		function() {
																			var questionCode = $(
																					this)
																					.find(
																							'#questionCode')
																					.text();
																			var questionCodeJson = {
																				"questionCode" : questionCode
																			}

																			console
																					.log('물품 버튼')
																			if ($(
																					this)
																					.find(
																							'.question')
																					.css(
																							'display') == "none") {
																				$(
																						this)
																						.find(
																								'.question')
																						.show();
																			} else {
																				$(
																						this)
																						.find(
																								'.question')
																						.hide();
																			}
																		})
													}
												});
									}
								});
						
						 alert('문의 등록 완료!! \n 닫기를 눌러주세요') 
						return false; //<- 이 문장으로 새로고침(reload)이 방지됨

					});

	//남은 시간 타이머
	var endDate = $("#endDate").text();
	var endDateArray = endDate.split('-');
	var date = new Date(endDateArray[0] + '/' + endDateArray[1] + '/'
			+ endDateArray[2] + ' 00:00:00')

	var now = new Date();
	var result = date.getTime() - now.getTime()
	var resultDate = parseInt((result / (1000 * 60 * 60 * 24)))
	var resultHours = parseInt((result / (1000 * 60 * 60)) % 24)
	var resultMin = parseInt((result / (1000 * 60)) % 60)
	var resultSec = parseInt((result / 1000) % 60)

	var timer = function() {
		if (result > 0) {
			console.log('timer')
			//console.log(result)
			result -= 1000;
			resultDate = parseInt((result / (1000 * 60 * 60 * 24)))
			resultHours = parseInt((result / (1000 * 60 * 60)) % 24)
			resultMin = parseInt((result / (1000 * 60)) % 60)
			resultSec = parseInt((result / 1000) % 60)
			$('#timer').text(
					resultDate + '일' + resultHours + '시' + resultMin + '분'
							+ resultSec + '초')
		}
	};

	$(document)
			.ready(
					function() {
						var auctionGoodsCode = "${auctionGoods.auctionGoodsCode}"
						var auctionGoodsCodeJson = {
							"auctionGoodsCode" : auctionGoodsCode
						}
						$
								.ajax({
									type : 'get',
									data : auctionGoodsCodeJson,
									datatype : 'json',
									url : '${pageContext.request.contextPath}/question/getQuestion',
									error : function(request, status, error) {
										console.log("물품받기ajax 에러")
										console.log("code:" + request.status
												+ "\n" + "message:"
												+ request.responseText + "\n"
												+ "error:" + error)
										alert('auction goodsList ajax Error');
									},
									success : function(getData) {
										var questionObj = jQuery.parseJSON(JSON
												.stringify(getData));
										console.log(questionObj)
										for (i = 0; i < questionObj.length; i++) {
											if (questionObj[i].questionState == "blind"
													&& buyerId != sellerId) {
												questionObj[i].questionTitle = "비공개 문의 입니다"
											}

											$('#questionMain')
													.append(
															'<div class="questionDiv btn btn-default" align="center">'
																	+ '<ul style="table">'
																	+ '<li class="questionCell width100">'
																	+ questionObj[i].questionCode
																	+ '</li>'
																	+ '<li class="questionCell width180">'
																	+ questionObj[i].questionType
																	+ '</li>'
																	+ '<li class="questionCell width500">'
																	+ questionObj[i].questionTitle
																	+ '</li>'
																	+ '<li class="questionCell width270">'
																	+ questionObj[i].userBuyerId
																	+ '</li>'
																	+ '<li class="questionCell width180">'
																	+ questionObj[i].questionDate
																	+ '</li>'
																	+ '</ul>'
																	+ '<div class="question '+questionObj[i].questionCode+'" style="display:none"><hr><span>'
																	+ questionObj[i].questionContents
																	+ '</span></div>'
																	+ '</div>')

										}
										var questionCode = $(this).find(
												'#questionCode').text();
										var questionCodeJson = {
											"questionCode" : questionCode
										}
										//답변 확인
										$
												.ajax({
													type : 'get',
													data : questionCodeJson,
													datatype : 'json',
													url : '${pageContext.request.contextPath}/question/getQuestionReply',
													error : function(request,
															status, error) {
														console
																.log("답변ajax 에러")
														console
																.log("code:"
																		+ request.status
																		+ "\n"
																		+ "message:"
																		+ request.responseText
																		+ "\n"
																		+ "error:"
																		+ error)
														alert('auction goodsList ajax Error');
													},
													success : function(getData) {
														var questionReplyObj = jQuery
																.parseJSON(JSON
																		.stringify(getData));
														console
																.log('답변추가 ajax까지')
														if (questionReplyObj.questionReplyCode != "0") {
															var qrQuestionCode = questionReplyObj.questionCode
															var questionReplyContents = questionReplyObj.questionReplyContents
															var questionReplyDate = questionReplyObj.questionReplyDate
															console
																	.log('답변 div 추가 되나')
															$('.questionDiv')
																	.find(
																			'.'
																					+ qrQuestionCode
																					+ '')
																	.append(
																			'<div><span><b>답변 내용 :</b></span>'
																					+ questionReplyObj.questionReplyContents
																					+ '</div>')
														}
													}
												})
										$('.questionDiv')
												.click(
														function() {

															console
																	.log('물품 버튼')
															if ($(this)
																	.find(
																			'.question')
																	.css(
																			'display') == "none") {
																$(this)
																		.find(
																				'.question')
																		.show()
															} else {
																$(this)
																		.find(
																				'.question')
																		.hide()
															}
														})

									}
								});

						if ($('#questioner').val() == "") {
							$('#questioner').val('guest');
						}
						//즉시구매 
						/* var auctionGoodsInstantBuyPrice = $('#instantBuySpan').text();
						if(auctionGoodsInstantBuyPrice == 0){
							$('#instantBuy').text("즉시구매 불가능");
						}else{
							$('#instantBuy').text(auctionGoodsInstantBuyPrice);
							$('#instantBuy').append('<a class="btn btn-primary" id="bidButton" href="#"> 즉시구매</a>');
						} */

						//경매 방식
						var auctionGoodsSys = $('#SysSpan').text();
						var auctionGoodsBidSys = $('#bidSysSpan').text();

						if (auctionGoodsSys == 'normal') {
							$('#Sys').text("일반 경매");
						} else {
							$('#Sys').text("블라인드 경매");
						}
						if (auctionGoodsBidSys == 'normal') {
							$('#bidSys').text("공개");
						} else {
							$('#bidSys').text("비공개");
						}

						var sellerId = "${auctionGoods.userId}";
						var userId = "${userLoginInfo.userId}";
						var auctionGoodsCode = "${auctionGoods.auctionGoodsCode}";

						if (sellerId == userId) {
							auctionGoodsState = "${auctionGoods.auctionGoodsState}";
							console.log(auctionGoodsState)
							$('#bidButton').hide();

							//
							if (auctionGoodsState == "등록대기" || result > 0) {
								//post 방식으로 변경해야 함
								$('.myButton')
										.append(
												'<a class="btn btn-default btn-lg"'
														+ 'href="${pageContext.request.contextPath}/auctiongoods/auctiongoodsupdate?auctionGoodsCode='
														+ auctionGoodsCode
														+ ' ">수정하기 </a>')
								//post 방식으로 변경해야 함
								//$('.myButton').append( '<a class="btn btn-default btn-lg"' +  
								//		'href="${pageContext.request.contextPath}/auctiongoods/auctiongoodsdelete?auctionGoodsCode='+auctionGoodsCode+' ">삭제하기 </a>')
							}
						}

						//타이머 실행
						timerStop = setInterval("timer()", 1000)
						if (result <= 0) {
							clearInterval(timerStop)
							$('.myButton').hide();
							$('.bidButton').hide();
							$('#auctionGoodsEnd').show();
						}

					})
</script>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />