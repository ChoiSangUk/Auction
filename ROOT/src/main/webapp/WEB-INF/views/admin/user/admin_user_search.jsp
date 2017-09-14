<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/admin_top.jsp" charEncoding="UTF-8" />
<style>

.mask{width:100%; height:100%; position:fixed; left:0; top:0; z-index:10; background:#000; opacity:.5; filter:alpha(opacity=50);}

#modalLayer{display:none; position:relative;}
#modalLayer .modalContent{width:440px; height:400px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; top:50%; z-index:11; background:#fff;}
#modalLayer .modalContent button{position:absolute; right:0; top:0; cursor:pointer;}

</style>
<div class="container-fluid">
	<div class="col-sm-1"></div>
	<form name="AdminUserSeach" id="AdminUserSeach" method="post"
			class="form-horizontal" action="${pageContext.request.contextPath}/user/adminUserSearch">
	<div class="col-sm-10">
		<div class="row title">
		<!-- 메인화면  -->
		<h1>회원검색</h1>
		<div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/user/adminUserSearch">회원검색</a></li>
			<li><a href="${pageContext.request.contextPath}/user/adminRemoveUserSearch">탈퇴회원검색</a></li>
			<li><a href="#">사용자캐쉬내역검색</a></li>
		</ul>
		</div>

		</div>
		
		<div class="row content">
			<div class="tableDefault mb30">
						<div class="tableDefault mb30">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<th class="text-center active">회원구분</th>
									<td>
										
											<div>
												<label class="checkbox-inline" style="margin-left: 15px;"> <input
													type="checkbox" value="구매자" name="userLevel"> 구매자
												</label><label class="checkbox-inline"> <input
													type="checkbox" value="판매자" name="userLevel"> 판매자
												</label>
												
											</div>
										</td>
										
									</tr>
									<tr>
										<th class="text-center active">회원성별</th>
									<td>
										
											<div>
												<label class="radio-inline" style="margin-left: 15px;"> <input
													type="radio" value="남" name="userGender"> 남
												</label><label class="radio-inline"> <input
													type="radio" value="여" name="userGender"> 여
												</label>
												
											</div>
										</td>
										
									</tr>
									<tr>
										<th class="text-center active">회원등급</th>
										<td>
											<div>
												<label class="radio-inline" style="margin-left: 15px;"> <input type="radio"
													value="grade4" name="gradeCode"> 일반회원
												</label> <label class="radio-inline"> <input type="radio"
													value="grade3" name="gradeCode"> 우수회원
												</label> <label class="radio-inline"> <input type="radio"
													value="grade2" name="gradeCode"> VIP
												</label> <label class="radio-inline"> <input type="radio"
													value="grade1" name="gradeCode"> VVIP
												</label> 
											</div>
											
										</td>
										
									</tr>
									<tr>
										<th class="text-center active" rowspan="2">조회방법</th>
										<td>
											
											<div>
												<label class="radio-inline" style="margin-left: 15px;"> <input type="radio"
													value="restrict1" name="restrictCode"> 정상
												</label> <label class="radio-inline"> <input type="radio"
													value="restrict2" name="restrictCode"> 입찰제한
												</label> <label class="radio-inline"> <input type="radio"
													value="restrict3" name="restrictCode"> 판매제한
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<td>
																
											<div class="col-sm-2">
												<select class="form-control" name="sk">
													<option value="userId">아이디</option>
													<option value="userName">이름</option>
													<option value="userPhone">연락처</option>
													<option value="userEmail">이메일</option>
													<option value="userAddr">주소</option>
												</select>
											</div>
											
											
											<div class="input-group col-sm-4">
												<input type="text" class="form-control" name="sv" placeholder="Search">
											</div>
										</td>
									</tr>
								</tbody>

							</table>
						</div>
					</div>
					<div class="row text-center btn-col-2">
						<input class="btn btn-info btn-lg" type="submit" id="submitBtn" value="검색">
						<input class="btn btn-lg" type="reset" id="resetBtn" value="검색삭제">
					</div>
					<c:if test="${userSearch ne null }">
				<h1>검색결과</h1>
			<table class="table table-bordered">
				<thead>
					<tr class="active">
						<th>아이디</th>
						<th>권한</th>
						<th>등급</th>
						<th>제한</th>
						<th>이름</th>
						<th>성별</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>주소</th>
						<th>상세주소</th>
						<th>보유캐쉬</th>
						<th>회원가입날짜</th>						
					</tr>
				</thead>
			<c:forEach var="userSearch" items="${userSearch}">
				<tbody>
					<tr>
						<td><strong>${userSearch.userDetailVo.userId}</strong></td>
						<td>${userSearch.userDetailVo.userLevel}</td>
						<td>${userSearch.gradeVo.gradeName}</td> 
						<td>${userSearch.restrictVo.restrictState}</td>
						<td>${userSearch.userDetailVo.userName}</td>
						<td>${userSearch.userDetailVo.userGender}</td>
						<td>${userSearch.userDetailVo.userPhone}</td>
						<td>${userSearch.userDetailVo.userEmail}</td>
						<td>${userSearch.userDetailVo.userAddr}</td>
						<td>${userSearch.userDetailVo.userAddrdetail}</td>
						<td><a href="#" class="modalLink" dataCode="${userSearch.userDetailVo.userId}">${userSearch.userDetailVo.userTotalcash}</a></td>
						<td>${userSearch.userDetailVo.userJoindate}</td>
						
						 
					</tr>
					</tbody>
				</c:forEach>
			</table>

			<!-- 캐쉬내역모달 -->
				<div id="modalLayer">
						  <div class="modalContent">
						    <h5>캐쉬내역</h5> 
						    <table border="1">
						    	<tr>
						    		<th>금액</th>
						    		<th>날짜</th>
						    		<th>상태</th>
						    	</tr>
						    	<c:forEach var="userList" items="${userList}">
						    	<tr>						    	
						    		<td>${userList.cashPrice}</td>
						    		<td>${userList.cashDate}</td>
						    		<td>${userList.cashState}</td>
						    	 </tr>
						    	</c:forEach>
						    </table>
						    
						    
						    
						    <button type="button">닫기</button>
						  </div>
				</div>
		</c:if>
				</div>

		<!-- 결과값 테이블 -->
		<div class="row content text-center">
			
		</div>
	</div>
	</form>
	<div class="col-sm-1"></div>
	
</div>
<script>
$(document).ready(function(){
	  var modalLayer = $("#modalLayer");
	  var modalLink = $(".modalLink");
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2; 
	  
	  modalLink.click(function(){
	    
		  modalLayer.fadeIn("slow");
	    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
	    $(this).blur();
	    $(".modalContent > a").focus(); 
	    return false;
	  });	

	  $(".modalContent > button").click(function(){
	    modalLayer.fadeOut("slow");
	    modalLink.focus();
	  });	
	  
	  
	  
	  $('.modalLink').click(function(){
		  var id = $(this).attr('dataCode');
			console.log(id);
		$.ajax({
			url : '${pageContext.request.contextPath}/userIdAjax',
			method: 'post',
			data: {'userId' : id},
			datatype : 'json',
			success:function(data){
				/* var Jdata = JSON.parse(data); */
				console.log(Object.keys(data).length);
				console.log(data);
				
				
			/* 	for(int i=0; i<data.length; i++){
					console.log(data[i]);
				} */
			/* 	var a = JSON.parse(data[0]);
				console.log(a); */
			},
			error:function(){
				 alert("error!");
			}
		}); 
	  });
});
/* $.ajax({
	url : './boardSearchList',
	method : 'get',
	data : { 'userId': $('#userId').val()	// 검색창에 입력한 게시자 아이디
			,'snsBoardWeather'	: $('#snsBoardWeather').val()	// 선택한 날씨
			,'snsBoardTall'		: $('#snsBoardTall').val()		// 선택한 키
			,'snsBoardSize'		: $('#snsBoardSize').val()		// 선택한 체형
			,'snsBoardLoc'		: $('#snsBoardLoc').val()		// 선택한 지형
			,'snsBoardGender'	: $(":input:radio[name=snsBoardGender]:checked").val() // 선택한 성별(라디오 버튼)
			,'snsBoardAge'		: $('#snsBoardAge').val()		// 선택한 연령대
			,'colorValue'		: colorValue					// 선택한 색상 체크박스 배열
			,'styleValue'		: styleValue					// 선택한 스타일 체크박스 배열 
			,'situationValue'	: situationValue				// 선택한 상황 체크박스 배열
			},
	datatype : 'json',
	success : function(data){
		console.log(data);
		var boardHtml = '';	// 검색 결과를 html으로 나타낼 변수 초기화
		if(data.length > 0) {	// 검색 조건에 해당하는 검색 결과가 존재하는 경우
			for(var i=0; i<data.length; i++) {
				boardHtml += '<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4" >';
				boardHtml += '<div class="sns-photo-box cursor-click" value="'+data[i].snsBoardNo+'">';
				boardHtml += '<div class="image-wrap" style="float: left; margin: 5px; overflow: hidden;">';
				boardHtml += '<img style="display: inline-block; width: 100%; min-height: 100%;" height: auto" alt="no image" onError="this.src=\'resources/files/images/defaut.jpg\';" src="'+data[i].snsBoardImg+'">';
				boardHtml += '<div class="likes">';
				boardHtml += '<i class="material-icons center" style="color:#FFB2F5;font-size:24px;">thumb_up</i>';
				boardHtml += '<span class="center">&nbsp;'+data[i].snsLikeCount+'&nbsp;&nbsp;&nbsp;</span>';
				boardHtml += '<i class="fa fa-commenting center" style="font-size:24px"></i>';
				boardHtml += '<span class="center">&nbsp;'+data[i].snsCommentCount+'</span>';
				boardHtml += '</div>';
				boardHtml += '</div>';
				boardHtml += '</div>';
				boardHtml += '</div>';
				
			}
		} else {	// 검색 조건에 해당하는 결과가 없을 경우
			boardHtml += '<span>일치하는 결과가 없습니다.</span>';
		}	
		$('#boardOutput').html(boardHtml);	// 작성한 문장을 출력
		likeAndComment();	// 검색 결과 게시물의 추천수, 댓글수 감추기 및 보이기 함수 호출
		showDetail(data);	// 게시물 상세보기 활성화 함수에 검색 결과를 대입하여 호출
	}
}); */
</script>
<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />