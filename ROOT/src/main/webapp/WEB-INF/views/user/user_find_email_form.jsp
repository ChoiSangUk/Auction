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
			<span style="color: #1266FF">이메일찾기</span>
			<h2>이메일찾기</h2>
		</div>
		<!-- 내용1 -->
		<div class="row content">				
			<form action="${pageContext.request.contextPath}/user/userFindEmailForm" method="post">
				<div>
					<a href="${pageContext.request.contextPath}/user/userFindIdForm">아이디을 잊어버렸으면 클릭</a>
				</div>
				<div>
					<a href="${pageContext.request.contextPath}/user/userFindPwForm">비밀번호을 잊어버렸으면 클릭</a>
				</div>
				<div>
					<ul>
						<li>이름과 주민번호를 정확히 입력해주세요.</li>
						<li>아이디는 메일로 발송됩니다.</li>
					</ul>
				</div>
					이름 : <input type="text" id="userName" name="userName">		
					주민번호 : <input type="text" id="userBirth" name="userBirth">
					<button type="submit">찾기</button>
				</form>
			</div>
			<c:if test="${user ne null}">
				<h3>${user.userName}님의 이메일은 ${user.userEmail}입니다.</h3>
			</c:if>	
		</div>

		</div>
		<!-- 내용2 -->
		<div class="row content">	
				
			
		</div>
			
	<!-- 오른쪽 여백 -->		
	<div class="col-sm-1"></div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />