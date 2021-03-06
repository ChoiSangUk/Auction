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
													id="userLevelchk1" type="checkbox" value="구매자" name="userLevel"> 구매자
												</label><label class="checkbox-inline"> <input
													id="userLevelchk2" type="checkbox" value="판매자" name="userLevel"> 판매자
												</label>
												
											</div>
										</td>
										
									</tr>
									<tr>
										<th class="text-center active">회원성별</th>
									<td>
										
											<div>
												<label class="radio-inline" style="margin-left: 15px;"> <input
													id="userGenderRadio1" type="radio" value="남" name="userGender"> 남
												</label><label class="radio-inline"> <input
													id="userGenderRadio2" type="radio" value="여" name="userGender"> 여
												</label>
												
											</div>
										</td>
										
									</tr>
									<tr>
										<th class="text-center active">회원등급</th>
										<td>
											<div>
												<label class="radio-inline" style="margin-left: 15px;"> <input type="radio"
													id="gradeCodeRadio1" value="grade4" name="gradeCode"> 일반회원
												</label> <label class="radio-inline"> <input type="radio"
													id="gradeCodeRadio2" value="grade3" name="gradeCode"> 우수회원
												</label> <label class="radio-inline"> <input type="radio"
													id="gradeCodeRadio3" value="grade2" name="gradeCode"> VIP
												</label> <label class="radio-inline"> <input type="radio"
													id="gradeCodeRadio4" value="grade1" name="gradeCode"> VVIP
												</label> 
											</div>
											
										</td>
										
									</tr>
									<tr>
										<th class="text-center active" rowspan="2">조회방법</th>
										<td>
											
											<div>
												<label class="radio-inline" style="margin-left: 15px;"> <input type="radio"
													id="restrictRadio1" value="restrict1" name="restrictCode"> 정상
												</label> <label class="radio-inline"> <input type="radio"
													id="restrictRadio2" value="restrict2" name="restrictCode"> 입찰제한
												</label> <label class="radio-inline"> <input type="radio"
													id="restrictRadio3" value="restrict3" name="restrictCode"> 판매제한
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
				<div id="modalLayer" >
						  <div class="modalContent" style="overflow:scroll;">
						    <h3>캐쉬내역</h3> 
						    <table class="table table-bordered">
						    <thead>
						    	<tr class="active">
						    		<th>아이디</th>
						    		<th>금액</th>
						    		<th>날짜</th>
						    		<th>상태</th>
						    	</tr>
						    </thead>
						    <tbody id="test123" ></tbody>
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
	  
	  //모달띄우기
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
	  
	  
	  //캐쉬내역모달
	  $('.modalLink').click(function(){
		  var id = $(this).attr('dataCode');
		$.ajax({
			url : '${pageContext.request.contextPath}/userIdAjax',
			method: 'post',
			data: {'userId' : id},
			datatype : 'json',
			success:function(data){
 			/* 	console.log(data.length);
				console.log(data);  */
				
				var hi = '';				
			if(data.length > 0) {	
			 	for(var i=0; i<data.length; i++){
					/* console.log(i);
					console.log(data[i]);  */
					var cashPrice =data[i].cashPrice;
					var cashDate =data[i].cashDate;
					var cashState =data[i].cashState;
	
					hi +='<tr>';
						hi +='<td>'+id+'</td>';
						hi +='<td>'+cashPrice+'원</td>';
						hi +='<td>'+cashDate+'</td>';
						hi +='<td>'+cashState+'</td>';
					hi +='</tr>';
									
			 	}
		 	}else{
		 		hi += '<td>거래내역이 없습니다.</td>';
		 	}
				$('#test123').html(hi);		 	
							
	
			},
			error:function(){
				 alert("error!");
			}
		}); 
	  });
});

$(document).ready(function(){

	if('${param.userLevel}' == '구매자'){
		$("input:checkbox[id='userLevelchk1']").prop("checked", true);
	}if('${param.userLevel}' == '판매자'){
		$("input:checkbox[id='userLevelchk2']").prop("checked", true);
	}if('${param.userGender}' == '남'){
		$("input:radio[id='userGenderRadio1']").prop("checked", true);
	}if('${param.userGender}' == '여'){
		$("input:radio[id='userGenderRadio2']").prop("checked", true);
	}if('${param.gradeCode}' == 'grade4'){
		$("input:radio[id='gradeCodeRadio1']").prop("checked", true);
	}if('${param.gradeCode}' == 'grade3'){
		$("input:radio[id='gradeCodeRadio2']").prop("checked", true);
	}if('${param.gradeCode}' == 'grade2'){
		$("input:radio[id='gradeCodeRadio3']").prop("checked", true);
	}if('${param.gradeCode}' == 'grade1'){
		$("input:radio[id='gradeCodeRadio4']").prop("checked", true);
	}if('${param.restrictCode}' == 'restrict1'){
		$("input:radio[id='restrictRadio1']").prop("checked", true);
	}if('${param.restrictCode}' == 'restrict2'){
		$("input:radio[id='restrictRadio2']").prop("checked", true);
	}if('${param.restrictCode}' == 'restrict3'){
		$("input:radio[id='restrictRadio3']").prop("checked", true);
	}if('${param.restrictCode}' == 'restrict4'){
		$("input:radio[id='restrictRadio4']").prop("checked", true);
	}
	
	
});
	
</script>
<c:import url="/resources/module/admin_footer.jsp" charEncoding="UTF-8" />