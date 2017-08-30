<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/module/top.jsp" charEncoding="UTF-8" />

<div class="container-fluid">
	<!-- 왼쪽 여백 -->
	<div class="col-sm-1"></div>
	<!-- 가운데 메인 -->
	<div class="col-sm-10">
		<!-- 네이게이션 & 페이지 타이틀 -->
		<div class="row title">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<a href="${pageContext.request.contextPath}/main">홈</a>
			<span>></span>
			<a href="${pageContext.request.contextPath}/mypage/mypageMain">마이페이지</a>
			<span>></span>
			<span style="color: #1266FF">회원정보수정</span>
			<h2>나의 정보관리</h2>
		</div>
		<!-- 내용1 -->
		<c:import url="/resources/module/mypage_info.jsp" charEncoding="UTF-8" />
		<!-- 내용2 -->
		<div class="row content">				
			<!-- 캐쉬 상세내역 -->
		<div>
			<h3>회원정보수정</h3>
			<ul>
				<li>기본정보는 <span class="text-info">필수입력사항</span>입니다. 빠짐없이 채워넣어 주시기 바랍니다.</li>
				<li>정확한 전화번호 및 주소 (이메일 포함)를 입력하셔야 정상적인 거래가 가능합니다. </li>
				<li>부정확한 개인정보로 인한 책임과 불이익은 회원 본인이 감수하게 되오니 개인정보 입력시 <strong
					class="text-info">유의</strong>하시기 바랍니다.</li>
			</ul>
		</div>
		<form role="form" class="well form-search" id="addForm" action="${pageContext.request.contextPath}/mypage/mypageMyinfoUpdate" method="post">
		<div class="form-group">
			<label for="userPassword">변경할 비밀번호</label> <input type="password"
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
			<label for="user_phone">연락처</label> <input type="text"
				class="form-control" id="userPhone" name="userPhone"
				placeholder="연락처 입력해 주세요" value="${userLoginInfo.userPhone}">
		</div>
				<div class="form-group">
			<label for="user_email">이메일</label> <input type="email"
				class="form-control" id="userEmail" name="userEmail"
				placeholder="이메일 입력해 주세요" value="${userLoginInfo.userEmail}">
		</div>
		<label for="user_email">주소</label> 
		<input type="text" id="sample6_postcode" name="userPostcode" placeholder="우편번호" readonly="readonly" value="${userLoginInfo.userPostcode}">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" name="userAddr" placeholder="주소" readonly="readonly" value="${userLoginInfo.userAddr}">
		<input type="text" id="sample6_address2" name="userAddrdetail" placeholder="상세주소" value="${userLoginInfo.userAddrdetail}">
		<div class="form-group text-center">
			<button type="submit" class="btn btn-info">
				회원수정<i class="fa fa-check spaceLeft"></i>
			</button>
		</div>
	</form>
		</div>
	</div>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/userinsertForm.js"></script>
<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />