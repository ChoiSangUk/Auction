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
			<span style="color: #1266FF">비밀번호찾기</span>
			<h2>비밀번호찾기</h2>
		</div>
		<!-- 내용1 -->
		<div class="row content">				
				<form action="${pageContext.request.contextPath}/user/userFindPwForm" method="post">
					아이디 : <input type="text" id="userId" name="userId">		
					email : <input type="text" id="userEmail" name="userEmail">
					<button type="submit">dd</button>
					
					
				</form>
				
			</div>
		</div>

		</div>
		<!-- 내용2 -->
		<div class="row content">				
			

		</div>
			
	<!-- 오른쪽 여백 -->		
	<div class="col-sm-1"></div>

<c:import url="/resources/module/footer.jsp" charEncoding="UTF-8" />