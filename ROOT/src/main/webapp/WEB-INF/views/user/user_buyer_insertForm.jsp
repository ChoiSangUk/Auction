<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />
<!--
user_level = 구매자
grade_code = grade1
restrict_code =	restrict1
user_totalcash = 0
defult 값
-->
<div>
	<h2>구매자 회원가입</h2>
</div>
<div>
	<form role="form" id="addForm" class="well form-search" action="${pageContext.request.contextPath}/user/userBuyerInsertForm" method="post">
		<div class="form-group">
			<label for="userId">아이디</label> <input type="text"
				class="form-control" id="userId" name="userId" placeholder="아이디">
		</div>
		<div class="form-group">
			<label for="userPassword">비밀번호</label> <input type="password"
				class="form-control" id="userPassword" name="userPassword"
				placeholder="비밀번호">
		</div>
		<div class="form-group">
			<label for="chkpassword">비밀번호 확인</label> <input type="password"
				class="form-control" id="chkpassword" name="chkpassword"
				placeholder="비밀번호 확인">
			<font name="check" size="2" color="red"></font>
		</div>
		<div class="form-group">
			<label for="userName">이름</label> <input type="text"
				class="form-control" id="userName" name="userName"
				placeholder="이름을 입력해 주세요">
		</div>
		<div class="form-group">
			<label for="userGender">성별</label> <br> 남<input type="radio"
				id="userGender" name="userGender" value="남" placeholder="남">				
												여<input type="radio"
				id="userGender" name="userGender" value="여" placeholder="여">
		</div>
		<div class="form-group">
			<label for="userBirth">주민번호</label> <input type="text"
				class="form-control" id="userBirth" name="userBirth"
				placeholder="주민번호 입력해 주세요">
		</div>
		<div class="form-group">
			<label for="user_phone">연락처</label> <input type="text"
				class="form-control" id="userPhone" name="userPhone"
				placeholder="연락처 입력해 주세요">
		</div>
				<div class="form-group">
			<label for="user_email">이메일</label> <input type="email"
				class="form-control" id="userEmail" name="userEmail"
				placeholder="이메일 입력해 주세요">
		</div>
		<label for="user_email">주소</label> 
		<input type="text" id="sample6_postcode" name="userPostcode" placeholder="우편번호" readonly="readonly">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" name="userAddr" placeholder="주소" readonly="readonly">
		<input type="text" id="sample6_address2" name="userAddrdetail" placeholder="상세주소">
		<div class="form-group text-center">
			<button type="submit" class="btn btn-info">
				회원가입<i class="fa fa-check spaceLeft"></i>
			</button>
			
			<button type="reset" class="btn btn-warning">
				가입취소<i class="fa fa-times spaceLeft"></i>
			</button>
			<!-- 가입취소시  -->
		</div>
	</form>
</div>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/userinsertForm.js">
 
</script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />